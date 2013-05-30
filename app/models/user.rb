class User < ActiveRecord::Base
  attr_accessible :name
  attr_reader     :flash_message

  after_create :made
  after_update :change

  def self.current=(user)
    @@current = user
  end

  def self.current
    @@current
  end

  private
  def made
    @flash_message = "#{User.current.name} made #{self.name}"
  end
  def change
    @flash_message = "#{User.current.name} changed #{self.changes["name"][0]} to #{self.changes["name"][1]}"
  end
end
