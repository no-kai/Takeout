class SearchsController < ApplicationController

  def search
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    # 投稿
    # もし検索欄に何も入ってなかったら全部表示する
		if params[:search] == nil || ""
			@posts= Post.all
		# もし空文字が入っていた場合も全部表示する
		elsif params[:search] == ""
		 	@posts= Post.all
    else # 部分検索
    	@posts= Post.where("body LIKE ?", '%' + params[:search] + '%')
		end
  end
end



