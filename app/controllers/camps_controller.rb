class CampsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @camps = Camp.all
    if params[:search] != nil && params[:search] != ''
      search = params[:search]
      @camps = Camp.joins(:user).where("title LIKE ? OR body LIKE ? OR name LIKE ?" , "%#{search}%", "%#{search}%", "%#{search}%")    else
      @camps = Camp.all
    end
    @rank_camps = Camp.all.sort {|a,b| b.gooded_users.count <=> a.gooded_users.count}.first(3)
    @camps = @camps.page(params[:page]).per(3)
  end

  def new
    @camp = Camp.new
  end

  def create
    camp = Camp.new(camp_params)
    camp.user_id = current_user.id
    if camp.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    camp = Camp.find(params[:id])
    camp.destroy
    redirect_to action: :index
  end


  def edit
    @camp = Camp.find(params[:id])
  end

  def show
    @camp = Camp.find(params[:id])
    @reviews = @camp.reviews
    @review = Review.new
  end

  def update
    camp = Camp.find(params[:id])
    if camp.update(camp_params)
      redirect_to :action => "show", :id => camp.id
    else
      redirect_to :action => "new"
    end
  end

  def index2
  end

  private
  def camp_params
    params.require(:camp).permit(:title, :body, :genre, :link, :image)
  end
end
