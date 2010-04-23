module Guardian
  module Politics
    
    class Candidacy
      def initialize(person, hash)
        @person, @data = person, hash
      end

      def year
        @year ||= @data['election']['year'].to_i
      end

      def election_type
        @election_type ||= @data['election']['type']
      end
    end
    
  end
end

