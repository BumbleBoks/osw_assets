OneSWEmber.ImagePopupComponent = Ember.Component.extend
  actions:
    close_image_popup: ->
      this.sendAction('close')

    