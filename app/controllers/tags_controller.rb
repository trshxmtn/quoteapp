class TagsController < ApplicationController

  def index
    @popular_tags = ActsAsTaggableOn::Tag.most_used(3) #最も使われている上位10個のタグの取得

    @hash = Hash.new

    @popular_tags.each do |tag|
      popular_rhetoric = Rhetoric.tagged_with("#{tag.name}").order("picks_count DESC").first
      @hash.store(tag.name, popular_rhetoric.picture)
    end

    # @movie = Rhetoric.tagged_with("映画")
    movie = ["ONE PIECE", "宇宙兄弟", "キングダム", "ドラえもん", "BLEACH", "カイジ", "SLAM DUNK", "NARUTO", "はじめの一歩", "進撃の巨人", "闇金ウシジマくん", "王様達のヴァイキング", "コードギアス"]


  end

end
