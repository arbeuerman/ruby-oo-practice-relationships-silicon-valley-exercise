class VentureCapitalist
    #instance variables getters and setters
    attr_accessor :name
    attr_reader :total_worth

    #class variables
    @@all = []

    #constructor
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    #class methods
    def self.all
        @@all
    end 

    def self.tres_commas_club
        all.select { |venture_capitalist| venture_capitalist.total_worth >= 1000000000}
    end 

    #instance methods
    def offer_contract(startup, type_of_investment, amount_invested)
        FundingRound.new(startup, self, type_of_investment, amount_invested)
    end 

    def funding_rounds
        FundingRound.all.select { |funding_round| funding_round.venture_capitalist == self}
    end 

    def portfolio
        funding_rounds.map { |funding_round| funding_round.startup}.uniq
    end 

    def biggest_investment
        funding_rounds.max { |funding_round| funding_round.investment }
    end 

    def invested(domain)
        domain_specific_funds = funding_rounds.select { |funding_round| funding_round.startup.domain == domain}
        domain_specific_funds.sum { |funding_round| funding_round.investment}
    end 

end
