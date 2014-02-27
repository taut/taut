require "net/http"
require "bundler"
Bundler.require

class GifMe < Sinatra::Application

  get "/slack" do
    slack_url = URI("https://#{ config.slack.domain }.slack.com/services/hooks/incoming-webhook?token=#{ config.slack.token }")

    gif = params[:joke] || gifme(params[:text])

    body = "<@#{ params[:user_id]}|#{ params[:user_name] }>: \"#{ params[:text] }\" #{ gif }"

    payload = { "channel"    => "##{ params[:channel_name] }",
                "username"   => config.slack.username,
                "icon_emoji" => config.slack.emoji,
                "text"       => body }

    ::Net::HTTP.post_form(slack_url, {"payload" => MultiJson.dump(payload)})

    return
  end

  protected

  def gifme(search)
    giphy_url = URI("http://api.giphy.com/v1/gifs/search?q=#{ URI.escape(params[:text]) }&api_key=#{ config.giphy.api_key }")
    MultiJson.load(::Net::HTTP.get(giphy_url))["data"].sample["images"]["fixed_height"]["url"]
  end

  def config
    OpenStruct.new({
      giphy: OpenStruct.new({
        api_key: ENV["GIPHY_API_KEY"]
      }),

      slack: OpenStruct.new({
        domain: ENV["SLACK_DOMAIN"],
        token: ENV["SLACK_TOKEN"],
        emoji: ENV["SLACK_EMOJI"],
        username: ENV["SLACK_USERNAME"]
      })
    })
  end

end

run GifMe
