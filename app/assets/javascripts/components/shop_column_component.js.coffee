OneSWEmber.ShopColumnComponent = Ember.Component.extend
  actions:
    show_products_for_shop: (shop_name) ->
      this.sendAction('show', shop_name)

    hide_products_for_shop: (shop_name) ->
      this.sendAction('hide', shop_name)
