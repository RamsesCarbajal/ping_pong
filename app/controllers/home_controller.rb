class HomeController < ApplicationController
  def index
  end

  def history
puts User.last.inspect
    @history = History.all
  end

  def log
  end
end
