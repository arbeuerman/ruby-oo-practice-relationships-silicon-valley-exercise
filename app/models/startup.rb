class Startup
    
    attr_reader :founder, :domain, :name 
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain 
        @@all << self
    end

    #class methods
    def self.all
        @@all
    end    
    
    def self.find_by_founder(founder_name)
        all.find { |startup| startup.founder == founder_name}
    end 

    def self.domains
        all.map { |startup| startup.domain }
    end 
    
    #instance methods
    
    def pivot(domain, name)
        @domain = domain
        @name = name
        self
    end 

    def sign_contract(venture_capitalist, type_of_investment, amount_invested)
        FundingRound.new(self, venture_capitalist, type_of_investment, amount_invested)
    end 

    def funding_rounds 
        FundingRound.all.select { |funding_round| funding_round.startup == self}
    end 

    def num_funding_rounds
        funding_rounds.count
    end 

    def total_funds
        funding_rounds.sum { |funding_round| funding_round.investment }
    end

    def investors
        funding_rounds.map { |funding_round| funding_round.venture_capitalist }.uniq
    end 

    def big_investors
        VentureCapitalist.tres_commas_club & investors
    end 

    private 

    def domain=(domain)
        @domain = domain
    end 

    def name=(name)
        @name = name
    end 

end
