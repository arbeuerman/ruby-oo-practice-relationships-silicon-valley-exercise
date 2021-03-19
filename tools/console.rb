require_relative '../config/environment.rb'
require_relative '../app/models/funding_round'
require_relative '../app/models/startup'
require_relative '../app/models/venture_capitalist'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
startup_one = Startup.new("girls who code", "alexandra", "women in tech")
startup_two = Startup.new("Ronnie's games", "Ronnie", "dog toys")

vc_one = VentureCapitalist.new("Karina", 1000000000)
vc_two = VentureCapitalist.new("Jessica", 500000)
fund_round_1 = FundingRound.new(startup_one, vc_one, "Angel", 5)
fund_round_2 = FundingRound.new(startup_one, vc_two, "Pre-seed", 10)
fund_round_4 = FundingRound.new(startup_one, vc_two, "Seed", 15)

fund_round_3 = FundingRound.new(startup_two, vc_two, "Series B", 450000000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line