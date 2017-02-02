class Challenge

  def run(file1, file2)
    merged_array = import_files(file1, file2)
    frequency_hash = map_to_hash(merged_array)
    sorted_array = sort_hash(frequency_hash)
    frequent_letters_array = most_frequent_letter_array(sorted_array)
    key_assign_array = key_assign(frequent_letters_array)
    return frequent_letters_array
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

  def sort_hash(hash)
    hash.sort_by { |letter, frequency| frequency }
  end

  def most_frequent_letter_array(array)
    reverse_array = array.reverse
    only_letters_array = []
    reverse_array.map do |letter_array|
      only_letters_array << letter_array[0]
    end
    return only_letters_array
  end

  def key_assign(array)

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
