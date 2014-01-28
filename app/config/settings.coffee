Settings =
  developmentLocal:
    apiHost: 'http://localhost:3000'
  
  developmentRemote:
    apiHost: 'https://dev.zooniverse.org'
  
  production:
    apiHost: 'https://api.zooniverse.org'

env = if window.location.port is '9295'
  'developmentLocal'
else if window.location.port > 1024 or window.location.host is 'demo.zooniverse.org'
  'developmentRemote'
else
  'production'

module.exports = Settings[env]
