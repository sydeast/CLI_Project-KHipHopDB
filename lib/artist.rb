require 'nokogiri'
require 'open-uri'
require 'pry'


class Artist
    attr_accessor :name, :full_name, :hangul, :dob, :label, :gender, :position, :aka, :hometown, :crew

    @@all = []
    @@labels = []

    def initialize
        @@all << self
        @@labels << @label
    end

    def self.all
        @@all
    end

    def self.delete
        @@all.clear
    end

    def self.labels
        @@labels
    end


end