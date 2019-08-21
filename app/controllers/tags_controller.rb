class TagsController < ApplicationController

  def index
    @popular_tags = ActsAsTaggableOn::Tag.most_used(10) #最も使われている上位3(ほんとは10)個のタグの取得

    @top_hash = Hash.new

    @popular_tags.each do |tag|
      popular_rhetoric = Rhetoric.tagged_with("#{tag.name}").order("picks_count DESC").first
      @top_hash.store(tag.name, popular_rhetoric.picture)
    end

    ############

    anime_names = ["カイジ", "宇宙兄弟", "キングダム", "ONE PIECE", "王様達のヴァイキング", "闇金ウシジマくん", "アイアムアヒーロー", "ここは今から倫理です。", "アオアシ", "文豪ストレイドッグス"]

    @anime_tags = []

    anime_names.each do |name|
      @anime_tags.push(ActsAsTaggableOn::Tag.find_by(name: name))
    end

    @anime_hash = Hash.new

    @anime_tags.each do |tag|
      anime_rhetoric = Rhetoric.tagged_with("#{tag.name}").order("picks_count DESC").first
      @anime_hash.store(tag.name, anime_rhetoric.picture)
    end

    ############

    philosopher_names = ["ソクラテス", "デカルト", "ニーチェ", "カント", "マルクス", "西田幾多郎", "和辻哲郎", "九鬼周造", "フーコー", "サルトル"]

    @philosopher_tags = []

    philosopher_names.each do |name|
      @philosopher_tags.push(ActsAsTaggableOn::Tag.find_by(name: name))
    end

    @philosopher_hash = Hash.new

    @philosopher_tags.each do |tag|
      philosopher_rhetoric = Rhetoric.tagged_with("#{tag.name}").order("picks_count DESC").first
      @philosopher_hash.store(tag.name, philosopher_rhetoric.picture)
    end
  end

end
