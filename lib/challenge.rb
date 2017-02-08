require_relative '../lib/input'
require_relative '../lib/frequency'
require_relative '../lib/assign'
require_relative '../lib/printer'

class Challenge

  def run(file1, file2)
    merged_array = Input.new(file1, file2).execute
    frequent_letters_array = Frequency.new(merged_array).execute
    key_assign_hash = Assign.new(frequent_letters_array).execute
    present = Printer.new(key_assign_hash).execute
  end

end
