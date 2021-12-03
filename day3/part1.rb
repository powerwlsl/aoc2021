input_path = File.expand_path('./input1.txt', __dir__)

result = [0] * 12

File.readlines(input_path).each do |line|
  (line.length-1).times do |index|
    result[index] -= 1 if line[index].to_i == 0
    result[index] += 1 if line[index].to_i == 1
  end
end

gamma = result.map do |i|
  if i > 0
    0
  else
    1
  end
end.join

epsilon = result.map do |i|
  if i < 0
    0
  else
    1
  end
end.join

puts gamma.to_i(2) * epsilon.to_i(2)




