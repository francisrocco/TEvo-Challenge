class Printer

  attr_reader :key_assign_hash

  def initialize(key_assign_hash)
    @key_assign_hash = key_assign_hash
  end

  def execute
    present(key_assign_hash)
  end

  def present(hash)
    array = hash.sort_by { |key, letters| key }
    final_keys = []
    array.map do |sub_array|
      "#{sub_array[0] + 2}: #{sub_array[1]}"
    end
  end

end
