class TagsController < ApplicationController

  def index
    @popular_tags = ActsAsTaggableOn::Tag.most_used(10) #最も使われている上位3(ほんとは10)個のタグの取得

    @top_hash = Hash.new

    @popular_tags.each do |tag|
      popular_rhetoric = Rhetoric.tagged_with("#{tag.name}").order("picks_count DESC").first
      @top_hash.store(tag.name, popular_rhetoric.picture)
    end

    ############

    saved_names = ["家族", "先輩", "後輩", "友達", "先生", "恋人"]

    @saved_tags = []

    saved_names.each do |name|
      @saved_tags.push(ActsAsTaggableOn::Tag.find_by(name: name))
    end

    @saved_hash = Hash.new

    @saved_tags.each do |tag|
      saved_rhetoric = Rhetoric.tagged_with("#{tag.name}").order("picks_count DESC").first
      @saved_hash.store(tag.name, saved_rhetoric.picture)
    end

    ############

    entrepreneur_names = ["イーロン・マスク", "ピーター・ティール", "スティーブ・ジョブズ", "マーク・ザッカーバーグ", "藤田晋", "孫正義"]

    @entrepreneur_tags = []

    entrepreneur_names.each do |name|
      @entrepreneur_tags.push(ActsAsTaggableOn::Tag.find_by(name: name))
    end

    @entrepreneur_hash = Hash.new

    @entrepreneur_tags.each do |tag|
      entrepreneur_rhetoric = Rhetoric.tagged_with("#{tag.name}").order("picks_count DESC").first
      @entrepreneur_hash.store(tag.name, entrepreneur_rhetoric.picture)
    end

    ############

    great_writer_names = ["芥川龍之介", "坂口安吾", "武者小路実篤"]

    @great_writer_tags = []

    great_writer_names.each do |name|
      @great_writer_tags.push(ActsAsTaggableOn::Tag.find_by(name: name))
    end

    @great_writer_hash = Hash.new

    @great_writer_tags.each do |tag|
      great_writer_rhetoric = Rhetoric.tagged_with("#{tag.name}").order("picks_count DESC").first
      @great_writer_hash.store(tag.name, great_writer_rhetoric.picture)
    end

    ############

    anime_names = ["宇宙兄弟", "キングダム", "カイジ", "アオアシ", "闇金ウシジマくん", "文豪ストレイドッグス", "王様達のヴァイキング", "アイアムアヒーロー", "ここは今から倫理です。"]

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
