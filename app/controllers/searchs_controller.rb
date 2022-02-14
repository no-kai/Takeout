class SearchsController < ApplicationController

  def search

    #　投稿
		if params[:word].present? && params[:model] === "Post" && params[:search] === "perfect"
			@posts = Post.where('title LIKE ?', "#{params[:word]}")
		elsif params[:word].present? && params[:model] === "Post" && params[:search] === "front"
			@posts = Post.where('title LIKE ?', "#{params[:word]}%")
		elsif params[:word].present? && params[:model] === "Book" && params[:search] === "back"
			@posts = Post.where('title LIKE ?', "%#{params[:word]}")
		elsif params[:word].present? && params[:model] === "Book" && params[:search] === "part"
			@posts = Post.where('title LIKE ?', "%#{params[:word]}%")
		else
      # @posts = Post.none
		end

		# ユーザー
		if params[:word].present? && params[:model] === "User" && params[:search] === "perfect"
			@users = User.where('name LIKE ?', "#{params[:word]}")
		elsif params[:word].present? && params[:model] === "User" && params[:search] === "front"
			@users = User.where('name LIKE ?', "#{params[:word]}%")
		elsif params[:word].present? && params[:model] === "User" && params[:search] === "back"
			@users = User.where('name LIKE ?', "%#{params[:word]}")
		elsif params[:word].present? && params[:model] === "User" && params[:search] === "part"
			@users = User.where('name LIKE ?', "%#{params[:word]}%")
		else
      # @users = User.none
    end
  end
end



