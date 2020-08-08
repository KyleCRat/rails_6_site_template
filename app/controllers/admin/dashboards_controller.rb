class Admin::DashboardsController < AdminController
  add_breadcrumb 'Home', :root_path

  def show
    authorize :admin
  end
end
