class AnnoucesController < ApplicationController
  before_action :set_annouce, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]
  before_action :require_same_user, only: [:edit, :update]

def index

   @annouces = current_user.annouces

end
 def new

@annouce = current_user.annouces.build

end

def create

  @annouce = current_user.annouces.build(annouce_params)

  if @annouce.save
    if params[:images]

       params[:images].each do |i|

  @annouce.photos.create(image: i)
        end

     end

@photos = @annouce.photos
redirect_to edit_annouce_path(@annouce), notice:"Votre logement a été ajouté"

  else

       render :new

  end

end

 def show
 @photos = @annouce.photos
 @reviews = @annouce.reviews

        if current_user

            
              @hasReview = @reviews.find_by(user_id: current_user.id)

        end
  end

def edit
  @photos = @annouce.photos

 end

def update

   if @annouce.update(annouce_params)
     if params[:images]

            params[:images].each do |i|

                 @annouce.photos.create(image: i)

            end

      end
      @photos = @annouce.photos
      redirect_to edit_annouce_path(@annouce), notice:"Modification enregistrée..."

   else

       render :edit

   end
 end



  private

        def set_annouce

            @annouce = Annouce.find(params[:id])

     end

 def annouce_params

    params.require(:annouce).permit(:title, :price, :address, :description, :categorie)

end
def require_same_user

    if current_user.id != @annouce.user_id

         flash[:danger] = "Vous n'avez pas le droit de modifier cette page"

         redirect_to root_path

    end

end
end
