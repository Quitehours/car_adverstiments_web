module MenuOptions
  class CarsListOption < BaseOption
    def name
      I18n.t('lib.menu_options.name.cars_list_option')
    end

    def description
      I18n.t('lib.menu_options.description.cars_list_option')
    end

    def action
      '/cars'
    end

    def show?
      true
    end
  end
end
