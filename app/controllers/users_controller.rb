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
    @professions = { "1" => "Accountant", "2" => "Advocate",
    "3" => "Doctor", "4" => "Engineer", "5" => "Journalist", "6" => "Professor",
    "7" => "Software Engineer","8" => "Teacher", "9" => "Others" }
    if params[:apiKey] == "androidAppToRailsAppAPI"
      @user = User.new(params[:user])
      Rails.logger.info "-------------------#{@user}---------------------------------"
      if @user.save
        @summary = "#{@user.title}. #{@user.name} #{@user.ref} Mr. #{@user.father_name} is \
        #{indefinite_articlerize(@professions[@user.profession_id.to_s])} staying at '#{@user.address}'"
      else
      Rails.logger.info "-------------------#{@user.errors.inspect}---------------------------------"

        render :action => :new
      end
    else
      render text: "Invalid API Key. You are not authorized to access"
    end
  end

  def show
        @professions = { "1" => "Accountant", "2" => "Advocate",
    "3" => "Doctor", "4" => "Engineer", "5" => "Journalist", "6" => "Professor",
    "7" => "Software Engineer","8" => "Teacher", "9" => "Others" }
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
      format.pdf { render :layout => false }
    end
  end

  private
  def indefinite_articlerize(params_word)
    %w(a e i o u).include?(params_word[0].downcase) ? "an #{params_word}" : "a #{params_word}"
  end
end
