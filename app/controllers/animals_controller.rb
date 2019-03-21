class AnimalsController < ApplicationController
 
    def new
        @animal = Animal.new
    end 
    
    def index
        @animals = Animal.all
    end 
    
    def create
        @animal = Animal.new(animal_params)
        if @animal.valid?
            @animal.save
            redirect_to '/animals'
        else
            @errors = @animal.errors.full_messages
            render 'new'
        end
    end 
    def update
        @animal=Animal.find(params[ :id])
        if @animal.update_attributes(animal_params)
            redirect_to '/animals'
        else 
            render 'new'
        end
    end
    def edit
        @animal=Animal.find(params[:id])
    end
     
    def destroy
        @animal =Animal.destroy(params[:id])  
        if @animal.delete   
          flash[:notice] = 'Animal deleted!'   
          redirect_to animals_path
        else   
          flash[:error] = 'Failed to delete this Animal!'   
          render :destroy   
      
        end
    end

  
    private 
    
    def animal_params
        params.require(:animal).permit(:name, :latin_name, :kingdom)
    end
end  