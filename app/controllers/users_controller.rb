class UsersController < ApplicationController

     def show

        @user = User.find(params[:id])
        @rooms = @user.rooms
        @annouces= @user.annouces
     end

end
