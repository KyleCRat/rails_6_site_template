class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[index show]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :reset_password]

  # GET /users
  # GET /users.json
  def index
    authorize User
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize @user
  end

  # GET /users/me
  # GET /users/me.json
  def me
    @user = current_user
    authorize @user
    render :show
  end

  # GET /users/new
  def new
    @user = User.new
    authorize @user
  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  # POST /users
  # POST /users.json
  def create
    authorize @user
    @user = User.new(user_params)

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

  # POST /users/reset_password/1
  def reset_password
    @user.send_reset_password_instructions
  end

  private
    def set_user
      # If a user has a useranme, find by that, otherwise find by ID
      @user = User.find_by_slug(params[:id]) || User.find(params[:id])
    end

    def user_params
      params.require(:user)
            .permit(:full_name,
                    :username,
                    :slug,
                    :email)
    end
end
