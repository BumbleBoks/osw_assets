OneSWEmber.ProductLineComponent = Ember.Component.extend 
  actions:
    open_image_popup: ->   
      product = this.get('product')
      image_element = $(event.target)
      scale = $("#image_popup").width()/image_element.width()
      $("#image_popup").css("display", "block")  
      $("#image_popup").css("height", image_element.height()*scale) 
      $("#image_popup img").attr("src", product.get('image'))
      $("#image_popup img").attr("width", "80%")    
      #$("#image_popup img").attr("height", "75%")    

    open_site: (site) ->
      window.open(site)

    open_detail_popup: ->   
      product = this.get('product')
      $("#detail_popup a#open_button").attr("href", product.get("link"))
      $("#detail_popup #detail_site").css("display", "none")
      fetch_site_text = "Opening url for " + this.get("image_name") + " ..."
      $("#detail_popup #fetch_site p").text(fetch_site_text)  
      $("#detail_popup #fetch_site").css("display", "block")
      $("#detail_popup #svg-anim").css("display", "inline")
      $("#detail_popup #detail_site").attr("src", product.get("link"))
      product.set('detail_popup_status', true)
      $("#detail_popup").css("display", "block") 
      OneSWEmber.SVGAnimation.startAnimation()     

  $("#detail_popup #detail_site").load () -> 
    OneSWEmber.SVGAnimation.stopAnimation()
    $("#detail_popup #svg-anim").css("display", "none")
    $("#detail_popup #fetch_site p").text("")
    $("#detail_popup #fetch_site").css("display", "none")
    $("#detail_popup #detail_site").css("display", "inline")

  image_name: (->  
    product = this.get("product") 
    product.get("shop_name") + " " + product.get("name")
  ).property('product.shop_name', 'product.name')
    
  
