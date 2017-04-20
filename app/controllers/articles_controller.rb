require 'nokogiri'
require 'open-uri'

class ArticlesController < ApplicationController
	before_action :clawling, only: [:index, :show]
#binding.pry

	def index
		@entry_a = @clawl_news.xpath('//ul[@class="list-typeA"]').xpath('.//a')
	end

	def show
		@entry_list = @clawl_news.xpath('//ul[@class="list-typeA"]').xpath('.//li')
		id = params[:id].to_i
		@article = @entry_list[id]
		href = @article.children.to_ary
		href = href[1]
		href = href["href"]
		url = "https://mainichi.jp/#{href}"
		@clawl_new = Nokogiri::HTML.parse(open(url), nil, nil)
		@entry_title = @clawl_new.xpath('//article').xpath('.//header')
		@entry_body = @clawl_new.xpath('//article').xpath('.//p')
	end

	private
	def clawling
		url = 'https://mainichi.jp/'
		@clawl_news = Nokogiri::HTML.parse(open(url), nil, nil)
	end
end
