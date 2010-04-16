dir = File.expand_path(File.dirname(__FILE__))
require dir + '/politics/election'
require dir + '/politics/constituency'
require dir + '/politics/candidate'
require dir + '/politics/candidacy'
require dir + '/politics/person'

module Guardian
  module Politics
    
    ELECTIONS_ROOT = 'http://www.guardian.co.uk/politics/api/general-election/all/json'
    
    def self.elections
      ApiClient.get(ELECTIONS_ROOT)['elections'].map &Election.method(:new)
    end
    
  end
end

