require "sinatra"
require "better_errors"
require "binding_of_caller"

# Enable better_errors
use BetterErrors::Middleware
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0') # ✅ FIXED subnet format

get("/") do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

# Generic dice-rolling logic
def roll_dice(count, sides)
  Array.new(count) { rand(1..sides) }
end

get("/dice/2/6") do
  @rolls = roll_dice(2, 6)
  erb(:two_six)
end

get("/dice/2/10") do
  @rolls = roll_dice(2, 10)
  erb(:two_ten)
end

get("/dice/1/20") do
  @rolls = roll_dice(1, 20)
  erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls = roll_dice(5, 4)
  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = roll_dice(100, 6)
  erb(:one_hundred_six)
end
