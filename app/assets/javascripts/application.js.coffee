#= require jquery
#= require jquery_ujs    
#= require svg_animation
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require one_sw_ember

# for more details see: http://emberjs.com/guides/application/
window.OneSWEmber = Ember.Application.create  
  update_detail_popup: ->
    this.SVGAnimation.stopAnimation()
    $("#detail_popup #svg-anim").css("display", "none")
    $("#detail_popup #fetch_site").css("display", "none")
    $("#detail_popup #detail_site").css("display", "inline")