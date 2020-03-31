class PhotosController < ApplicationController

 def destroy

      @photo = Photo.find(params[:id])

       room = @photo.room


      @photo.destroy


      @photos = Photo.where(room_id: room.id)


       respond_to :js
 end
 def destroys

      @photo = Photo.find(params[:id])

       annouce = @photo.annouce


      @photo.destroy


      @photos = Photo.where(annouce_id: annouce.id)


       respond_to :js
 end

end
