module Taut
  class GifMe < ::Sinatra::Application

    get "/gif" do
      slack_url = URI("https://#{ config.slack_domain }.slack.com/services/hooks/incoming-webhook?token=#{ config.slack_token }")

      gif = config.joke || gifme(params[:text])

      body = "<@#{ params[:user_id]}|#{ params[:user_name] }>: \"#{ params[:text] }\" #{ gif }"

      payload = { "channel"    => "##{ params[:channel_name] }",
                  "username"   => config.slack_username,
                  "icon_emoji" => config.slack_emoji,
                  "text"       => body }

      ::Net::HTTP.post_form(slack_url, {"payload" => MultiJson.dump(payload)})

      return
    end

    protected

    def config
      Taut::Configuration
    end

    def gifme(search)
      giphy_url = URI("http://api.giphy.com/v1/gifs/random?tag=#{ URI.escape(params[:text]) }&api_key=#{ config.giphy_api_key }")
      MultiJson.load(::Net::HTTP.get(giphy_url))["data"]["image_url"]
    end

  end
end
