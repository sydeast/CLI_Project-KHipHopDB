require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './artist.rb'

class Scraper
    def get_page
        Nokogiri::HTML(open("https://dbkpop.com/db/korean-hip-hop-rb-artists"))
    end

    def get_database_info
        self.get_page.css("tbody").css("tr")
    end

    def create_database
        self.get_database_info.each do |row|
            artist = Artist.new
            artist.name = row.css("td")[0].text
            artist.aka = row.css("td")[1].text
            artist.hangul = row.css("td")[2].text
            artist.full_name = row.css("td")[3].text
            artist.dob = row.css("td")[5].text
            artist.gender = row.css("td")[9].text
            artist.hometown = row.css("td")[10].text
            artist.crew = row.css("td")[8].text
            artist.position = row.css("td")[13].text
            if row.css("td")[7].text != ""
                artist.label = row.css("td")[7].text
            else
                artist.label = "Unsigned or Unknown"
            end
        end
    end

    # def print_database
    #     self.create_database
    #     Artist.all.each do |rapper|
    #         if rapper.name && rapper.name != ""
    #             puts "Name: #{rapper.name}"
    #             puts "  Hangul: #{rapper.hangul}"
    #         if rapper.aka != ""
    #             puts "  As known As: #{rapper.aka}"
    #         end
    #             puts "  Birth Name: #{rapper.full_name}"
    #             puts "  Birthday: #{rapper.dob}"
    #             puts "  Gender: #{rapper.gender}"
    #         if rapper.hometown != ""
    #             puts "  Hometown: #{rapper.hometown}"
    #         end
    #         if rapper.label != ""
    #             puts "  Label: #{rapper.label}"
    #         end
    #             puts "  Position: #{rapper.position}"
    #         if rapper.crew != ""
    #             puts "  Member of: #{rapper.crew}"
    #             end
    #         end
    #     end
    # end

end
