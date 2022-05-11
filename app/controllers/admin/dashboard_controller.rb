class Admin::DashboardController < Admin::BaseController
  def show
    @num_p = Product.count
    @num_c = Category.count
  end
end
