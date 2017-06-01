class LcommentsController < ApplicationController
  def lcomment
    puts "뿌라라라#{params[:comment]}"
    @com = Lcomment.new
    @com.comment= params[:comment]
    @com.lpost_id = params[:lpost_id]
    @com.save
    redirect_to "/leposts/#{params[:lepost_id]}/show/#{params[:lpost_id]}"
  end

  def destroy
  end
end
