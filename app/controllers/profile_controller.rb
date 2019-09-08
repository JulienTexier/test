class ProfileController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create, :update]
def show
  @user = User.all.find(params[:id])
end

def edit

  
end

def update

  current_user.update(profile_params)
  
    if current_user.save
      flash[:success] = 'You account was successfully updated.'
      redirect_to profile_path(current_user.id)
    else
      flash.now[:error] = @order.errors.full_messages.to_sentence
      render :edit
    end
  
end


def profile_params

params.require(:user).permit(:first_name, :last_name, :description)
  
end

end