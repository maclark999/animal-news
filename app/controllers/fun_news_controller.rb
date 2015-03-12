class FunNewsController < ApplicationController
  def index
    @title = NewsFetcher.new
  end
end
