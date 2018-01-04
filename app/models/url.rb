class Url < ApplicationRecord

  #link = "https://www.rottentomatoes.com/m/hulk/"
  #link = "https://www.rottentomatoes.com/m/it_comes_at_night/"
  #link = "https://www.rottentomatoes.com/tv/black_mirror"
  #link = "https://www.rottentomatoes.com/m/insidious_the_last_key"

  def parseHTML(link)
    require 'open-uri'
    doc = Nokogiri::HTML( open(link) )

    title = doc.title
    puts "doc title is: " + title
    self.title = title

    movie_or_tv = link.split(".com/")[1].split("/")[0]
    puts "movie_or_tv is: " + movie_or_tv
    self.movie_or_tv = movie_or_tv

    tomato_meter = doc.css("span.superPageFontColor")[0]
    puts "tomato_meter is: " + tomato_meter
    self.tomato_meter = tomato_meter

    audience_score = doc.css("span.superPageFontColor")[12] ? doc.css("span.superPageFontColor")[12] : "null"
    puts "audience_score is: " + audience_score
    self.audience_score = audience_score
  end

  def fix_title
    self.title = self.title.split(" - Rotten Tomatoes")[0]
  end

  def fix_tomato_meter
    self.tomato_meter = self.tomato_meter.split("<span class=\"meter-value superPageFontColor\"><span>")[1].split("</span>")[0]
  end

  def fix_audience_score
    if self.audience_score.include?("superPageFontColor")
      self.audience_score = audience_score.split("<span class=\"superPageFontColor\" style=\"vertical-align:top\">")[1].split("%")[0]
    end
  end

  def parse_and_fix(link)
    self.parseHTML(link)
    self.save
    self.fix_title
    self.fix_tomato_meter
    self.fix_audience_score
    self.save
  end

end
