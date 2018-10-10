class UsersController < ApplicationController
  before_action :authenticate_with_http_digest
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  # GET /users
  # GET /users.json
  def index
    @user = User.all
    authorize @user
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize @user
  end

  # GET /users/new
  def new
    authorize @user
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    authorize @user
    if params[:user][:role_ids].nil?
      redirect_to user_path(@user), :alert => "Role necessary"
      return
    end
    @user.role_ids = params[:user][:role_ids]

    token, enc = Devise.token_generator.generate(User, :reset_password_token)

    @user.password = token
    @user.reset_password_token = enc
    @user.reset_password_sent_at = Time.now.utc
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize @user
    @user.assign_attributes secure_params
    if params[:user][:role_ids].nil?
      redirect_to edit_user_path(@user), :alert => "Role Necessary"
      return
    end
    @user.role_ids = params[:user][:role_ids]
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :preferred_contact, :phone)
    end
end
