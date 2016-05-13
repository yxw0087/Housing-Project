class RequestsController < ApplicationController
  before_action :admin_logged_in, only: [:index,:show, :edit, :update, :destroy]
  

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.paginate(page: params[:page])
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    @request = Request.find(params[:id])
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)
    if @request.save
      @request.send_notification_email
      flash[:info] = 'Confirmation email sent to your school email address.'
      redirect_to root_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    
    @request = Request.find(params[:id])
    if @request.present?
      @request.destroy
    end
    redirect_to requestqueue_url
  end
  
  def decide_request
    @request = Request.find(params[:id])
    if params[:accept]
      @request.send_accept_email
      flash[:success] = 'Request accepted'
    else
      @request.send_deny_email
      flash[:danger] = 'Request denied'
    end
    @request.remove_request(params[:id])
    redirect_to requestqueue_url
  end

  private
    #confirms the admin is logged in
    def admin_logged_in
      unless logged_in?
        flash[:danger] = 'Log in.'
        redirect_to root_url
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:clid, :gender, :building, :room)
    end
end
