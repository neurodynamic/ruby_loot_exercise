require 'byebug'

def combinations_totaling(total, items)
  combinations = []
  1.upto(items.length).each do |size|
    combinations += items.combination(size).select { |combination| combination.reduce(&:+) == total }
  end

  combinations
end

def gem_assignments(combinations, adventurer_count, items)
  combinations.combination(adventurer_count).find { |combo| combo.flatten.sort == items.sort }
end

adventurer_count = ARGV[0].to_i
items = ARGV[1..-1].map(&:to_i)
total_value = items.reduce(&:+)
value_per_adventurer = total_value / adventurer_count

combinations_with_correct_total = combinations_totaling(value_per_adventurer, items)

results = gem_assignments(combinations_with_correct_total, adventurer_count, items)

if results
  results.each_with_index do |gems, index|
    puts "#{index + 1}: #{gems.join(' ')}"
  end
else
  puts "It is not possible to fairly split this treasure #{adventurer_count} ways."
end
