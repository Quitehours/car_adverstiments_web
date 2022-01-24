module MenuOptions
  class LogoutOption < BaseOption
    def name
      I18n.t('lib.menu_options.name.logout')
    end

    def description
      I18n.t('lib.menu_options.description.logout')
    end

    def action
      # Controllers::SessionsController.new(context).destroy
    end

    def show?
      true
    end
  end
end
