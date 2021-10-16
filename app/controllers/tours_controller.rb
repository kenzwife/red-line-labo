class ToursController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @tours = Tour.all
    if params[:search] != nil && params[:search] != ''
      search = params[:search]
      @tours = Tour.joins(:user).where("title LIKE ? OR body LIKE ? OR name LIKE ? OR site LIKE ?" , "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      @tours = Tour.all
    end
    @rank_tours = Tour.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}.first(3)
    @tours = @tours.page(params[:page]).per(9)
  end

  def new
    @tour = Tour.new
  end

  def create
    tour = Tour.new(tour_params)
    tour.user_id = current_user.id
    if tour.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    tour = Tour.find(params[:id])
    tour.destroy
    redirect_to action: :index
  end


  def edit
    @tour = Tour.find(params[:id])
  end

  def show
    @tour = Tour.find(params[:id])
    @comments = @tour.comments
    @comment = Comment.new
  end

  def update
    tour = Tour.find(params[:id])
    if tour.update(tour_params)
      redirect_to :action => "show", :id => tour.id
    else
      redirect_to :action => "new"
    end
  end

  def index2
  end

  private
  def tour_params
    params.require(:tour).permit(:title, :body, :genre, :link, :image, :site)
  end
end
