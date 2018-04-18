
class UsersController < Clearance::UsersController
	 def new
	    @user = User.new
	    render template: "users/new"
	  end

	  def create
	    @user = user_from_params
	    
	    if @user.save
	      sign_in @user
	      redirect_back_or url_after_create
	    else
	      render template: "users/new"
	    end
	  end

	  def edit
 			@user = User.find(params[:id]) 
	  end
	  	
	  

	end
	
	private
	def user_from_params
		User.new(params.require(:user).permit(:email, :password, :avatar, :name))
		
	end