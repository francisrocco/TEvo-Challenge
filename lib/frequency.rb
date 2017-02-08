class Frequency

  attr_reader :input_array

  def initialize(input_array)
    @input_array = input_array
  end

  def execute
    frequency_hash = map_to_hash(input_array)
    sorted_array = sort_hash(frequency_hash)
    frequent_letters_array = most_frequent_letter_array(sorted_array)
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

end
