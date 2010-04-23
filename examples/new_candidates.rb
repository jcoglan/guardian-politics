dir = File.expand_path(File.dirname(__FILE__))
require dir + '/../lib/guardian'
require 'fastercsv'

elections = Guardian::Politics.elections
election = elections.find { |e| e.year == ARGV.first.to_i }

new_candidates = election.candidates.select do |candidate|
  begin
    ge_candidacies = candidate.candidacies.select { |c| c.election_type == "general election" }
    years = ge_candidacies.map { |c| c.year }
    years.min == election.year
  rescue => e
    p e
    puts "Could not get data for #{candidate.name} from #{candidate.url}"
    false
  end
end

csv = FasterCSV.generate do |table|
  table << ['Name', 'Party', 'Constituency']
  new_candidates.each do |candidate|
    table << [candidate.name, candidate.party_name, candidate.constituency.name]
  end
end

File.open(dir + "/candidates-#{election.year}.csv", 'w') { |f| f.write csv }
