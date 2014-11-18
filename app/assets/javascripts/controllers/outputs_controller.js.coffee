OneSWEmber.OutputsController = Ember.ArrayController.extend
  needs: ['products']
  actions:
    open_item_popup: ->
      $("#items_popup").css("display", "block")

    open_shop_popup: ->
      $("#shops_popup").css("display", "block")
              
    close_shop_popup: ->
      $("#shops_popup").css("display", "none")

    show_products_for_item: (item_name) ->
      output = @model.get('firstObject')
      products = output.get('products').filterBy("item_name", item_name)
      products.setEach("display", true)        

    hide_products_for_item: (item_name) ->
      output = @model.get('firstObject')
      products = output.get('products').filterBy("item_name", item_name)
      products.setEach("display", false)        
         
    show_products_for_shop: (shop_name) ->
      output = @model.get('firstObject')
      products = output.get('products').filterBy("shop_name", shop_name)
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
