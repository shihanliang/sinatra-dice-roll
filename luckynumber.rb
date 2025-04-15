require "sinatra"
require "better_errors"
require "binding_of_caller"

# Enable better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "<h1>Welcome to Dice Roller</h1>
   <p>Try one of these:</p>
   <ul>
     <li><a href='/dice/2/6'>/dice/2/6</a></li>
     <li><a href='/dice/2/10'>/dice/2/10</a></li>
     <li><a href='/dice/1/20'>/dice/1/20</a></li>
     <li><a href='/dice/5/4'>/dice/5/4</a></li>
   </ul>"
end

get("/howdy") do
  "hello world"
end

get("/dice/2/6") do
  rolls = [rand(1..6), rand(1..6)]
  total = rolls.sum
  "<h1>2d6</h1><p>You rolled #{rolls.join(' and ')} for a total of #{total}.</p>"
end

get("/dice/2/10") do
  rolls = [rand(1..10), rand(1..10)]
  total = rolls.sum
  "<h1>2d10</h1><p>You rolled #{rolls.join(' and ')} for a total of #{total}.</p>"
end

get("/dice/1/20") do
  roll = rand(1..20)
  "<h1>1d20</h1><p>You rolled a #{roll}.</p>"
end

get("/dice/5/4") do
  rolls = Array.new(5) { rand(1..4) }
  total = rolls.sum
  "<h1>5d4</h1><p>You rolled #{rolls.join(', ')} for a total of #{total}.</p>"
end
