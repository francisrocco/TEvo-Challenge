require './challenge.rb'
require './test_file.rb'

francis = Challenge.new
puts francis.run("michelle.txt", "chimamanda.txt")

puts ""

test1_word = "francis"
test1 = Test.new(test1_word)
puts "#{test1_word} #{test1.test_case} with #{test1.total_francis_presses} new presses vs. #{test1.total_classic_presses} classic presses"

test2_word = "ticket evolution"
test2 = Test.new(test2_word)
puts "#{test2_word} #{test2.test_case} with #{test2.total_francis_presses} new presses vs. #{test2.total_classic_presses} classic presses"

test3_word = "hire me"
test3 = Test.new(test3_word)
puts "#{test3_word} #{test3.test_case} with #{test3.total_francis_presses} new presses vs. #{test3.total_classic_presses} classic presses"
