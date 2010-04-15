module Guardian
  module Politics
    
    class Election
      def initialize(json)
        @data = json
      end
      
      def year
        @year ||= @data['year'].to_i
      end
      
      def constituencies
        ApiClient.get(@data['candidates-json-url'])['constituencies'].map do |json|
          Constituency.new(self, json)
        end
      end
      
      def candidates
        @candidates ||= constituencies.map { |c| c.candidates }.flatten
      end
    end
    
  end
end
      
