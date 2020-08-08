class Admin::Permissions::UsersController < AdminController
  skip_before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :reset_password]

  add_breadcrumb 'Dashboard', :admin_dashboard_path
  add_breadcrumb 'User Permissions', :admin_permissions_users_path, except: [:index]

  # GET admin/permissions/users
  # GET admin/permissions/users.json
  def index
    authorize :admin_permissions_user

    @users = User.all
    @permission_group_types = PermissionGroup.subclasses.map(&:name)
  end

  # GET admin/permissions/users/1/edit
  # GET admin/permissions/users/1/edit.json
  def edit
    authorize @user, policy_class: AdminPermissionsUserPolicy

    @permission_group_types = PermissionGroup.subclasses
    @permissions_by_klass = PermissiveAction.all.group_by(&:klass)
    @permission_headings =
      PermissiveAction.select(:action).distinct.order(action: :desc).map(&:action)
  end

  # PATCH/PUT admin/permissions/users/1
  # PATCH/PUT admin/permissions/users/1.json
  def update
    authorize @user, policy_class: AdminPermissionsUserPolicy

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_admin_permissions_user_path(@user), notice: "#{@user.full_name} was successfully updated." }
        # format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    # If a user has a useranme, find by that, otherwise find by ID
    @user = User.find_by_slug(params[:id]) || User.find(params[:id])
  end

  def user_params
    params.require(:user)
          .permit(privilege_ids: [],
                  role_ids: [])
  end
end
