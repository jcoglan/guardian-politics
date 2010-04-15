module Guardian
  module Politics
    
    class Candidate
      attr_reader :constituency
      
      def initialize(constituency, hash)
        @constituency, @data = constituency, hash
      end
      
      def name
        @name ||= @data['name']
      end
      
      def party_name
        @party_name ||= @data['party']['name']
      end
    end
    
  end
end

