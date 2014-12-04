OneSWEmber.DetailPopupComponent = Ember.Component.extend
  actions:
    close_detail_popup: -> 
      $("#"+this.get("elementId")).find("#detail_site").attr("src", "")  
      this.sendAction('close')

  set_display: ( ->
    if (this.get("product") != null)    
      el = $("#"+this.get("elementId"))  
      el.find("iframe#detail_site").css("display", "none")
      el.find("#svg-anim").css("display", "inline")
      el.find("div#fetch_site").css("display", "block")
      OneSWEmber.SVGAnimation.startAnimation()
  ).observes('product') 

 
