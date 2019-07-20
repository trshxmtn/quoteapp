class RhetoricsController < ApplicationController
  before_action :find_rhetoric, only: [:show, :destroy, :image, :edit, :update]
  include RhetoricsHelper

  def index
    @rhetorics = Rhetoric.all

    if params[:tag_name]
      @rhetorics = @rhetorics.tagged_with("#{params[:tag_name]}")
    end

  end

  def show
    @comment = Comment.new
    @comments = @rhetoric.comments
    @related_rhetorics = @rhetorics.tagged_with("#{@rhetoric.tag_list}") #同じタグが付いているquoteの表示
  end


  def new
    @rhetoric = current_user.rhetorics.build
  end

  def create
    @rhetoric = current_user.rhetorics.build(rhetoric_params)
    prepare_rhetoric_image
    if @rhetoric.save
      flash[:success] = "rhetoricが作成されました！"
      redirect_to @rhetoric
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    prepare_rhetoric_image
    if @rhetoric.update(rhetoric_params)
      flash[:success] = "rhetoricが編集されました！"
      redirect_to @rhetoric
    else
      render 'edit'
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

  def rhetoric_params
    params.require(:rhetoric).permit(:title, :description, :meigen, :tag_list, :speaker_list )
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