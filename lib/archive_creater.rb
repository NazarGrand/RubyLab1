require 'zip'

class ArchiveCreator
  def initialize(output_folder, archive_path)
    @output_folder = output_folder
    @archive_path = archive_path
  end

  def create_zip
    entries = Dir.entries(@output_folder) - %w[. ..] 
    Zip::File.open(@archive_path, Zip::File::CREATE) do |zipfile|
      entries.each do |entry|
        path = File.join(@output_folder, entry)
        if File.directory?(path)
          add_folder_to_zip(zipfile, path, entry) 
        else
          zipfile.add(entry, path) 
        end
      end
    end
    puts "Archive created at #{@archive_path}"
  end

  private

  def add_folder_to_zip(zipfile, folder, parent_folder)
    Dir.foreach(folder) do |entry|
      next if entry == '.' || entry == '..'
      path = File.join(folder, entry)
      zip_entry = File.join(parent_folder, entry)
      if File.directory?(path)
        add_folder_to_zip(zipfile, path, zip_entry)
      else
        zipfile.add(zip_entry, path)
      end
    end
  end
end