class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable
  after_save :create_history

  def create_history
    history = History.new
    
    history.user = self
    history.score   = 0
    history.save
  end
end
