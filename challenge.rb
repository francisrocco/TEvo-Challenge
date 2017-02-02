class Challenge

  def run(file1, file2)
    merged_array = import_files(file1, file2)
    frequency_hash = map_to_hash(merged_array)
    sorted_array = sort_hash(frequency_hash)
    frequent_letters_array = most_frequent_letter_array(sorted_array)
    key_assign_hash = key_assign(frequent_letters_array)
    present = present(key_assign_hash)
    return present
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
    key_hash = { 0=> "", 1=> "", 2=> "", 3=> "", 4=> "", 5=> "", 6=> "", 7=> "" }

    grouped_array = [array[0..7], array[8..15], array[16..23]]
    last_two_letters = array[24..26]

    grouped_array.map do |sub_array|
      sub_array.each_with_index do |letter, idx|
        key_hash[idx] << letter
      end
    end

    last_two_letters.each_with_index do |letter, idx|
      key_hash[idx + 6] << letter
    end

    key_hash
  end

  def present(hash)
    array = hash.sort_by { |key, letters| key }
    final_keys = []
    array.map do |sub_array|
      "#{sub_array[0] + 2}: #{sub_array[1]}"
    end
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
