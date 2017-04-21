require 'nokogiri'
require 'open-uri'

class ArticlesController < ApplicationController
	before_action :clawling, only: [:news, :newses]
	def newses
		@entry_a = @clawl_news.xpath('//ul[@class="list-typeA"]').xpath('.//a')
	end

	def news
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

	def new
		@article = Article.new
	end

	def create
		@article = Article.create(article_params)
		redirect_to article_path(@article)
	end

	def show
		@article = Article.find(params[:id])
	end

	private
	def clawling
		url = 'https://mainichi.jp/'
		@clawl_news = Nokogiri::HTML.parse(open(url), nil, nil)
	end

	def article_params
		params.require(:article).permit(:title, :body, :user_id)
	end
end
