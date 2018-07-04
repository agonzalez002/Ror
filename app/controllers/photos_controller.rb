class PhotosController < ApplicationController
  before_action :load_photo, only: [:show, :edit]

  def photo_params
    params.require(:photo).permit(:file, :name, :user_id)
  end

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
    @user = User.find params[:user_id]
  end

  def show
    @photo = Photo.find params[:id]
  end

  def edit
    @photo = Photo.find params[:id]
  end

  def create
    @user = User.find params[:user_id]
    @photo = Photo.new(photo_params)

    @photo.user = @user

    if @photo.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @photo = Photo.find params[:id]
    @user = User.find params[:user_id]

    if @photo.update_attributes(photo_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @photos = Photo.find(params[:id]).destroy
    @user = User.find params[:user_id]

    if @photos.save
      redirect_to @user
    end
  end

  def load_photo
    @user = User.find params[:user_id]
  end
end
