require 'nokogiri'

class ArticlesController < ApplicationController

	def index
		@article = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def clawl
		clawl_news
	end

	def clawl_news
		url = 'https://mainichi.jp/'
		@clawl_news = Nokogiri::HTML.parse(open(url), nil, nil)
		@entry_list = @clawl_news.xpath('//ul[@class="list-typeA"]').xpath('.//a')
	end
end
