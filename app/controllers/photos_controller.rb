class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photos, only: [:edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

 def new
  @photos = Photo.new
end

  def create
  @photos = Photo.new(photos_params)
  @photos.user_id = current_user.id
  if @photos.save
 NoticeMailer.sendmail_photo(@photos).deliver
 redirect_to photos_path, notice: "ブログを作成しました！"
 else
   render 'new'
end
end

  def edit
    set_photos
  end

  def update
    set_photos
    @photos.update(photos_params)
    redirect_to photos_path, notice: "ブログを編集しました"
  end

  def destroy
    set_photos
    @photos.destroy
    redirect_to photos_path, notice: "ブログを削除しました"
  end


  private
  def photos_params
    params.require(:photo).permit(:title, :content, :image)
  end

  def set_photos
    @photos = Photo.find(params[:id])
  end
end
