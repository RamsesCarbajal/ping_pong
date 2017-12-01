class HomeController < ApplicationController
  def index
    @history = History.all.order("score desc")
  end

  def history
    @history = History.all
  end

  def log
  end
end
