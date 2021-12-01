i = 0
count = 0
lines = File.foreach("input1.txt").count

while i < lines - 3

  first = IO.readlines("input1.txt")[i]
  last = IO.readlines("input1.txt")[i + 3]

  count += 1 if last.to_i > first.to_i

  i += 1
end

puts count
