def infix_to_rpn(expression)

  operators = { '+' => 1, '-' => 1, '*' => 2, '/' => 2 }

  output = []
  stack = []

  tokens = expression.scan(/\d+|\+|\-|\*|\/|\(|\)/)

  tokens.each do |token|
    if token.match(/\d+/)
      output << token
    elsif token == '('
      stack.push(token)
    elsif token == ')'
      while stack.last != '('
        output << stack.pop
      end
      stack.pop
    else
      while !stack.empty? && stack.last != '(' && operators[token] <= operators[stack.last]
        output << stack.pop
      end
      stack.push(token)
    end
  end

  while !stack.empty?
    output << stack.pop
  end

  output.join(' ')
end


while true
  puts "Enter the expression below: "
  input = gets.chomp
  rpn = infix_to_rpn(input)
  puts "Result in RPN: #{rpn}"
end