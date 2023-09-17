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

  tokens = expression.scan(/\d+|\+|\-|\*|\/|\(|\)/)
  print tokens

  tokens.each do |token|
    if token =~ /\d+/
      result << token
    elsif token == '('
      operator_stack << token
    elsif token == ')'
      while operator_stack.any? && operator_stack.last != '('
        result << operator_stack.pop
      end
      operator_stack.pop
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
puts " "
puts output

