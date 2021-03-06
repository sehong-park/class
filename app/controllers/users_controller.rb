class UsersController < ApplicationController
  before_action :not_login_user, only: [:new]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :owner_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      flash[:success] = t('user.created')
      redirect_to @user
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        flash[:success] = t('user.updated')
        format.html { redirect_to @user }
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
    @user.destroy unless @user.admin?
    
    flash[:danger] = t 'user.destruction_succeed'
    redirect_to users_url
  end

  private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def signed_in_user
      unless signed_in?
        flash[:warning] = t 'user.please_signin'
        redirect_to signin_path
      end
    end
  
    def owner_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:danger] = t 'user.permission_denied'
        redirect_to root_path
      end
    end
  
    def admin_user
      unless current_user.admin?
        flash[:danger] = t 'user.permission_denied'
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :name, :email, :phone, :std_num, :avatar, :password, :password_confirmation)
    end
end
