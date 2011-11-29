task :test_oauth => :environment do
  sina_api_key = "1509711052"
  sina_api_key_secret = "90250fd184a42c89483dc8a4c394370c"
  @consumer = OAuth::Consumer.new(
    sina_api_key,
    sina_api_key_secret,
    {
    :site=>"http://api.t.sina.com.cn",
    :realm => "OmniAuth"}
  )
  p @consumer

  p request_token = ::OAuth::RequestToken.new(@consumer, "20c453695350d8ebc2852459c6a9e481", "72a6be64eae71ad2651969da6b82f1e5")
  p request_token.get_access_token({:oauth_verifier => "626383"})
end
