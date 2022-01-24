module MenuOptions
  class LoginOption < BaseOption
    def name
      I18n.t('lib.menu_options.name.login')
    end

    def description
      I18n.t('lib.menu_options.description.login')
    end

    def action
      # Controllers::SessionsController.new(context).create
    end

    def show?
      false
    end
  end
end
