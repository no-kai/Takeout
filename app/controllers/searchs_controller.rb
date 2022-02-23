class SearchsController < ApplicationController

  def search
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))


		if params[:word] #部分検索
    	@posts= Post.where("title like ?", "%#{params[:word]}%").order(created_at: :desc).page(params[:page]).per(8)
    else
      @posts = Post.all.order(created_at: :desc).page(params[:page]).per(8)
		end
  end
end



