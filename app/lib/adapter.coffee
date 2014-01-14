App.ZooniverseAdapter = DS.RESTAdapter.extend
  ajax: (url, type, hash) ->
    adapter = @
    new Ember.RSVP.Promise (resolve, reject) ->
      hash = adapter.ajaxOptions url, type, hash
      hash.success = (json) -> Ember.run(null, resolve, json)
      hash.error = (jqXHR, textStatus, errorThrown) -> Ember.run(null, reject, adapter.ajaxError(jqXHR))
      zooniverse.api.request type.toLowerCase(), url, hash.data, hash.success, hash.error
    , "DS: RestAdapter#ajax #{ type } to #{ url }"

App.ApplicationSerializer = DS.RESTSerializer.extend
  extractArray: (store, primaryType, payload) ->
    @_super store, primaryType, @rooted(primaryType, payload, true)
  
  extractSingle: (store, primaryType, payload, recordId, requestType) ->
    @_super store, primaryType, @rooted(primaryType, payload, false), recordId, requestType
  
  rooted: (type, payload, pluralized) ->
    root = if pluralized then Ember.String.pluralize(type.typeKey) else type.typeKey
    newPayload = { }
    newPayload[root] = payload
    newPayload

App.Store = DS.Store.extend
  revision: 12
  adapter: 'zooniverse'
