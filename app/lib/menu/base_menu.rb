module Menu
  class BaseMenu
    attr_reader :options, :context

    def initialize
      @options = self.class.options.map{ |option| option.new}.select(&:show?)
    end

    class << self
      def use_options(*args)
        @options = args
      end

      attr_reader :options
    end
  end
end
