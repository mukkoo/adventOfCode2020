class Part1
  attr_reader :lines
  attr_accessor :previous_line, :one, :two, :three

  def initialize(input)
    @lines = [input.each_line.map(&:strip).map(&:to_i) + [0]].flatten.sort
    @previous_line = nil
    @one = 0
    @two = 0
    @three = 1
  end

  def solution
    memo_lines = lines.count
    while has_lines?
      previous_line = lines[0] if previous_line.nil?
      case lines[0] - previous_line
      when 1 then self.one += 1
      when 2 then self.two += 1
      when 3 then self.three += 1
      end
      previous_line = lines[0]
      lines.delete(lines[0])
    end
    {one: one, two: two, three: three, lines: memo_lines, result: one * three}
  end

  private

  def has_lines?
    lines.count > 0
  end

end

p "DAY10 #Part1: #{Part1.new(File.open('day10.txt')).solution}"

class Part2
  attr_reader :lines
  attr_accessor :combinations

  def initialize(input)
    @lines = input.each_line.map(&:strip).map(&:to_i).flatten.sort
    @combinations = {0 => 1}
  end

  def solution
    lines.each do |line|
      allowed_values = [line, line - 1, line -2, line - 3].filter { |i| i >= 0}
      combinations[line] = 0 if combinations[line] == nil
      combinations[line] = allowed_values.map { |v| combinations[v] }.compact.sum
    end
    p combinations
    combinations[lines.max]
  end
end

p "DAY10 #Part2: #{Part2.new(File.open('day10.txt')).solution}"