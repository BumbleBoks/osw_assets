OneSWEmber.ProductController = Ember.ObjectController.extend 
  actions:
    open_image_popup: -> 
      image_element = $(event.target)
      scale = $("#image_popup").width()/image_element.width()
      $("#image_popup").css("display", "block")  
      $("#image_popup").css("height", image_element.height()*scale) 
      $("#image_popup img").attr("src", @model.get('image'))
      $("#image_popup img").attr("width", "80%")    
      #$("#image_popup img").attr("height", "75%")    

    open_site: (site) ->    
      window.open(site)

    open_detail_popup: ->
      $("#detail_popup a#open_button").attr("href", @model.get("link"))
      $("#detail_popup #detail_site").css("display", "none")
      fetch_site_text = "Opening url for " + @get("image_name") + " ..."
      $("#detail_popup #fetch_site p").text(fetch_site_text)  
      $("#detail_popup #fetch_site").css("display", "block")
      $("#detail_popup #svg-anim").css("display", "inline")
      $("#detail_popup #detail_site").attr("src", @model.get("link"))
      @model.set('detail_popup_status', true)
      $("#detail_popup").css("display", "block")      

      $("#detail_popup #detail_site").load () -> 
        OneSWEmber.SVGAnimation.stopAnimation()
        $("#detail_popup #svg-anim").css("display", "none")
        $("#detail_popup #fetch_site p").text("")
        $("#detail_popup #fetch_site").css("display", "none")
        $("#detail_popup #detail_site").css("display", "inline")


    process_option_click: ->
      clicked_element = event.target.nodeName  
      if clicked_element.match("a") == null && clicked_element.match("A") == null
        @open_detail_popup()
        OneSWEmber.SVGAnimation.startAnimation() 

  image_name: (->
    @model.get("shop_name") + " " + @model.get("name")
  ).property('model.shop_name', 'model.name')
      
    
