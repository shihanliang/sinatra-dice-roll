require "sinatra"
require "better_errors"
require "binding_of_caller"

use BetterErrors::Middleware
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0')

# Dice list including Home
NAV_LINKS = [
  { label: "Home", path: "/" },
  { label: "2d6", path: "/dice/2/6" },
  { label: "2d10", path: "/dice/2/10" },
  { label: "1d20", path: "/dice/1/20" },
  { label: "5d4", path: "/dice/5/4" },
  { label: "100d6", path: "/dice/100/6" }
]

# Dice rolling helper
def roll_dice(count, sides)
  Array.new(count) { rand(1..sides) }
end

# Homepage
get("/") do
  @dice_links = NAV_LINKS
  erb :home
end

# Dice roll routes
get("/dice/2/6") do
  @dice_title = "2d6"
  @rolls = roll_dice(2, 6)
  @dice_links = NAV_LINKS
  erb :dice
end

get("/dice/2/10") do
  @dice_title = "2d10"
  @rolls = roll_dice(2, 10)
  @dice_links = NAV_LINKS
  erb :dice
end

get("/dice/1/20") do
  @dice_title = "1d20"
  @rolls = roll_dice(1, 20)
  @dice_links = NAV_LINKS
  erb :dice
end

get("/dice/5/4") do
  @dice_title = "5d4"
  @rolls = roll_dice(5, 4)
  @dice_links = NAV_LINKS
  erb :dice
end

get("/dice/100/6") do
  @dice_title = "100d6"
  @rolls = roll_dice(100, 6)
  @dice_links = NAV_LINKS
  erb :dice
end
