class User < ActiveRecord::Base
  attr_accessible :address, :father_name, :name, :profession_id

  validate :name, presence: true
end
