require_relative '../lib/input'
require_relative '../lib/frequency'
require_relative '../lib/assign'
require_relative '../lib/printer'

class Challenge

  def execute(files)
    key_assign_hash = run(files)
    Printer.new(key_assign_hash).execute
  end

  def run(files)
    merged_array = Input.new.execute(files)
    frequent_letters_array = Frequency.new(merged_array).execute
    key_assign_hash = Assign.new(frequent_letters_array).execute
  end

end
