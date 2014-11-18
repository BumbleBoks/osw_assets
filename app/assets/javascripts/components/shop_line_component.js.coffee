OneSWEmber.ShopLineComponent = Ember.Component.extend
  actions:
    toggleFaved: () ->   
      shop = this.get('shop')
      shop.toggleProperty('faved')
      $.ajax
        url: "/window/update_favorite_shop"
        type: 'POST'
        dataType: "script"
        data: shop_id: shop.get('id'), status: shop.get('faved')        

  isSelected: ((key, value) ->
    shop = this.get('shop')
  
    if (value == undefined)
      return shop.get('selected')
    else
      shop.set('selected', value)
      if (value == true)
        this.sendAction('show', shop.get("name"))
      else   
        this.sendAction('hide', shop.get("name"))
      return value
  ).property('shop.selected')	

  isFaved: ((key, value) ->
    shop = this.get('shop')

    if (value == undefined)
      return shop.get('faved')
    else
      shop.set('faved', value)
  ).property('shop.faved')      
