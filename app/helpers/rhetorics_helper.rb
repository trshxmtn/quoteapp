module RhetoricsHelper

  require 'mini_magick'
  require 'securerandom'

  #名言部分の設定
  BASE_IMAGE_PATH = './app/assets/images/quote_default.png'.freeze
  GRAVITY1 = 'center'.freeze
  TEXT_POSITION1 = '0,0'.freeze
  FONT1 = './app/assets/fonts/NotoSansCJKjp-Medium.otf'.freeze
  FONT_SIZE1 = 44
  FONT_COLOR1 = "white"
  # 一行あたりの文字数
  INDENTION_COUNT1 = 12
  ROW_LIMIT1 = 100

  #発言者部分の設定
  GRAVITY2 = 'south'.freeze #デフォルトを下の方にする
  TEXT_POSITION2 = '0,20'.freeze #ちょっと上の方に表示
  FONT2 = './app/assets/fonts/NotoSansCJKjp-Medium.otf'.freeze
  FONT_SIZE2 = 30
  FONT_COLOR2 = "white"
  INDENTION_COUNT2 = 11
  ROW_LIMIT2 = 8

  class << self
    # 合成後のFileClassを生成
    def build1(text)
      # 元画像取得
      @image = MiniMagick::Image.open(BASE_IMAGE_PATH)
      # 文字列の整形
      text = prepare_text1(text)
      # 画像リサイズ
      prepare_image(text)
      # 画像に名言埋め込み
      configuration1(text)
    end

    #発言者
    def build2(text)
      text = prepare_text2(text)
      configuration2(text)
    end

    # 合成後のFileの書き出し
    # def write(text)
    #   build(text)
    #   @image.write uniq_file_name
    # end

    # 発言者
    def write2(text)
      build2(text)
      @image.write uniq_file_name
    end

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
        # 行幅
        config.interline_spacing 22
        # 文字描写
        config.draw "text #{TEXT_POSITION1} '#{text}'"
      end
    end

    # 名言部分の背景にいい感じに収まるように文字を調整して返却
    def prepare_text1(text)
      text.scan(/.{1,#{INDENTION_COUNT1}}/)[0...ROW_LIMIT1].join("\n")
    end

    # 文字量に合わせて背景画像をリサイズ
    def prepare_image(text)
      # 文字描写前の画像の高さ
      default_height = 176
      # 行の数
      rows_count = text.length/12 + 1 + 2
      # 最終的な画像の高さ
      image_height = default_height + rows_count * 56
      # 高さをリサイズ
      @image.resize "700x#{image_height}!"
    end

    # 発言者部分
    def configuration2(text)
      @image.combine_options do |config|
        config.font FONT2
        config.fill FONT_COLOR2
        config.gravity GRAVITY2
        config.pointsize FONT_SIZE2
        config.draw "text #{TEXT_POSITION2} '#{text}'"
      end
    end

    # 発言者部分
    def prepare_text2(text)
      text.scan(/.{1,#{INDENTION_COUNT2}}/)[0...ROW_LIMIT2].join("\n")
    end

  end

end
