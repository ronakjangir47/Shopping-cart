require 'spec_helper'

describe "ProductsPages" do
  describe "List Pages" do
  	
  	before{ visit products_path }
    after(:all) { Product.delete_all }
		subject { page }
  	let!(:product) { Product.first }
  	
  	it { should have_selector('title', text: 'All Products')}
  	it { should have_selector('h1', text: "products") }
  	it { should have_link('New product', href: new_product_path) }
  	
    it { should have_selector('td', text: product.title) }
    it { should have_link('Edit', href: edit_product_path(product)) }
    it { should have_link('Show', href: product_path(product))}
    it { should have_link('Destroy', href: product_path(product)) }
  
  end

  describe "product list page" do
  	let!(:product) { FactoryGirl.create(:product) }

  	before { visit product_path(product) }
		subject { page }

		it { should have_selector('title', text: 'Product Details')}
		it { should have_content(product.title)}
		it { should have_link('Back', href: products_path)}
		it { should have_link('Edit', href: edit_product_path(product))}
  end

  describe "Edit Product Page" do
		let!(:product) { FactoryGirl.create(:product)}

  	before { visit edit_product_path(product) }
		subject { page }

		it { should have_selector('title', text: 'Edit Product')}
		it { should have_link('Back', href: products_path)}
		it { should have_link('Show', href: product_path(product))}

  end	

  describe "New product page" do
		let!(:product) { FactoryGirl.create(:product) }

  	before { visit new_product_path }
		subject { page }

		it { should have_selector('title', text: 'Create Product')}
		it { should have_link('Back', href: products_path)}
		
	end	
end
