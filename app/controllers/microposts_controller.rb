class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    if params[:tag]
      @tag = Tag.find_by(name: params[:tag])
      @micropost = Micropost.tagged_with(params[:tag])
    else
      @micropost = Micropost.all
    end
  end
  def create
    # byebug
    @micropost = current_user.microposts.build(micropost_params)
    # byebug
    if @micropost.save
      render json: {
        status: :success,
        content: render_to_string(partial: "microposts/micropost",
          locals: {
            micropost: @micropost.reload
          }
          )
      }
    else
      render json: {status: "error"}, status: :unprocessable_entity
    end
      # if @micropost.save
      #   flash[:success] = "Micropost created!"
      #   redirect_to root_url
      # else
      #   @feed_items = []
      #   render 'static_pages/home'
      # end
  end

  def destroy
    @micropost.destroy
    # flash[:success] = "Micropost deleted"
    # redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture, :all_tags)
    end

    def correct_user
      @micropost = Micropost.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
