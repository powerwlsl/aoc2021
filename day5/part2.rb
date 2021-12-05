input_path = File.expand_path('./input1.txt', __dir__)
paths = []

File.readlines(input_path).each do |line|
  paths << line.strip.split(' -> ').map { |a| a.split(',') }.map {|arr| arr.map(&:to_i) }
end

# print paths
# [["0", "9"], ["5", "9"]]



def get_passed_paths(paths)
  passed = Hash.new(0)

  paths.each do |path|
    start = path[0]
    last = path[1]
    if horizontal(path)
      range = get_range(start[1], last[1])

      range.to_a.each do |i|
        passed[[start[0], i]] += 1
      end
    elsif vertical(path)
      range = get_range(start[0], last[0])

      range.to_a.each do |i|
        passed[[i, start[1]]] += 1
      end
    else
      # 3,3 -> 6,6 => 3,3 / 4,4 / 5,5 / 6,6
      # 4,5 -> 7,8
      if (start[0] <= last[0]) && (start[1] <= last[1])
        (last[0] - start[0] + 1).times do |i|
          passed[[start[0] + i, start[1] + i]] += 1
        end

      # 6,4 -> 2,0 => 5,3 / 4,2 / 3,1
      elsif (start[0] >= last[0]) && (start[1] >= last[1])
        (start[0] - last[0] + 1).times do |i|
          passed[[start[0] - i, start[1] - i]] += 1
        end

      # 9,6 -> 6,9 => 9,6 / 8,7 / 7,8 /6,9 -> ok
      elsif (start[0] >= last[0]) && (start[1] <= last[1])
        (start[0] - last[0] + 1).times do |i|
          passed[[start[0] - i, start[1] + i]] += 1
        end

      # 9,4 -> 12,1 -> 10,3 / 11,2 / 12,1
      # 0,8 -> 8,0 => 0,8 / 1,7 / 2,6...
      elsif (start[0] <= last[0]) && (start[1] >= last[1])
        (last[0] - start[0] + 1).times do |i|
          passed[[start[0] + i, start[1] - i]] += 1
        end
      end
    end
  end

  passed
end


def horizontal(path)
  path[0][0] == path[1][0]
end

def vertical(path)
  path[0][1] == path[1][1]
end

def get_range(start, last)
  if start <= last
    (start..last)
  else
    (last..start)
  end
end

passed_paths = get_passed_paths(paths)
puts passed_paths.count

def get_overlapped_paths(paths)
  paths.filter { |key, value| value > 1 }.count
end


puts get_overlapped_paths(passed_paths)
