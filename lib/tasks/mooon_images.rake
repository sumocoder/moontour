require 'csv'


namespace :populate do
  desc "Populate moon images"
  task :moon_images => :environment do
    CSV.foreach('./app/assets/csvs/moon_csv_1.csv', headers: true, :header_converters => :symbol) do |csv_obj|
     if csv_obj[:kml_link] && csv_obj[:kml_link].present?
       MoonImage.create(:taken_at => csv_obj[:taken_utc], :kml_link => csv_obj[:kml_link])
     end
    end
  end
end
