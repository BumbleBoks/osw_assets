OneSWEmber.ItemPopupComponent = Ember.Component.extend
  actions:
    show_products_for_item: (item_name) ->
      this.sendAction('show', item_name)

    hide_products_for_item: (item_name) ->
      this.sendAction('hide', item_name)

    close_item_popup: ->  
      this.sendAction('close') 
    
