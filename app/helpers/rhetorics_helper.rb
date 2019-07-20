module RhetoricsHelper

  require 'mini_magick'
  require 'securerandom'

  BASE_IMAGE_PATH = './app/assets/images/quote_default.png'.freeze
  GRAVITY = 'center'.freeze
  TEXT_POSITION = '0,0'.freeze
  FONT = './app/assets/fonts/幻ノにじみ明朝.otf'.freeze
  FONT_SIZE = 44
  FONT_COLOR = "white"
  # 一行あたりの文字数
  INDENTION_COUNT = 12
  ROW_LIMIT = 100

  class << self
    # 合成後のFileClassを生成
    def build(text)
      # 元画像取得
      @image = MiniMagick::Image.open(BASE_IMAGE_PATH)
      # 文字列の整形
      text = prepare_text(text)
      # 画像リサイズ
      prepare_image(text)
      # 画像に文字埋め込み
      configuration(text)
    end

    # 合成後のFileの書き出し
    def write(text)
      build(text)
      @image.write uniq_file_name
    end

    private

    # uniqなファイル名を返却
    def uniq_file_name
      "#{SecureRandom.hex}.png"
    end

    # 設定関連の値を代入
    def configuration(text)
      @image.combine_options do |config|
        # フォント
        config.font FONT
        # 文字色
        config.fill FONT_COLOR
        # 文字描写位置
        config.gravity GRAVITY
        # フォントサイズ
        config.pointsize FONT_SIZE
        # 行幅
        config.interline_spacing 22
        # 文字描写
        config.draw "text #{TEXT_POSITION} '#{text}'"
      end
    end

    # 背景にいい感じに収まるように文字を調整して返却
    def prepare_text(text)
      text.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
    end

    # 文字量に合わせて背景画像をリサイズ
    def prepare_image(text)
      # 文字描写前の画像の高さ
      default_height = 176
      # 行の数
      rows_count = text.length/12 + 1
      # 最終的な画像の高さ
      image_height = default_height + rows_count * 56
      # 高さをリサイズ
      @image.resize "700x#{image_height}!"
    end
  end

end
