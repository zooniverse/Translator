module.exports = App.FieldView = Ember.View.extend
  templateName: 'field'
  classNameBindings: [':field', 'isMising:present:missing']
  
  isMissing: (->
    @get 'controller.model.missing'
  ).property('controller.model.missing')
