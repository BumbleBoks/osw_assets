OneSWEmber.DetailPopupComponent = Ember.Component.extend
  actions:
    close_detail_popup: -> 
      $("#detail_popup #detail_site").attr("src", "")
      $("#detail_popup").css("display", "none")   
    
    