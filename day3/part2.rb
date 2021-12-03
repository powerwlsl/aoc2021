input_path = File.expand_path('./input1.txt', __dir__)


arrays = []
File.readlines(input_path).each do |line|
  arrays << line.strip.split('').map(&:to_i)
end

def get_array(arrays)
  result = 0
  12.times do |index|
    arrays.each do |array|
      result -= 1 if array[index].to_i == 0
      result += 1 if array[index].to_i == 1
    end
    puts "result #{result}"
    # bit_criteria = result >= 0 ? 0 : 1

    bit_criteria =  yield(result)
    arrays.filter! { |array| array[index] == bit_criteria }

    break if arrays.length == 1
    result = 0
  end
  arrays[0]
end

oxy = get_array(arrays.clone) do |result|
  result >= 0 ? 1 : 0
end

co2 = get_array(arrays.clone) do |result|
  result >= 0 ? 0 : 1
end

puts
print oxy.join.to_i(2)
puts
print co2.join.to_i(2)
puts
puts oxy.join.to_i(2) * co2.join.to_i(2)


