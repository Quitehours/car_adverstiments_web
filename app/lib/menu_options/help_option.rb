module MenuOptions
  class HelpOption < BaseOption
    def name
      I18n.t('lib.menu_options.name.help_option')
    end

    def description
      I18n.t('lib.menu_options.description.help_option')
    end

    def action
      '/help'
    end

    def show?
      true
    end
  end
end
