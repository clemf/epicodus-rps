require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/beats?')

get('/form') do
  erb(:form)
end

get('/outcome') do
  result = params.fetch('your_move').beats?('opponent_move')
  if result
    @result = "You win!"
  else
    @result = "Opponent wins!"
  end
  erb(:outcome)
end
