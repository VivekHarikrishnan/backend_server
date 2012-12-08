class UsersController < ApplicationController
  def index
    @professions = { "1" => "Accountant", "2" => "Advocate",
      "3" => "Doctor", "4" => "Engineer", "5" => "Journalist", "6" => "Professor",
      "7" => "Software Engineer","8" => "Teacher", "9" => "Others" }

    @users = User.all
  end

  def new
        @professions = { "1" => "Accountant", "2" => "Advocate",
    "3" => "Doctor", "4" => "Engineer", "5" => "Journalist", "6" => "Professor",
    "7" => "Software Engineer","8" => "Teacher", "9" => "Others" }
    @user = User.new
  end

  def create
  end
end
