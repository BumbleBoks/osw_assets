OneSWEmber.OutputsController = Ember.ArrayController.extend
  actions:
    open_item_popup: ->
      $("#items_popup").css("display", "block")

    open_shop_popup: ->
      $("#shops_popup").css("display", "block")
              
    show_products_for_item: (item_name) ->
      output = @model.get('firstObject')
      products = output.get('products').filterBy("item_name", item_name) 
      shops = output.get('shops')                                            
      products = products.filter((product, index, self) ->
        shop = shops.findBy("name", product.get('shop_name'))
        return shop.get("selected")
      )
      products.setEach("display", true)        

    hide_products_for_item: (item_name) ->
      output = @model.get('firstObject')
      products = output.get('products').filterBy("item_name", item_name)
      products.setEach("display", false)        
         
    show_products_for_shop: (shop_name) ->
      output = @model.get('firstObject')
      products = output.get('products').filterBy("shop_name", shop_name)
      items = output.get('items')                                            
      products = products.filter((product, index, self) ->
        item = items.findBy("name", product.get('item_name'))
        return item.get("selected")
      )
      products.setEach("display", true)        

    hide_products_for_shop: (shop_name) ->
      output = @model.get('firstObject')
      products = output.get('products').filterBy("shop_name", shop_name)
      products.setEach("display", false) 

    show_detail_for_product: (product) ->   
      output = @model.get('firstObject')
      output.set("detail_product", product)
      $("#detail_popup").css("display", "block") 
      $("#detail_popup #detail_site").css("display", "none")
      $("#detail_popup #svg-anim").css("display", "inline")
      $("#detail_popup #fetch_site").css("display", "block") 
      OneSWEmber.SVGAnimation.startAnimation()  

    show_image_for_product: (product) ->
      output = @model.get('firstObject')
      output.set("image_product", product)
      image_element = $(event.target)
      scale = $("#image_popup").width()/image_element.width()
      $("#image_popup").css("display", "block")  
      $("#image_popup").css("height", image_element.height()*scale)

  useOutput: (->
    @model.get('firstObject') 
  ).property()

