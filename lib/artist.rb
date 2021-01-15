require 'nokogiri'
require 'open-uri'
require 'pry'


class Artist
    # attr_accessor :name, :group, :position, :changes, :direction
    attr_accessor :name, :full_name, :hangul, :dob, :label, :gender, :position, :aka, :hometown, :crew

    @@all = []
    @@labels = []

    def initialize
        # @name = name
        # @full_name = full_name
        # @hangul = hangul
        # @dob = dob
        # @gender = gender
        # @position = position
        # @aka = aka
        # @hometown = hometown
        # @crew = crew
        # @label = label  ||= "Unsigned or Unknown"
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

    # def name
    #     @name
    # end

    # def full_name
    #     @full_name
    # end

    # def hangul
    #     @hangul
    # end

    # def dob
    #     @dob
    # end

    # def label
    #     @label
    # end

    # def gender
    #     @gender
    # end

    # def position
    #     @position
    # end

    # def aka
    #     @aka
    # end

    # def hometown
    #     @hometown
    # end

    # def crew
    #     @crew
    # end



end