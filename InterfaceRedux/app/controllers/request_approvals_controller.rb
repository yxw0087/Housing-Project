class RequestApprovalsController < ApplicationController
  def destroy
    @request = Request.find(params[:id])
    UserNotifier.request_approved(@request).deliver_now!
    if @request.present?
      @request.destroy
    end
    redirect_to requestqueue_url
  end
end