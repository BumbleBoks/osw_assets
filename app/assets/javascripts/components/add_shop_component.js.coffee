OneSWEmber.AddShopComponent = Ember.Component.extend
  actions:
    add_shop: (newShop) ->   
      return unless newShop
      new_shop = this.get('newShop').trim()
      if new_shop.length == 0
        this.set('newShop', "")
        return               
      this.set('addShop', true)
      shops_controller = this       
      $.ajax
        url: "/window/add_shop"
        type: 'POST'
        dataType: "script"
        data: new_choice: newShop
        complete: () ->       
          shops_controller.set('newShop', "")
          shops_controller.set('addShop', false)  

  add_message: (->  
    return unless this.get('newShop')    
    new_shop = this.get('newShop').trim()
    return if new_shop.length == 0
    return "Sending request to add shop - " + new_shop + " ..."
  ).property('this.addShop')  
