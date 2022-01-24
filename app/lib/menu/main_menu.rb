module Menu
  class MainMenu < BaseMenu
    use_options ::MenuOptions::HelpOption,
                ::MenuOptions::CarsListOption,
                ::MenuOptions::SearchOption,
                ::MenuOptions::LoginOption,
                ::MenuOptions::SignUpOption,
                ::MenuOptions::MySearchesOption,
                ::MenuOptions::LogoutOption
  end
end
