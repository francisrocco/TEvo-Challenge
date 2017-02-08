require_relative '../lib/input'
require_relative '../lib/frequency'

class Challenge

  def run(file1, file2)
    merged_array = Input.new(file1, file2).import_files
    frequent_letters_array = Frequency.new(merged_array).sort_frequency_array
    key_assign_hash = key_assign(frequent_letters_array)
    present = present(key_assign_hash)
    return present
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

end
