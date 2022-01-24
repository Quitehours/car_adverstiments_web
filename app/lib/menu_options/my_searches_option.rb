module MenuOptions
  class MySearchesOption < BaseOption
    def name
      I18n.t('lib.menu_options.name.my_searches')
    end

    def description
      I18n.t('lib.menu_options.description.my_searches')
    end

    def action
      '/help'
    end

    def show?
      true
    end
  end
end
