class Url < ApplicationRecord

  #url = "https://www.rottentomatoes.com/m/hulk/"
  #url = "https://www.rottentomatoes.com/m/it_comes_at_night/"
  #url = "https://www.rottentomatoes.com/tv/black_mirror"

  def parseHTML(url)
    require 'open-uri'
    doc = Nokogiri::HTML( open(url) )

    title = doc.title
    puts "doc title is: " + title
    self.title = title

    movie_or_tv = url.split(".com/")[1].split("/")[0]
    puts "movie_or_tv is: " + movie_or_tv
    self.movie_or_tv = movie_or_tv

    tomato_meter = doc.css("span.superPageFontColor")[0]
    #tomato_meter = tomato_meter.split("<span class=\"meter-value superPageFontColor\"><span>")[1].split("</span>")[0]
    puts "tomato_meter is: " + tomato_meter
    self.tomato_meter = tomato_meter

    audience_score = doc.css("span.superPageFontColor")[12] ? doc.css("span.superPageFontColor")[12] : "null"
    #audience_score.split("<span class=\"superPageFontColor\" style=\"vertical-align:top\">")[1].split("%")[0]
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

end
