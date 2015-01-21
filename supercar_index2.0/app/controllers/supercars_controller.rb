class SupercarsController < ApplicationController

def index
	@supercars = Supercar.all
end

def new
	@supercar = Supercar.new
end

def show
	@supercar = Supercar.find(params[:id])

	if current_user
		@comment = @supercar.comments.build
	end
end

def create
	@supercar = Supercar.new(supercar_params)
	# @supercar.user = current_user
  	if @supercar.save
  		redirect_to supercars_url
  	else
  		render :new
  	end

end




private
def supercar_params
 params.require(:supercar).permit(:manufacturer, :model, :color, :city, :country, :spot_date, :spot_type, :car_class, :photo_url)
end

# def load_user
# 	@user = User.find(params[:user_id])
# end

end


