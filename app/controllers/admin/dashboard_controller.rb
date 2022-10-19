class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"

  def show
    @admin_product_count = Product.count
    @admin_category_count = Category.count
  end
end
