module Guardian
  module Politics
    
    class Constituency
      attr_reader :election
      
      def initialize(election, hash)
        @election, @data = election, hash
      end
      
      def name
        @name ||= @data['name']
      end
      
      def candidates
        @candidates ||= @data['candidates'].map do |json|
          Candidate.new(self, json)
        end
      end
    end
    
  end
end

