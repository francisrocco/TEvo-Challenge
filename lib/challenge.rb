require_relative '../lib/input'
require_relative '../lib/frequency'
require_relative '../lib/assign'

class Challenge

  def run(file1, file2)
    merged_array = Input.new(file1, file2).execute
    frequent_letters_array = Frequency.new(merged_array).execute
    key_assign_hash = Assign.new(frequent_letters_array).execute
    present = present(key_assign_hash)
    return present
  end

  def present(hash)
    array = hash.sort_by { |key, letters| key }
    final_keys = []
    array.map do |sub_array|
      "#{sub_array[0] + 2}: #{sub_array[1]}"
    end
  end

end
