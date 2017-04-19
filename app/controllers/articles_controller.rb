require 'nokogiri'
require 'open-uri'

class ArticlesController < ApplicationController
	before_action :clawling, only: [:index, :show]
# binding.pry
	def index
		#@entry_span = @clawl_news.xpath('//ul[@class="list-typeA"]').xpath('.//span')
		#@entry_list = @clawl_news.xpath('//ul[@class="list-typeA"]').xpath('.//li')
		@entry_a = @clawl_news.xpath('//ul[@class="list-typeA"]').xpath('.//a')
	end

	def show
	 # 	url = 'https://mainichi.jp/'
		# @clawl_news = Nokogiri::HTML.parse(open(url), nil, nil)
		@entry_list = @clawl_news.xpath('//ul[@class="list-typeA"]').xpath('.//li')
		id = params[:id].to_i
		@article = @entry_list[id]
		@article = Article.find(params[:id])
	end

	private
	def clawling
		url = 'https://mainichi.jp/'
		@clawl_news = Nokogiri::HTML.parse(open(url), nil, nil)

	end
end
