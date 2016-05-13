class RequestDenialsController < ApplicationController
  def destroy
    UserNotifier.request_denied(@request).deliver_now!
    @request = Request.find(params[:clid])
    if @request.present?
      @request.destroy
    end
    redirect_to requestqueue_url
  end
end