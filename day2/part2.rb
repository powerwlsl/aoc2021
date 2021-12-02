h = 0
v = 0
aim = 0


File.readlines('input1.txt').each do |line|

  direction, num = line.split(" ")

  if direction == 'forward'
    h += num.to_i
    v += aim * num.to_i
  elsif direction == 'down'
    aim += num.to_i
  elsif direction == 'up'
    aim -= num.to_i
  end
end
puts h * v
