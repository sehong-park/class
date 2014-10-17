# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
paintIt = (element, backgroundColor, textColor) ->
  element.style.backgroundColor = backgroundColor
  if textColor?
    element.style.color = textColor

$(document).on "page:change", ->
  $(".practice .check-btn").click ->
    backgroundColor = '#eeeeee'
    textColor = $(this).css("background-color")
    target = $(this).data("target")
    #alert "#{backgroundColor}, #{textColor}, #{target}"
    paintIt($(target)[0], backgroundColor, textColor)