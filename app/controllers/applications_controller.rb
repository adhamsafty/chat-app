class ApplicationsController < ApplicationController
  before_action :set_application, only: %i[ show update destroy ]

  #--------------------------------------------------------------
  # GET /applications/:token
  def show
    render json: @application
  end

  #--------------------------------------------------------------
  # POST /applications
  def create
    @application = Application.new(token:generate_token, name:application_params[:name], chats_count:0)

    if @application.save
      render json: {token: @application.token, message: 'Application created successfully'}, status: 200
    else
      render json: { message: 'Error creating application' }, status: 400
    end
  end

  #--------------------------------------------------------------
  # PATCH/PUT /applications/:token
  def update
    if @application.update(application_params)
      render json: {newName: @application.name, message: 'Application name updated successfully'}
    else
      render json: { message: 'Error updating application' }, status: 400
    end
  end

  #--------------------------------------------------------------
  # DELETE /applications/:token
  def destroy
    if @application.destroy
      render json: { message: 'Application deleted successfully' }
    else
      render json: { message: 'Error deleting application' }, status: 400
    end
  end

  #--------------------------------------------------------------
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:token])
    end

    # Only allow a list of trusted parameters through.
    def application_params
      params.require(:application).permit(:name)
    end

    # Generate random token for application.
    def generate_token
      token = SecureRandom.hex(5)
    end
end
