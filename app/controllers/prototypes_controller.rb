class PrototypesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, except: [:index, :show]
  before_action :set_prototype, only: [:edit, :update]

  def index
    @prototypes = Prototype.all
  end

  def create
    @prototype = Prototype.create(prototype_params)

    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def new
    @prototype = Prototype.new
  end

  def show
    @comment = Comment.new
    @prototype = Prototype.find(params[:id]) 
    @comments = @prototype.comments.includes(:user)
  end

  def edit
  end

  def update
    @prototype.update(prototype_params)
    if @prototype.valid?
      redirect_to prototype_path(@prototype.id)
    else
      render 'edit'
    end  
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end