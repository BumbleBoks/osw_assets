OneSWEmber.ImagePopupComponent = Ember.Component.extend
  actions:
    close_image_popup: ->
      $("#image_popup").css("display", "none")

    