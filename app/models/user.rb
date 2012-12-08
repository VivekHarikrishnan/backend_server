class User < ActiveRecord::Base
  attr_accessible :address, :father_name, :name, :profession_id, :title, :gender

  validates :name, presence: true
  validates :gender, presence: true
  before_save :update_title

  def update_title
  	self.title = (self.gender == "m") ? "Mr" : "Mrs"
  end

  def ref
  	(self.gender == "m") ? "S/O" : "D/O"
  end

  def summary
  	@professions = { "1" => "Accountant", "2" => "Advocate",
    "3" => "Doctor", "4" => "Engineer", "5" => "Journalist", "6" => "Professor",
    "7" => "Software Engineer","8" => "Teacher", "9" => "Others" }

  	"#{self.title}. #{self.name} #{self.ref} Mr. #{self.father_name} is \
        #{indefinite_articlerize(@professions[self.profession_id.to_s])} staying at '#{self.address}'"
  end

  def indefinite_articlerize(params_word)
    %w(a e i o u).include?(params_word[0].downcase) ? "an #{params_word}" : "a #{params_word}"
  end

  def gender_to_s
  	(gender == "m")? "Male" : "Female"
  end
end
