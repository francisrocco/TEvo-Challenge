class Challenge

  def run(file1, file2)
    merged_array = import_files(file1, file2)
    frequency_hash = map_to_hash(merged_array)
  end

  def import_files(file1, file2)
    first = File.read(file1)
    second = File.read(file2)
    merged = combine_files(first, second)
    return merged
  end

  def map_to_hash(array)
    frequency_hash = {}
    array.map do |char|
      if frequency_hash[char]
        frequency_hash[char] += 1
      else
        frequency_hash[char] = 1
      end
    end
    return frequency_hash
  end

  private

  def combine_files(file1, file2)
    first = file_to_array(file1)
    second = file_to_array(file2)
    return first + second
  end

  def file_to_array(file)
    return file.downcase.gsub(/[^a-z]/, '').split("")
  end

end

example = Challenge.new
puts example.run("michelle.txt", "chimamanda.txt")
