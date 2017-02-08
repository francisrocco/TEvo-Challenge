require 'byebug'

class Input

  def execute(file_array)
    all_files = []
    file_array.each do |file|
      all_files << File.read(file)
    end

    merged = combine_files(all_files)
    return merged
  end

  def combine_files(file_array)
    final_array = []

    file_array.each do |file|
      final_array.concat(file_to_array(file))
    end

    return final_array
  end

  def file_to_array(file)
    return file.downcase.gsub(/[^a-z]/, '').split("")
  end

end
