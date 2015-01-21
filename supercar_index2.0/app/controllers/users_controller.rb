class UsersController < ApplicationController

	def new
	  @user = User.new
	end

	def create
	    @user = User.new(user_params)
	    if @user.save
	    	auto_login(@user)
	    	redirect_to new_user_url, notice: "Signed up!"
	    else
		  	flash.now[:alert] = 'Login failed'
		    render "new"
	    end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		logout
    	redirect_to(:users, notice: 'Logged out!')
	end

	private
	  def user_params
	    params.require(:user).permit(:email,:password, :password_confirmation)
	  end

end
