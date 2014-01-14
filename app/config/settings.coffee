Settings =
  developmentLocal:
    apiHost: 'http://localhost:3000'
    classifyUrl: 'http://localhost:9295/#/classify'
    talkHost: 'http://localhost:9296'
    analytics: { }
  
  developmentRemote:
    apiHost: 'https://dev.zooniverse.org'
    classifyUrl: 'http://demo.zooniverse.org/ember-app/#/classify'
    talkHost: 'http://demo.zooniverse.org/ember-app-talk'
    analytics: { }
  
  production:
    apiHost: 'https://dev.zooniverse.org'
    classifyUrl: 'http://demo.zooniverse.org/ember-app/#/classify'
    talkHost: 'http://demo.zooniverse.org/ember-app-talk'
    analytics: { }

env = if window.location.port is '9295'
  'developmentLocal'
else if window.location.port > 1024
  'developmentRemote'
else
  'production'

module.exports = Settings[env]
