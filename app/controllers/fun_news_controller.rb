class FunNewsController < ApplicationController
  def index
    @titles = NewsFetcher.new.titles.sample
  end
end
