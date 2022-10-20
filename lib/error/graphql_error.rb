module Error
  class GraphqlError
    class << self
      def codes
        {
          not_found: "NOT_FOUND",
        }
      end
    end
  end
end
