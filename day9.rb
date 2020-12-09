class Part1
  attr_reader :lines
  attr_accessor :wrong_numbers

  def initialize(input)
    @lines = input.each_line.map(&:strip).map(&:to_i)
    @wrong_numbers = []
  end

  def solution
    index = 25
    lines[25..].each do |line|
      wrong_numbers << line if !right?(line, index)
      index +=1
    end
    wrong_numbers
  end

  private 

  def right?(line, index)
    lines[(index-25)..(index-1)].combination(2).to_a.map(&:sum).any? { |i| i == line.to_i }
  end
end

p "DAY9 #Part1: #{Part1.new(File.open('day9.txt')).solution.first}"

class Part2
  attr_reader :lines, :magic_number
  attr_accessor :result, :current_combo

  def initialize(input)
    @lines = input.each_line.map(&:strip).map(&:to_i)
    @lines.delete(magic_number)
    @result = []
  end

  def solution
    (2..lines.count).to_a.each do |combo_size|
      (0..(lines.count - combo_size)).to_a.each do |index|
       final_index = index + combo_size - 1
       result << lines[index..final_index] if lines[index..final_index].sum == magic_number
      end
    end
    # [result.flatten.minmax.sum, result.flatten.count]
    result.flatten.minmax.sum
  end

  private

  def magic_number
    @magic_number ||= Part1.new(File.open('day9.txt')).solution.first
  end
end

p "DAY9 #Part2: #{Part2.new(File.open('day9.txt')).solution}"
