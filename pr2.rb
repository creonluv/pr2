def rpn(expression)
  operator_stack = []
  result = []

  def precedence(operator)
    case operator
    when '+', '-' then 1
    when '*', '/' then 2
    else 0
    end
  end

  tokens = expression.scan(/\d+|\+|\-|\*|\//)

  tokens.each do |token|
    if token =~ /\d+/
      result << token
    else
      while operator_stack.any? && precedence(operator_stack.last) >= precedence(token)
        result << operator_stack.pop
      end
      operator_stack << token
    end
  end

  result.concat(operator_stack.reverse)
  result.join(' ')
end

puts "Введіть математичний вираз у звичайному вигляді:"
expression = gets.chomp
output = rpn(expression)
puts output
