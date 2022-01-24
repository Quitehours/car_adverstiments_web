module MenuOptions
  class BaseOption
    def name
      raise NotImplementedError, "#{self.class} #{I18n.t('lib.menu_options.error')} '#{__method__}'"
    end

    def description
      raise NotImplementedError, "#{self.class} #{I18n.t('lib.menu_options.error')} '#{__method__}'"
    end

    def action
      raise NotImplementedError, "#{self.class} #{I18n.t('lib.menu_options.error')} '#{__method__}'"
    end

    def show?
      raise NotImplementedError, "#{self.class} #{I18n.t('lib.menu_options.error')} '#{__method__}'"
    end
  end
end
