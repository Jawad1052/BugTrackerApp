Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '620800050956-lpdmreeqjuu6cuiuqu7vfun1jfvls98p.apps.googleusercontent.com', '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',
           # scope: 'userinfo.email, userinfo.profile',
           prompt: 'select_account',
           image_aspect_ratio: 'square',
           image_size: 50,
           access_type: 'offline'
end