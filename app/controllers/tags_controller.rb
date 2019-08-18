class TagsController < ApplicationController

  def index
    @popular_tags = ActsAsTaggableOn::Tag.most_used(3) #最も使われている上位3(ほんとは10)個のタグの取得

    @top_hash = Hash.new

    @popular_tags.each do |tag|
      popular_rhetoric = Rhetoric.tagged_with("#{tag.name}").order("picks_count DESC").first
      @top_hash.store(tag.name, popular_rhetoric.picture)
    end

  anime_names = ["カイジ", "宇宙兄弟", "キングダム"]

    # , "ドラえもん", "BLEACH", "カイジ", "SLAM DUNK", "NARUTO", "はじめの一歩", "進撃の巨人", "闇金ウシジマくん", "王様達のヴァイキング", "コードギアス"

    @anime_tags = []

    anime_names.each do |name|
      @anime_tags.push(ActsAsTaggableOn::Tag.find_by(name: name))
    end

    @anime_hash = Hash.new

    @anime_tags.each do |tag|
      anime_rhetoric = Rhetoric.tagged_with("#{tag.name}").order("picks_count DESC").first
      @anime_hash.store(tag.name, anime_rhetoric.picture)
    end

  end

end
