module Guardian
  module Politics
    
    class Election
      def initialize(json)
        @data = json
      end
      
      def year
        @year ||= @data['year'].to_i
      end
    end
    
  end
end
      
