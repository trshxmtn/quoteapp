module RhetoricsHelper
  include ActsAsTaggableOn::TagsHelper
  require 'mini_magick'
  require 'securerandom'

  #名言部分の設定
  BASE_IMAGE_PATH = './app/assets/images/ogp_back.png'.freeze
  GRAVITY1 = 'north-west'.freeze # 上部に配置
  TEXT_POSITION1 = '30,88'.freeze # 上から88px下げる
  FONT1 = './app/assets/fonts/NotoSansCJKjp-Medium.otf'.freeze
  FONT_SIZE1 = 35
  FONT_COLOR1 = "#1A2023"
  # 一行あたりの文字数
  INDENTION_COUNT1 = 20
  ROW_LIMIT1 = 100

  #発言者部分の設定
  GRAVITY2 = 'south-west'.freeze # 下部に配置
  TEXT_POSITION2 = '30,100'.freeze # 下から88px上げる
  FONT2 = './app/assets/fonts/NotoSansCJKjp-Medium.otf'.freeze
  FONT_SIZE2 = 22
  FONT_COLOR2 = "#1A2023"
  INDENTION_COUNT2 = 20
  ROW_LIMIT2 = 100

  class << self
    # 合成後のFileClassを生成
    def build(text, speaker)
      # 元画像取得
      @image = MiniMagick::Image.open(BASE_IMAGE_PATH)
      # 名言文字列の整形
      text = prepare_text1(text)
      # 発言者文字列の整形
      speaker = prepare_text2(speaker)
      # 名言と発言者の文字量に合わせて画像リサイズ
      prepare_image(text, speaker)
      # 画像に名言埋め込み
      configuration1(text)
      # 画像に発言者埋め込み
      configuration2(speaker)
    end

    # 合成後のFileの書き出し
    # def write(text)
    #   build(text)
    #   @image.write uniq_file_name
    # end

    # # 発言者
    # def write2(text)
    #   build2(text)
    #   @image.write uniq_file_name
    # end

    private

    # uniqなファイル名を返却
    def uniq_file_name
      "#{SecureRandom.hex}.png"
    end

    # 名言部分の設定関連の値を代入
    def configuration1(text)
      @image.combine_options do |config|
        # フォント
        config.font FONT1
        # 文字色
        config.fill FONT_COLOR1
        # 文字描写位置
        config.gravity GRAVITY1
        # フォントサイズ
        config.pointsize FONT_SIZE1
        # 文字描写
        config.draw "text #{TEXT_POSITION1} '#{text}'"
      end
    end

    # 名言部分の背景にいい感じに収まるように文字を調整して返却
    def prepare_text1(text)
      text.scan(/.{1,#{INDENTION_COUNT1}}/)[0...ROW_LIMIT1].join("\n")
    end

    # 文字量に合わせて背景画像をリサイズ
    def prepare_image(text, speaker)
      # 文字描写前の画像の高さ
      default_height = 176
      # 行数
      meigen_rows = text.length/INDENTION_COUNT1 + 1
      speaker_rows = speaker.length/INDENTION_COUNT2 + 1
      # 名言と発言者の間の余白
      margin = 22
      # 最終的な画像の高さ
      image_height = default_height + meigen_rows * 66 + speaker_rows * 33 + margin
      # 高さをリサイズ
      @image.resize "700x#{image_height}!"
    end

    # 発言者部分
    def configuration2(speaker)
      @image.combine_options do |config|
        config.font FONT2
        config.fill FONT_COLOR2
        config.gravity GRAVITY2
        config.pointsize FONT_SIZE2
        config.draw "text #{TEXT_POSITION2} '#{speaker}'"
      end
    end

    # 発言者部分
    def prepare_text2(speaker)
      speaker.scan(/.{1,#{INDENTION_COUNT2}}/)[0...ROW_LIMIT2].join("\n")
    end

  end

end
