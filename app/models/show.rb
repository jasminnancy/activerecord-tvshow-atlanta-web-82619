class Show < ActiveRecord::Base

    def self.highest_rating
        self.maximum('rating')
    end

    def self.most_popular_show
        self.find_by(rating: highest_rating)
    end

    def self.lowest_rating
        self.minimum('rating')
    end

    def self.least_popular_show
        self.find_by(rating: lowest_rating)
    end

    def self.ratings_sum
        self.all.map { |s| s.rating }.sum
    end

    def self.popular_shows
        self.all.find_all { |s| s.rating > 5 }
    end

    def self.shows_by_alphabetical_order
        self.all.sort_by { |s| s.name }
    end
end