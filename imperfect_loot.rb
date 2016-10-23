def all_combos(items, adventurer_count)
  combinations = []
  1.upto(items.length).each do |size|
    combinations += items.combination(size).to_a
  end

  combinations + possible_empty_combinations(adventurer_count)
end

def possible_empty_combinations(adventurer_count)
  Array.new(adventurer_count, [])
end

def all_possible_gem_sets(items, adventurer_count)
  total_value = items.reduce(0, &:+)
  desired_value_per_adventurer = total_value / adventurer_count

  all_combos(items, adventurer_count).combination(adventurer_count)
    .select { |combo| valid_combo?(combo, items) }
    .sort_by { |combo| combo_score(combo, desired_value_per_adventurer) }.first
end

def valid_combo?(combo, items)
  combo.flatten.sort == items.sort
end

def combo_score(combo, desired_value_per_adventurer)
  combo.reduce(0) do |total, gem_group|
    total + (desired_value_per_adventurer - gem_group.reduce(0, &:+)).abs
  end
end



adventurer_count = ARGV[0].to_i
items = ARGV[1..-1].map(&:to_i)

all_possible_gem_sets(items, adventurer_count).each_with_index do |gems, index|
  puts "#{index + 1}: #{gems.join(' ')}"
end