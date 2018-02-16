def sum_to(num)
  return nil if num < 1
  return num if num == 1
  num + sum_to(num - 1)
end


def add_numbers(nums_array)
  return nil if nums_array.empty?
  return nums_array.first if nums_array.length == 1
  nums_array.first + add_numbers(nums_array[1..-1])
end

def gamma(num)
  return nil if num < 1
  gamma_number = num - 1
  return gamma_number if gamma_number == 1
  gamma_number * gamma(num - 1)
end

def ice_cream_shop(flavors, favorite_flav)
  return false if flavors.nil?
  first_flavor = flavors.first
  return true if first_flavor == favorite_flav
  ice_cream_shop(flavors[1..-1], favorite_flav)
end

def reverse(string)
  return "" if string.empty?
  letter = string[0]
  return letter if string.length == 1
  reverse(string[1..-1]) + letter
end
