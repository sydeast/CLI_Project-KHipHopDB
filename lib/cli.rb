require 'nokogiri'
require 'open-uri'
require 'pry'

class Cli
attr_accessor :print_artist
    def call
    Scraper.new.create_database
        puts "안녕하세요!! Welcome to the Korean Hip/Hop and R&B Database!
 With my help, I can show you profiles on Korea's hottest non K-Pop artists. Please note information may be incorrect or incomplete."
        start
    end

    def start
        while true
            puts ""
            puts "To start please select one of the following labels' number."
            artistMap = retrieve_artists_by_label
            indexed_labels(artistMap)
            # indexed_labels

         # input = gets.strip.downcase
         input = gets.strip.to_i
            # binding.pry
         artistProfile = artistMap[artistMap.keys[input-1]]
         print_database(artistProfile)
            # if input == "y"
         # find_all_inLabel(input)
            # get_label

            # puts "Thank you! I will close now! 안녕! Bye!"
            # exit
            # rapper = Artist.all[input]
            # self.print_artist
            # elsif
            # find_all_inLabel(input)
            puts ""
            puts "Would you like to see another label? [y/n]"
            puts ""
            input2 = gets.strip.downcase
            if input2 == 'y'
                start
            else
                puts ""
                puts "Thank you! I will close now! 안녕! Bye!"
                exit
            end
            # puts "I'm sorry. I cannot do that at this time"
            # input = gets.chomp
            #     self.print_database
            # elsif input == "n" || !"y"
            # puts ""

        end
    end

    # Returns an array of all unique labels in the Artist.all object
    # def get_label
    #         labels = []
    #         Artist.all.select do |rapper|
    #           labels << rapper.label
    #         end
    #         uniqueLabels = labels.uniq
    # end

    # Returns the variable in get_label as its index+1 and the label name in string format
    def indexed_labels(artistMap)
        artistMap.keys.each.with_index(1) do |label, index|
            puts "#{index}. #{label}"
        end
    end

# Creates a hash map by label of all Artist objects
    def retrieve_artists_by_label
            artistMap = Hash.new(nil)
            Artist.all.each do |rapper|
                if artistMap[rapper.label] == nil
                    newArtistArr = []
                    newArtistArr << rapper
                    artistMap[rapper.label] = newArtistArr
                else
                    existingArtistArr = artistMap[rapper.label]
                    existingArtistArr << rapper
                end
            end
            artistMap
    end




    # Prints the entire database as a string-ifed item
    # artistProfile = artistMap[artistMap.keys[input-1]]
    def print_database(artistProfile)
       artistProfile.each do |rapper|
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
