module MenuOptions
  class SearchOption < BaseOption
    def name
      I18n.t('lib.menu_options.name.search_option')
    end

    def description
      I18n.t('lib.menu_options.description.search_option')
    end

    def action
      'search/index'
    end

    def show?
      true
    end
  end
end
