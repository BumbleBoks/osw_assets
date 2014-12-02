OneSWEmber.ProductLineComponent = Ember.Component.extend 
  actions:
    open_image_popup: ->   
      product = this.get('product')
      image_element = $(event.target)
      aspect_ratio = image_element.height()/image_element.width()
      this.sendAction("image", product, aspect_ratio)

    open_site: (site) ->
      window.open(site)

    open_detail_popup: ->   
      product = this.get('product') 
      this.sendAction("detail", product)

  image_name: (->  
    product = this.get("product") 
    product.get("shop_name") + " " + product.get("name")
  ).property('product.shop_name', 'product.name')
    
  
