class HomeController < ApplicationController
  def index
  end

  def history
    @history = History.all
  end

  def log
  end
end
