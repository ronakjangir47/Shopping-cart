require 'spec_helper'

describe "StorePages" do
  describe "Catalog page" do
  	before { visit store_path }
  	subject { page }

  	it { should have_selector('title', text: 'Catalog') }
  	it { should have_link('Home', href: '#') }
  	it { should have_link('Questions', href: '#') }
  	it { should have_link('News', href: '#') }
  	it { should have_link('Contact', href: '#') }
  end
end
