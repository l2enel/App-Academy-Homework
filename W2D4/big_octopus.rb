FISHES = ['fish',
  'fiiish',
  'fiiiiish',
  'fiiiish',
  'fffish',
  'ffiiiiisshh',
  'fsh',
  'fiiiissshhhhhh'
  ]

  tiles_array = ["up",
    "right-up",
    "right",
    "right-down",
    "down",
    "left-down",
    "left",
    "left-up"
  ]

  prc = Proc.new { |x, y| x <=> y }

def sluggish_octopus(fishes)
  fish_sorter(fishes).last
end

def dominant_octopus(fishes)
  prc = Proc.new { |x, y| x <=> y }
  fish_merge_sorter(fishes, &prc).last
end

def clever_octopus(fishes)
  biggest_fish = ""
  fishes.each { |fish| biggest_fish = fish if fish.length > biggest_fish.length }
  biggest_fish
end

def slow_dance(direction, tiles)
  tiles.each { |dir| return tiles.index(dir) if dir == direction }
end

def fast_dance(direction, tiles)

end

def fish_sorter(fishes)
  return [] if fishes.empty?
  fishes = fishes.sort_by { |fish| fish.length }
  pivot_el = [fishes.first]

  left = fishes[1..-1].select { |fish| fish.length < fishes.first.length }
  right = fishes[1..-1].select { |fish| fish.length > fishes.first.length }

  fish_sorter(left) + pivot_el + fish_sorter(right)
end

def fish_merge_sorter(fishes, &prc)
  return [] if fishes.empty?
  prc = Proc.new { |x, y| x <=> y }

  pivot_idx = fishes.length / 2
  left, right = fishes.take(pivot_idx), fishes.drop(pivot_idx)
  sorted_left = fish_merge_sorter(left, &prc)
  sorted_right = fish_merge_sorter(right, &prc)

  fish_merge(sorted_left, sorted_right, &prc)
end

def fish_merge(left, right, &prc)
  prc = Proc.new { |x, y| x <=> y }
  merged = []

  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when - 1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end

  merged + left + right
end

if __FILE__ == $PROGRAM_NAME
  p sluggish_octopus(FISHES)
  # p dominant_octopus(FISHES)
  p clever_octopus(FISHES)
  p slow_dance("up", tiles_array)
  p fast_dance("up", tiles_array)
end
