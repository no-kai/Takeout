class InquirysController < ApplicationController
  before_action :authenticate_user!

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver
      flash[:success] = 'お問い合わせを受け付けました。'
      redirect_to posts_path
    else
      render :new
    end
  end


  private

  def inquiry_params
    params.require(:inquiry).permit(:email, :message)
  end
end
