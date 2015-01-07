require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/beats?')

get('/') do
  erb(:game_selection)
end

get('/one_player') do
  erb(:one_player)
end


get('/form') do
  erb(:form)
end

get('/outcome') do
  if params.fetch('opponent_move') == "computer"
    computer = ["rock", "paper", "scissors"].sample()
    result = params.fetch('your_move').beats?(computer)
    @o_move = computer
  else
    result = params.fetch('your_move').beats?('opponent_move')
    @o_move = params.fetch('opponent_move')
  end

  @y_move = params.fetch('your_move')

  if @o_move == @y_move
    @result = "It's a tie!"
  elsif result
    @result = "You win!"
  else
    @result = "Opponent wins!"
  end
  erb(:outcome)
end
