class RhetoricsController < ApplicationController
  before_action :find_rhetoric, only: [:show, :destroy, :image]
  include RhetoricsHelper

  def index
    @rhetorics = Rhetoric.all.order("created_at DESC")
  end

  def show
    @rhetoric = Rhetoric.find(params[:id])
    @comment = Comment.new
    @comments = @rhetoric.comments
  end

  def new
    @rhetoric = current_user.rhetorics.build
  end

  def create
    @rhetoric = current_user.rhetorics.build(rhetoric_params)
    prepare_rhetoric_image
<<<<<<< HEAD
    speaker_list = params[:speaker_name].split(",")
    debugger
=======
    speaker_list = params[:tag_name].split(",")
>>>>>>> develop
    if @rhetoric.save
      @rhetoric.save_speakers(speaker_list)
      flash[:success] = "rhetoricが作成されました！"
      redirect_to @rhetoric
    else
      render 'new'
    end
  end

  def destroy
    @rhetoric.destroy
    redirect_to root_path
  end

  def image
    send_data @rhetoric.image, type: @rhetoric.ctype, disposition: 'inline'
  end

    private

<<<<<<< HEAD

=======
>>>>>>> develop
  def rhetoric_params
    params.require(:rhetoric).permit(:title, :description, :meigen)
  end

  def find_rhetoric
    @rhetoric = Rhetoric.find(params[:id])
  end

  def prepare_rhetoric_image
    rhetoric_image = RhetoricsHelper.build(@rhetoric.meigen)
    rhetoric_image.resize "350x350"
    @rhetoric.image = rhetoric_image.tempfile.open.read
    @rhetoric.ctype = rhetoric_image.mime_type
  end

end