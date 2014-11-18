# For more information see: http://emberjs.com/guides/routing/

OneSWEmber.Router.map ()->
  @resource 'outputs', path: "/"
  OneSWEmber.SVGAnimation = new SVGAnimation($("#svg-anim"), $("#svg_circles"));
     
OneSWEmber.OutputsRoute = Ember.Route.extend
  model: -> 
    this.store.find('output')

  setupController: (controller, model) ->
    output = model.get("firstObject")
    products = output.get("products")
    items = output.get("items") 
    items.forEach( (item) ->
      item.set('faved', item.get('selected'))
    )
    shops = output.get("shops") 
    shops.forEach( (shop) ->
      shop.set('faved', shop.get('selected'))
    ) 

    products.forEach( (product) ->
      item = items.findBy("name", product.get("item_name"))
      shop = shops.findBy("name", product.get("shop_name"))
      product.set("display", item.get('selected') && shop.get('selected'))
    )        
    controller.set('model', model) 
