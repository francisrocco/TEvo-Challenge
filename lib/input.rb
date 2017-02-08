class Input

  attr_reader :file1, :file2

  def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
  end

  def import_files
    first = File.read(file1)
    second = File.read(file2)
    merged = combine_files(first, second)
    return merged
  end

  def combine_files(file1, file2)
    first = file_to_array(file1)
    second = file_to_array(file2)
    return first + second
  end

  def file_to_array(file)
    return file.downcase.gsub(/[^a-z]/, '').split("")
  end

end
