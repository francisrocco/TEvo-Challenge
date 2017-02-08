class Assign

  attr_reader :frequent_letters_array

  def initialize(frequent_letters_array)
    @frequent_letters_array = frequent_letters_array
  end

  def execute
    key_assign(frequent_letters_array)
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

end
