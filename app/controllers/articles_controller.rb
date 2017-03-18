require 'nokogiri'

class ArticlesController < ApplicationController

	def clawl
		clawl_mainichi
	end

	def clawl_mainichi
		url = 'http://mainichi.jp/'
		@clawl_mainichi = Nokogiri::HTML.parse(open(url), nil, nil)
		@entry_list = @clawl_mainichi.xpath('//ul[@class="list-typeA"]').xpath('.//a')
	end

end
