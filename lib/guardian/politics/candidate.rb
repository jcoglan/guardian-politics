module Guardian
  module Politics
    
    class Candidate
      attr_reader :constituency
      
      def initialize(constituency, hash)
        @constituency, @data = constituency, hash
      end
      
      def id
        @id ||= @data['aristotle-id']
      end
      
      def url
        @url ||= @data['json-url']
      end
      
      def name
        @name ||= @data['name']
      end
      
      def party_name
        @party_name ||= @data['party']['name']
      end
      
      def candidacies
        person.candidacies
      end
      
      def person
        @person ||= Person.new(ApiClient.get(url))
      end
    end
    
  end
end

