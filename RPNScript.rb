
#Method that converts the expression into RPN
def infix_to_rpn(expression)

  operators = { '+' => 1, '-' => 1, '*' => 2, '/' => 2 }

  output = []
  stack = []

  #Dividing the expression into tokens
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

  until stack.empty?
    output << stack.pop
  end

  output.join(' ')
end


while true
  #Taking the expression and passing it to the method
  puts "Enter the expression below: "
  input = gets.chomp
  rpn = infix_to_rpn(input)
  puts "Result in RPN: #{rpn}"
end