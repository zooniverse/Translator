module.exports = App.FieldView = Ember.View.extend
  templateName: 'field'
  classNameBindings: [':field', 'isMissing', 'isOutOfDate', 'isUpToDate']
  
  isMissing: (->
    @get('controller.model.isMissing')
  ).property('controller.model.isMissing')
  
  isOutOfDate: (->
    @get('controller.model.isOutOfDate')
  ).property('controller.model.isOutOfDate')
  
  isUpToDate: (->
    @get('controller.model.isUpToDate')
  ).property('controller.model.isUpToDate')
  
  afterRenderEvent: ->
    english = @$('.english')
    textarea = @$('.translated textarea')
    newHeight = english.height() + 4
    textarea.css('height', newHeight) if newHeight > textarea.height()
