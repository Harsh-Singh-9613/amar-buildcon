class OwnersController < ApplicationController
  before_action :find_owner, only:[:edit, :update, :destroy, :show]
  
  def index
     @owners = Owner.all
  end

  def new
     @owner = Owner.new
  end

  def create
  @owner = Owner.create(owner_params)  
    if @owner.save
      flash[:notice] = "Owner sucessfully created" 
      redirect_to owners_path    
    else
      render :new
    end   
  end

  def show
  end
  
  def edit
  end

  def update
    if @owner.update(owner_params)
      flash[:notice] = "Owner Successfully Updated"
      redirect_to owners_path
    else
      render :edit
    end
  end

  # def destroy
  #   @owner.destroy
  #   flash[:alert] = "owner Deleted Successfully "
  #   redirect_to owners_path
  # end

  private

    def find_owner
      @owner = Owner.find(params[:id])
    end
   
    def owner_params
      params.require(:owner).permit(:name, :mobile_number, :balance) 
    end
end
