OneSWEmber.Output = DS.Model.extend  
  products: DS.hasMany('product')
  items: DS.hasMany('item')
  shops: DS.hasMany('shop')
