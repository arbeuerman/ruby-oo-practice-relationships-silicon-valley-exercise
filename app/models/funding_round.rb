class FundingRound
        
    #instance variables getters and setters
    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist

    #class variables
    @@all = []

    #constructor
    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        @@all << self
    end

    #class methods
    def self.all
        @@all
    end 


end
