class Part1
  attr_reader :lines

  def initialize(input)
    @lines = input.each_line.map(&:strip).map(&:to_i)
  end

  def solution
    lines.combination(2).to_a.find{|g| g.sum == 2020 }.reduce(:*)
  end
end

p "DAY1 #Part1: #{Part1.new(File.open('day1.txt')).solution}"

class Part2
  attr_reader :lines

  def initialize(input)
    @lines = input.each_line.map(&:strip).map(&:to_i)
  end

  def solution
    lines.combination(3).to_a.find{|g| g.sum == 2020 }.reduce(:*)
  end
end

p "DAY1 #Part2: #{Part2.new(File.open('day1.txt')).solution}"
