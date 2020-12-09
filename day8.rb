class Part1
  attr_reader :lines
  attr_accessor :acc,
                :executed_lines,
                :current_line

  def convert_lines(input)
    return input if input.is_a? Array
    input.each_line.map(&:strip)
  end

  def initialize(input)
    @lines = convert_lines(input)
    @acc = 0
    @executed_lines = []
    @current_line = 0
  end

  def solution
    while loop_continue?
      execute_line
    end
    return [acc, infinite_loop?]
  end

  private

  def execute_line
    executed_lines << current_line
    return if current_line == lines.count
    instruction, value = lines[current_line].split(' ')
    
    case instruction
    when 'acc'
      self.acc += value.to_i
      self.current_line += 1
    when 'jmp'
      self.current_line += value.to_i
    when 'nop'
      self.current_line += 1
    else
      p 'error'
    end
  end

  def loop_continue?
    !executed_lines.include?(current_line) || executed_lines.count == lines.count
  end

  def infinite_loop?
    current_line != lines.count
  end
end

p Part1.new(File.open('day8.txt')).solution

class Part2
  attr_reader :lines
  attr_accessor :candidates
  
  def initialize(input)
    @lines = input.each_line.map(&:strip)
    @candidates = []
  end

  def solution
    # Part1.new(File.open('day8.txt')).solution
    parse_lines
    results = []
    p lines[191]
    candidates[191..191].each do |candidate_index|
      # p converted_line_for(candidate_index)
      results << Part1.new(converted_line_for(candidate_index)).solution
    end
    results.filter {|i| i.last == false}
  end

  private

  def parse_lines
    lines.each_with_index do |line, index|
      instruction, value = line.split(' ')
      if instruction == 'jmp' || instruction == 'nop'
        self.candidates << index
      end
    end
  end

  def converted_line_for(candidate_index)
    instruction, value = lines[candidate_index].split(' ')
    new_lines = lines.clone
    case instruction
    when 'jmp'
      new_lines[candidate_index] = ['nop', value].join(' ')
    when 'nop'
      new_lines[candidate_index] = ['jmp', value].join(' ')
    end
    return new_lines
  end
end

p Part2.new(File.open('day8.txt')).solution