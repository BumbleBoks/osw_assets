OneSWEmber.AddItemComponent = Ember.Component.extend
  actions:
    add_item: (newItem) ->   
      return unless newItem
      new_item = this.get('newItem').trim()
      if new_item.length == 0
        this.set('newItem', "")
        return               
      this.set('addItem', true)
      items_controller = this       
      $.ajax
        url: "/window/add_item"
        type: 'POST'
        dataType: "script"
        data: new_choice: newItem
        complete: () ->       
          items_controller.set('newItem', "")
          items_controller.set('addItem', false)  

  add_message: (->  
    return unless this.get('newItem')    
    new_item = this.get('newItem').trim()
    return if new_item.length == 0
    return "Sending request to add item - " + new_item + " ..."
  ).property('this.addItem')  
