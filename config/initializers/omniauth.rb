opts = { scope: 'user:email' }

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :github, 'a9daf99f6ef9f060fb69', '311b40cb992a35ef409359465336b69fcea346b1'
end
