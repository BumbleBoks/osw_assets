class @SVGAnimation
  constructor: () -> 
  
  setSVGAttributes: (element, attributes) ->
    for attr in Object.keys(attributes)
      element.setAttribute(attr, attributes[attr])
    return element	 
                       
  makeSVGElement: (tag, attributes) ->
    svgElement = document.createElementNS("http://www.w3.org/2000/svg", tag)
    this.setSVGAttributes(svgElement, attributes)
    return svgElement

  startAnimation: () ->     
    blue_animation_attributes = {attributeName: "transform", attributeType: "XML", type: "rotate",\
     from: "0 0 0", to: "360 0 0", \
     dur: "10s", repeatCount: "indefinite"}
    orange_animation_attributes = {attributeName: "transform", attributeType: "XML", type: "rotate",\
     from: "180 0 0", to: "-180 0 0", \
     dur: "10s", repeatCount: "indefinite"}
    blue_animate_motion = this.makeSVGElement('animateTransform', blue_animation_attributes)
    orange_animate_motion = this.makeSVGElement('animateTransform', orange_animation_attributes)
    $("#svg_circles").find("#orangecircle").append(orange_animate_motion)
    $("#svg_circles").find("#bluecircle").append(blue_animate_motion)

  stopAnimation : () ->
    $("#svg_circles").find("#orangecircle").find("animateTransform").remove()
    $("#svg_circles").find("#bluecircle").find("animateTransform").remove()
 
