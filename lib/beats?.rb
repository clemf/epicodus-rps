class String
  define_method(:beats?) do |opponent|
    if self == "rock" && opponent == "scissors"
      true
    elsif self == "rock" && opponent == "paper"
      false
    elsif self == "scissors" && opponent == "paper"
      true
    elsif self == "scissors" && opponent == "rock"
      false
    elsif self == "paper" && opponent == "rock"
      true
    elsif self == "paper" && opponent == "scissors"
      false
    end
  end
end
