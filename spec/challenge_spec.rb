require 'spec_helper'

describe Challenge do
  let!(:challenge) { Challenge.new }

  describe "#import_files" do
      it "imports files from the same directory and merges them into one array" do
        files = challenge.import_files('michelle.txt', 'chimamanda.txt')
        expect(files).not_to be_empty
      end
  end

  describe "#map_to_hash" do
      it "returns a hash/dictionary of letters and their frequency" do
        array = challenge.import_files('michelle.txt', 'chimamanda.txt')
        hash = challenge.map_to_hash(array)
        expect(hash).to include("a")
      end
  end

  describe "#most_frequent_letter_array" do
    it "returns an array of only the letters in descending order of frequency" do
      array = challenge.import_files('michelle.txt', 'chimamanda.txt')
      hash = challenge.map_to_hash(array)
      sorted_array = challenge.sort_hash(hash)
      frequent_letters_array = challenge.most_frequent_letter_array(sorted_array)
      least_frequent_letter = hash.max_by{|k,v| v}[0]
      first_letter_in_array = frequent_letters_array[0][0]
      expect(first_letter_in_array).to eq(least_frequent_letter)
    end
  end

  describe "#key_assign" do
      it "assigns letters to different keys/numbers on a phone" do
        array = challenge.import_files('michelle.txt', 'chimamanda.txt')
        hash = challenge.map_to_hash(array)
        sorted_array = challenge.sort_hash(hash)
        frequent_letters_array = challenge.most_frequent_letter_array(sorted_array)
        key_assign_hash = challenge.key_assign(frequent_letters_array)
        expect(key_assign_hash).to include(7)
      end
  end

  describe "#present" do
      it "presents the keys in the terminal" do
      end
  end

end
