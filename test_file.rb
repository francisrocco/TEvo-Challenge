class Test

  CLASSIC_KEYS = {
    2 => "abc",
    3 => "def",
    4 => "ghi",
    5 => "jkl",
    6 => "mno",
    7 => "pqrs",
    8 => "tuv",
    9 => "wxyz"
  }

  FRANCIS_KEYS = {
    2 => "ehg",
    3 => "tlf",
    4 => "adp",
    5 => "oub",
    6 => "imv",
    7 => "nwk",
    8 => "syjq",
    9 => "rcxz"
  }

  attr_reader :word

  def initialize(word)
    @word = word.gsub(/\s+/, "")
  end

  def test_case
    letters = word.split("")

    total_classic_presses = classic_key_presses.inject(:+)
    total_francis_presses = francis_key_presses.inject(:+)

    if total_francis_presses < total_classic_presses
      return "passes"
    else
      return "fails"
    end
  end

  def find_classic_key(letter)
    CLASSIC_KEYS.select{|key, value| value.include?(letter)}.values
  end

  def find_francis_key(letter)
    FRANCIS_KEYS.select{|key, value| value.include?(letter)}.values
  end

  def index_of_letter(letter_group, letter)
    letter_group.index(letter)
  end

  def classic_key_presses
    presses = []
    word.split("").each do |letter|
      letter_group = find_classic_key(letter)
      presses << ((index_of_letter(letter_group[0], letter)) + 1)
    end
    return presses
  end

  def total_classic_presses
    classic_key_presses.inject(:+)
  end

  def francis_key_presses
    presses = []
    word.split("").each do |letter|
      letter_group = find_francis_key(letter)
      presses << ((index_of_letter(letter_group[0], letter)) + 1)
    end
    return presses
  end

  def total_francis_presses
    francis_key_presses.inject(:+)
  end

end
