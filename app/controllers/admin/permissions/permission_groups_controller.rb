class Admin::Permissions::PermissionGroupsController < AdminController
  before_action :set_permission_group, only: [:show, :edit, :update, :destroy]

  add_breadcrumb 'Dashboard', :admin_dashboard_path
  add_breadcrumb 'Permission Groups', :admin_permissions_permission_groups_path, except: [:index]

  # GET /admin/permissions/groups
  # GET /admin/permissions/groups.json
  def index
    authorize :admin_permissions_permission_group

    @permission_groups =
      if params[:type].blank?
        PermissionGroup.all.group_by(&:type)
      else
        type = params[:type].classify
        PermissionGroup.all.where(type: type)&.group_by(&:type)
      end
  end

  # GET /admin/permissions/groups/new
  def new
    @permission_group = PermissionGroup.new
    authorize @permission_group, policy_class: AdminPermissionsPermissionGroupPolicy
  end

  # POST /permission_groups
  # POST /permission_groups.json
  def create
    @permission_group = PermissionGroup.new(permission_group_params)
    authorize @permission_group, policy_class: AdminPermissionsPermissionGroupPolicy

    respond_to do |format|
      if @permission_group.save
        format.html { redirect_to edit_admin_permissions_permission_group_path(@permission_group), notice: 'PermissionGroup was successfully created.' }
        # format.json { render :show, status: :created, location: @permission_group }
      else
        format.html { render :edit }
        # format.json { render json: @permission_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /admin/permissions/groups/1/edit
  def edit
    authorize @permission_group, policy_class: AdminPermissionsPermissionGroupPolicy
  end

  # PATCH/PUT /admin/permissions/groups/1
  # PATCH/PUT /admin/permissions/groups/1.json
  def update
    @permission_group.assign_attributes(permission_group_params)
    authorize @permission_group, policy_class: AdminPermissionsPermissionGroupPolicy

    respond_to do |format|
      if @permission_group.save
        format.html { redirect_to edit_admin_permissions_permission_group_path(@permission_group), notice: "#{@permission_group.type} was successfully updated." }
        # format.json { render :show, status: :ok, location: @permission_group }
      else
        format.html { render :edit }
        # format.json { render json: @permission_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/permissions/groups/1
  # DELETE /admin/permissions/groups/1.json
  def destroy
    authorize @permission_group, policy_class: AdminPermissionsPermissionGroupPolicy

    @permission_group.destroy
    respond_to do |format|
      format.html { redirect_to admin_permissions_permission_groups_path, notice:  "#{@permission_group.type} was successfully destroyed." }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission_group
      @permission_group = PermissionGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def permission_group_params
      params.require(:permission_group)
            .permit(:title,
                    :type,
                    permissive_action_ids: [])
    end
end
