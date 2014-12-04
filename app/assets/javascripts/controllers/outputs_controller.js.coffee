OneSWEmber.OutputsController = Ember.ArrayController.extend
  actions:
    open_item_popup: ->
      this.set("item_popup_open", true)

    close_item_popup: ->
      this.set("item_popup_open", false)

    open_shop_popup: ->
      this.set("shop_popup_open", true)

    close_shop_popup: ->
      this.set("shop_popup_open", false)
              
    show_products_for_item: (item_name) ->
      products = this.get('products').filterBy("item_name", item_name) 
      shops = this.get('shops')                                            
      products = products.filter((product, index, self) ->
        shop = shops.findBy("name", product.get('shop_name'))
        return shop.get("selected")
      )
      products.setEach("display", true)        

    hide_products_for_item: (item_name) ->
      products = this.get('products').filterBy("item_name", item_name)
      products.setEach("display", false)        
         
    show_products_for_shop: (shop_name) ->
      products = this.get('products').filterBy("shop_name", shop_name)
      items = this.get('items')                                            
      products = products.filter((product, index, self) ->
        item = items.findBy("name", product.get('item_name'))
        return item.get("selected")
      )
      products.setEach("display", true)        

    hide_products_for_shop: (shop_name) ->
      products = this.get('products').filterBy("shop_name", shop_name)
      products.setEach("display", false) 

    show_image_for_product: (product, aspect_ratio) ->
      this.set("image_product", product)
      image_height = $("#image_popup").width()*aspect_ratio
      $("#image_popup").css("height", image_height)

    close_image_popup: ->
      this.set("image_product", null) 

    show_detail_for_product: (product) ->   
      this.set("detail_product", product)

    close_detail_popup: ->
      this.set("detail_product", null)
      

  isItemPopupOpen: ((key, value) ->
    if (value == undefined)
      return this.get("item_popup_open")
    else
      this.set("item_popup_open", value)
  ).property('item_popup_open')

  isShopPopupOpen: ((key, value) ->
    if (value == undefined)
      return this.get("shop_popup_open")
    else
      this.set("shop_popup_open", value)
  ).property('shop_popup_open')
  
  isImagePopupOpen: ((key, value) ->
    if (value == undefined)
      return !(this.get("image_product") == null)
  ).property('image_product')  

  isDetailPopupOpen: ((key, value) ->
    if (value == undefined)
      return !(this.get("detail_product") == null)
  ).property('detail_product')
