translate = require 't7e'
enUs = require '../lib/en-us'
translate.load enUs

Settings = require './settings'
User = require 'zooniverse/models/user'
Classification = require 'zooniverse/models/classification'
Api = require 'zooniverse/lib/api'
LanguageManager = require 'zooniverse/lib/language-manager'
TopBar = require 'zooniverse/controllers/top-bar'
Footer = require 'zooniverse/controllers/footer'

zooniverse.api = new Api project: 'galaxy_zoo', host: Settings.apiHost

languageManager = new LanguageManager
  translations:
    en: label: 'English', strings: enUs

languageManager.on 'change-language', (e, code, strings) ->
  translate.load strings
  translate.refresh()

zooniverse.topBar = new TopBar
zooniverse.topBar.el.appendTo $('#header')
zooniverse.footer = new Footer
zooniverse.footer.el.appendTo $('#footer')
zooniverse.util = $.extend zooniverse.util, require '../lib/util'
zooniverse.isMobile = require('../lib/detect_mobile')()
User.fetch()
