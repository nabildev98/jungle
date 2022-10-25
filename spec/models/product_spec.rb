require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
   
    # a product with all four fields set will indeed save successfully
    it "validates product saves successfully with all fields" do
      @category = Category.new(
        id: 5,
        name: "planters",
        created_at: DateTime.now - 3.days,
        updated_at: DateTime.now
      )
      @product = Product.new(
        name: "4' Basin",
        category: @category,
        price: 150,
        quantity: 7
      )
      @product.save
      expect(@product).to be_valid
    end

    # validates :name, presence: true
    it "validates name value's presence" do
      @category = Category.new(
        id: 5,
        name: "planters",
        created_at: DateTime.now - 3.days,
        updated_at: DateTime.now
      )
      @product = Product.new(
        name: nil,
        category: @category,
        price: 150,
        quantity: 7
      )
      @product.validate
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
  
    # validates :price, presence: true
    it "validates :price, presence: true" do
      @category = Category.new(
        id: 5,
        name: "planters",
        created_at: DateTime.now - 3.days,
        updated_at: DateTime.now
      )
      @product = Product.new(
        name: "5' Basin",
        category: @category,
        quantity: 7
      )
      @product.validate
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    # validates :quantity, presence: true
    it "validates quantity value's presence" do
      @category = Category.new(
        id: 5,
        name: "planters",
        created_at: DateTime.now - 3.days,
        updated_at: DateTime.now
      )
      @product = Product.new(
        name: '12" Basin',
        category: @category,
        price: 150,
        quantity: nil
      )
      @product.validate
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    # validates category, presence: true
    it "validates category value's presence" do
      @category = Category.new(
        id: 5,
        name: "planters",
        created_at: DateTime.now - 3.days,
        updated_at: DateTime.now
      )
      @product = Product.new(
        name: "5' Basin",
        category: nil,
        price: 150,
        quantity: 7
      )
      @product.validate
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
