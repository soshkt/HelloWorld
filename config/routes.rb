Bluerain::Application.routes.draw do
  get "activities/show"

  match "/v1" => redirect("http://itunes.apple.com/cn/app/id454984086")
  match "/v2" => redirect("http://itunes.apple.com/cn/app/id454984086")
  match "/v3" => redirect("http://goo.gl/qWeJx")
  match "/v4" => redirect("http://goo.gl/qWeJx")
  match "/v5" => redirect("http://goo.gl/CKRnH")
  match "/v6" => redirect("http://goo.gl/FfF5V")

  match "/v/weibo-signin" => redirect("http://3g.sina.com.cn/prog/wapsite/sso/register.php")

  match "/" => "misc#index_v2"

  resources :comments do
    get "list", :on => :member
  end

  resources :activities, :only => [:show] do
    resources :comments
    put "like", :on => :member
  end

  match '/activities/list/:id' => "activities#list"
  get "invitation/" => "invitation#index"
  get "invitation/oops"

  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  match '/auth/logout' => 'sessions#destroy'
  root :to => "misc#index_v3"
  get "setting" => "misc#setting"
  get "about" => "misc#about"
  post "create_feedback" => "misc#create_feedback"

  resources :moments do
    get "explore", :on => :collection
    get "explore_nearby", :on => :collection
  end

  resources :people do
    member do
      get "timeline"
      get "mapview"
      get "launch_page"
    end
    collection do
      get "setting"
      post "update_theme_color"
    end

    resources :moments do
      get "location", :on => :collection
    end
  end

  resources :photos do
    put "like", :on => :member
    delete "remove", :on => :member
  end

  get '/misc/popover_text/:campaign_id' => "misc#popover_text"

  scope "labs" do
    resources :friends
  end
end
