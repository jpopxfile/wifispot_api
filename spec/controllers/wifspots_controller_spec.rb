require 'spec_helper'



describe Api::V1::WifispotsController do
	render_views
	describe 'GET search' do
		it "should enter valid search and get json result" do
			get 'search', {:lang => 'en', :s => 'shinjuku', :format => 'json'}
			expect(response.content_type).to eq("application/json")
			p response.body	
		end
		it "should enter a count of 10 and get 10 results" do
			get 'search', {:lang => 'en', :s => 'shinjuku', :count => "10"}
			expect(response.content_type).to eq("application/json")
			
		end
	end

	describe 'GET gps' do
		it "should enter valid x and y and get json result" do
			get :by_gps, :lang => 'jp', :x_coord => '140.3845965', :y_coord => '35.76410755'
			expect(response.content_type).to eq("application/json")
			
		end
	end
end
