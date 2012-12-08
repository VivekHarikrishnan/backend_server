class User < ActiveRecord::Base
  attr_accessible :address, :father_name, :name, :profession_id, :title, :gender

  validates :name, presence: true
  validates :gender, presence: true
  before_save :update_title

  def update_title
  	self.title = (self.gender == "m") ? "Mr" : "Mrs"
  end
end
