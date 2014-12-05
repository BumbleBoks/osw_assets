OneSWEmber.DetailPopupComponent = Ember.Component.extend
  actions:
    close_detail_popup: -> 
      $("#"+this.get("elementId")).find("#detail_site").attr("src", "")  
      this.sendAction('close')

  set_display: ( ->
    OneSWEmber.set('iframe_display', false)
    if (this.get("product") != null)
      OneSWEmber.SVGAnimation.startAnimation()
  ).observes('product')

  isDisplayLinkLoaded: ((key, value) ->
    if (value == undefined)
      if OneSWEmber.get('iframe_display') == true
        OneSWEmber.SVGAnimation.stopAnimation()
      return OneSWEmber.get("iframe_display")
  ).property('OneSWEmber.iframe_display')
  