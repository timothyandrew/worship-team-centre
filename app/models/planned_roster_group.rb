require 'zip'

class PlannedRosterGroup < ActiveRecord::Base
  has_many :planned_rosters, foreign_key: :group_id

  validates_presence_of :month
  validates_uniqueness_of :month
  accepts_nested_attributes_for :planned_rosters

  def generate_images
    filename = "#{SecureRandom.hex}.zip"
    temp_file = Tempfile.new(filename)

    begin
      Zip::OutputStream.open(temp_file) { |zos| }
      Zip::File.open(temp_file.path, Zip::File::CREATE) do |zip|
        planned_rosters.each do |roster|
          zip.get_output_stream("#{roster.id}.jpg") { |f|  f.puts roster.generate_image.to_blob }
        end
      end
      zip_data = File.read(temp_file.path)
    ensure
      temp_file.close
      temp_file.unlink
    end
  end
end
