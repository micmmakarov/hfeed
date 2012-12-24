if ENV['RAILS_ENV'] == 'development'
  FACEBOOK_APP_ID= '306044179500661' # please change!
  FACEBOOK_APP_SECRET= 'd55c4919c1e9ec21099c518e7be75674' # please change!
  FACEBOOK_SITE_URL = 'http://localhost:3000/'
  FACEBOOK_CALLBACK = 'http://localhost:3000/facebook/callback'
end
if ENV['RAILS_ENV'] == 'production'
  FACEBOOK_APP_ID= '383953478364607 ' # please change!
  FACEBOOK_APP_SECRET= '415e323661df8ae84ca6cc84640621a2' # please change!
  FACEBOOK_SITE_URL = 'http://hfeed.herokuapp.com/'
  FACEBOOK_CALLBACK = 'http://hfeed.herokuapp.com/facebook/callback'
end