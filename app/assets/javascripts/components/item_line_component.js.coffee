OneSWEmber.ItemLineComponent = Ember.Component.extend
  actions:
    toggleFaved: ->
      item = this.get('item')   
      item.toggleProperty('faved')
      $.ajax
        url: "/window/update_favorite_item"
        type: 'POST'
        dataType: "script"
        data: item_id: item.get('id'), status: item.get('faved')           

  isFaved: ((key, value) ->
    item = this.get('item')

    if (value == undefined)
      return item.get('faved')
    else
      item.set('faved', value)
  ).property('item.faved')      

  isSelected: ((key, value) ->
    item = this.get('item')
    
    if (value == undefined)
      return item.get('selected')
    else
      item.set('selected', value)
      if (value == true)
        this.sendAction('show', item.get('name'))
      else   
        this.sendAction('hide', item.get('name'))
      return value
  ).property('item.selected') 
