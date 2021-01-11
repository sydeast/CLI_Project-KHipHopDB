require 'nokogiri'
require 'open-uri'
require 'pry'

class Cli
attr_accessor :print_artist
    def call
    Scraper.new.create_database
        puts "Welcome to my Korean Hiphop and R&B Artist Database!
 Here you can see basic profile infomation on recording artists from popular in Korea. However it is randomize for now!"
        start
    end

    def start
        puts ""
        puts "To find an artist and learn more about them please enter a number [1-99]"

        input = gets.strip.to_i

        if input < 1 || > 99
            puts "Oops! I'm sorry. I can't do anything with that just yet, please try again."
            puts ""
            start
        elsif
            rapper = Artist.all[input]
            self.print_artist
        end
            puts "Would you like to see another artist? [y/n]"

        input = gets.chomp

        if input == "y"
            start
        elsif input == "n" || !"y"
            puts ""
            puts "Thank you! I will close now! 안녕! Bye!"
            exit
        end


        def self.print_artist(rapper)
            puts "Name: #{rapper.name}"
            puts "  Hangul: #{rapper.hangul}"
            if rapper.aka != ""
                puts "  As known As: #{rapper.aka}"
            end
                puts "  Birth Name: #{rapper.full_name}"
                puts "  Birthday: #{rapper.dob}"
                puts "  Gender: #{rapper.gender}"
            if rapper.hometown != ""
                puts "  Hometown: #{rapper.hometown}"
            end
            if rapper.label != ""
                puts "  Label: #{rapper.label}"
            end
                puts "  Position: #{rapper.position}"
            if rapper.crew != ""
                puts "  Member of: #{rapper.crew}"
                end
        end
        # def self.print_unsigned_artists
        #     soda2 = []
        #     Artist.all.each do |rapper|
        #         if Artist.label == "" || nil
        #             soda2 << rapper
        #         end
        #     end
        #     soda2
        # end


    end




















    def print_database
        Scraper.new.create_database
        Artist.all.each do |rapper|
            if rapper.name && rapper.name != ""
                puts "Name: #{rapper.name}"
                puts "  Hangul: #{rapper.hangul}"
                if rapper.aka != ""
                puts "  As known As: #{rapper.aka}"
                end
                puts "  Birth Name: #{rapper.full_name}"
                puts "  Birthday: #{rapper.dob}"
                puts "  Gender: #{rapper.gender}"
                if rapper.hometown != ""
                puts "  Hometown: #{rapper.hometown}"
                end
                if rapper.label != ""
                puts "  Label: #{rapper.label}"
                else
                puts "  Label: Unsigned or Unknown"
                end
                puts "  Position: #{rapper.position}"
                if rapper.crew != ""
                puts "  Member of: #{rapper.crew}"
                end
                puts "---------"
            end
        end
    end



end
