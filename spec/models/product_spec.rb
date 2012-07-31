require 'spec_helper'

describe Product do 
	before { @product = Product.new( title: "Ruby on Rails",
	 description: "this is new way to learn web development", image_url: "cs.png", price: 30.0 ) }

	subject { @product }

	it { should respond_to(:title) }
	it { should respond_to(:description) }
	it { should respond_to(:image_url) }
	it { should respond_to(:price) }

	describe "When title is empty" do
		before { @product.title = "" }
		it { should_not be_valid }
	end

	describe "when description is empty" do
		before { @product.description = "" }
		it { should_not be_valid }
	end

	describe "when image_url is empty" do
		before { @product.image_url = "" }
		it { should_not be_valid }
	end

	describe "when price is less than 0.01" do
		before { @product.price = 0.00 }
		it { should_not be_valid }
	end

	describe "with duplicate title" do
		before do
			product_with_same_title = @product.dup
			product_with_same_title.title = @product.title
			product_with_same_title.save
	  end
		it { should_not be_valid }
	end
  
  describe "image_url with invalid format" do
  	image_urls = ["asf.pdf", "ditmap.bmp", "text.txt"]

  	image_urls.each do |url|
  		before { @product.image_url = url }
  		it { should_not be_valid }
  	end
  end

  describe "image_url with valid format" do
  	image_urls = ["asf.gif", "ditmap.jpg", "text.png"]

  	image_urls.each do |url|
  		before { @product.image_url = url }
  		it { should be_valid }
  	end
  end
end