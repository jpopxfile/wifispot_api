require 'spec_helper'
require 'json'


describe Api::V1::WifispotsController do
	render_views

	describe 'GET gps' do
		it "valid x_coord and y_coord and should return json result" do
			get :by_gps, :lang => 'jp', :x_coord => '140.3845965', :y_coord => '35.76410755', :count => '10', :distance => '1000', :format => 'json'
			expect(response.content_type).to eq("application/json")
			expect(response.code).to eq("200")
			wifispots = JSON.parse(response.body)
			expect(wifispots[0]['name_jp']).to eq("成田国際空港")
		end

		it "missing x_coord and should return 204" do
			get :by_gps, :lang => 'jp', :y_coord => '35.76410755', :count => '10', :distance => '1000', :format => 'json'
			expect(response.content_type).to eq("text/plain")
			expect(response.code).to eq("204")
			
		end

		it "missing y_coord and should return 204" do
			get :by_gps, :lang => 'jp', :x_coord => '140.3845965', :count => '10', :distance => '1000', :format => 'json'
			expect(response.content_type).to eq("text/plain")
			expect(response.code).to eq("204")
			
		end
	end

	describe 'GET search' do
		it "valid x_coord and y_coord and should return json result" do
			get :search, :lang => 'jp', :s => "新宿", :count => '10', :format => 'json'
			expect(response.content_type).to eq("application/json")
			expect(response.code).to eq("200")
			
		end

		it "missing s and should return 204" do
			get :search, :lang => 'jp', :count => '10', :format => 'json'
			expect(response.content_type).to eq("text/plain")
			expect(response.code).to eq("204")
			expect(response.body).to eq("")
			
		end

		it "should be missing count and get 200" do
			get :search, :lang => 'jp', :s => "新宿", :count => '10', :format => 'json'
			expect(response.content_type).to eq("application/json")
			expect(response.code).to eq("200")
			wifispots = JSON.parse(response.body)
		end
	end
end
