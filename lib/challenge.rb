require_relative '../lib/input'
require_relative '../lib/frequency'
require_relative '../lib/assign'
require_relative '../lib/printer'

class Challenge

  attr_reader :file1, :file2

  def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
  end

  def execute
    key_assign_hash = run
    Printer.new(key_assign_hash).execute
  end

  def run
    merged_array = Input.new(file1, file2).execute
    frequent_letters_array = Frequency.new(merged_array).execute
    key_assign_hash = Assign.new(frequent_letters_array).execute
  end

end
