Rails.application.config.middleware.use OmniAuth::Builder do
    provider :douban, '0ba735a563a6b3cb22f5a0f02af41b61', '5e56273e05a60094' 
    provider :tsina, '1509711052', '90250fd184a42c89483dc8a4c394370c' 
end

