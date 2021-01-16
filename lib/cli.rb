require 'nokogiri'
require 'open-uri'
require 'pry'

class Cli
    # Calls the Cli and scraper to start with a welcome msg
    def call
        Scraper.new.create_database
        puts "안녕하세요!! Welcome to the Korean Hip/Hop and R&B Database!
        With my help, I can show you profiles on Korea's hottest non K-Pop artists. Please note information may be incorrect or incomplete."
        start
    end

    #defines Start method, gathers user's inputs
    def start
        # artistMap variable creates mapping of artists by label by calling retrieve_artists_by_label method
        artistMap = retrieve_artists_by_label
        # while true loops allows user to continue to search through the database
        while true
            puts ""
            puts "Please select one of the following label numbers or minus one [-1] to exit."
            #creates and dsiplays a listing of all unique labels with a number for user to select from using artistMap variable
            indexed_labels(artistMap)
            # input variable to capture user's selection from the indexed_label list
            input = gets.strip.to_i
            # if/elsif/else to validate first input and continue or discontinue program
            if input >= 1 && input <= artistMap.keys.length
                #artistProfile variable uses the user's input to return all values (artists) associated to the selected label key of the artistMap hash
                artistProfile = artistMap[artistMap.keys[input-1]]
                #Prints the artists' profiles (or values) as a str based on the previously selected key
                print_database(artistProfile)
                puts ""
                puts "Would you like to see another label? [y/n]"
                puts ""
                # records the second input to check if user would like to continue
                input_2 = gets.strip.downcase
                # if/elsif/else to validate secound input and continue or disconue program
                if input_2 == 'y'
                    start
                elsif input_2 == 'n'
                    puts ""
                    puts "Thank you! I will close now! 안녕! Bye!"
                    exit
                else
                    puts ""
                    puts "죄송합니다! I'm sorry. I did not understand. Let's try again!"
                    start
                end
            elsif input == -1
                puts ""
                puts "Thank you! I will close now! 안녕! Bye!"
                    exit
            else
                puts ""
                puts "죄송합니다! I'm sorry. I did not understand. Let's try again!"
                start
            end
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

    # Prints the database as a string-ifed entity
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
