OneSWEmber.ProductsController = Ember.ArrayController.extend
  itemController: 'product'

  displayProducts: (->
    @model.filterBy("display", true)
  ).property('@each.display')
