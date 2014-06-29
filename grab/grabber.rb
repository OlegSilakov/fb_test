require 'rubygems'
require 'uri'
require 'nokogiri'
require "open-uri"

module Grabber
	def self.get_images_source(url)
		uri = URI("http://" + url)
		page = Nokogiri::HTML(open('http://google.com/search?q=tenderlove'))
		# puts page.class
		page.search('img').reduce([]) do |acc, tag|
			acc << tag['src'].split('?')[0]
		end
	end

	def self.save_image(img_source, path)
		# File.open(File.basename(img_source),'wb') do |f| 
		# 	f.write(open(uri).read) 
		# end
		name = img_source.match(/^http:\/\/.*\/(.*)$/)[1]
		puts name
		return if name.split('.')[1] == nil
		img = fetch(img_source)
		save(img, name, path)
	end

	def self.fetch(img_src)
        # puts "Fetching #{img_src}\n"
        image = open(img_src)
    end

    def self.save(image, name, path)
    	puts image
        File.open("#{path}/#{name}", "wb"){ |file| file.write(image.read) }
    end
end