module.exports =
  titleize: (text) ->
    text.replace /([A-Z])(\w)/g, (match, capital, letter) ->
      "_#{ capital.toLowerCase() }#{ letter }"
    .replace /([-_ ]|^)(\w)/g, (match, separator, letter) ->
      " #{ letter.toUpperCase() }"
    .trim()
