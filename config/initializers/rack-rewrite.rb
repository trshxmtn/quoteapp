if ENV['RACK_ENV'] == 'production'
  Rhetori::Application.config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
    r301 %r{.*}, 'https://quote-by.me$&', :if => Proc.new {|rack_env|
      rack_env['SERVER_NAME'] == 'www.quote-by.me'
    }
  end
end