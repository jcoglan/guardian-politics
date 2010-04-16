module Guardian
  module Politics
    
    class Person
      def initialize(json)
        @data = json
      end
      
      def candidacies
        @candidacies ||= @data['person']['candidacies'].map do |json|
          Candidacy.new(self, json)
        end
      end
    end
    
  end
end

