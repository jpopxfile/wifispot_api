require 'csv'

namespace :import do
	desc "import stuff"

	task :wifispot =>:environment do
		filename = File.join Rails.root, "wifi.csv"
		CSV.foreach(filename, headers: true ,col_sep: ",") do |row|
			Wifispot.create!(row.to_hash)
		end
	end
end