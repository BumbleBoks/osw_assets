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

  useOutput: (->
    @model.get('firstObject') 
  ).property()

#  actions: ->
#
#  itemsInModel: ->
#    this 
