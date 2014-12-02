OneSWEmber.ProductColumnComponent = Ember.Component.extend
  actions:
    show_detail_for_product: (product) ->
      this.sendAction("detail", product)  

    show_image_for_product: (product, aspect_ratio) ->
      this.sendAction("image", product, aspect_ratio)
