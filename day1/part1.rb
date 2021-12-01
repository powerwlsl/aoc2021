count = 0
prev = 0
File.readlines('input1.txt').each do |line|
  count += 1 if prev < line.to_i
  prev = line.to_i
end
puts count - 1
