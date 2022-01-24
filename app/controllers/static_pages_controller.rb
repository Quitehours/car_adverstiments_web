class StaticPagesController < ApplicationController
  before_action :options, only: %i[menu help]

  def menu; end

  def help; end

  private

  def options
    @options ||= Menu::MainMenu.new.options
  end
end
