dir = File.expand_path(File.dirname(__FILE__))
require dir + '/../lib/guardian'
require 'fastercsv'

elections = Guardian::Politics.elections
election_2010 = elections.find { |e| e.year == 2010 }

new_candidates = election_2010.candidates.select do |candidate|
  prior_elections = elections.select { |e| e.candidates.include?(candidate) }
  prior_elections.map { |e| e.year } == [2010]
end

csv = FasterCSV.generate do |table|
  table << ['Name', 'Party', 'Constituency']
  new_candidates.each do |candidate|
    table << [candidate.name, candidate.party_name, candidate.constituency.name]
  end
end

File.open(dir + '/candidates.csv', 'w') { |f| f.write csv }

