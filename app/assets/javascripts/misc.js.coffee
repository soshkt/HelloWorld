# Place all the behaviors and hooks related to the matching controller here.  # All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("a[data-remote=true]").live 'click', ->
      $(@).text($(@).attr("data-disable-with"))

  $("#iphone_layout").cycle { speed: 1000, prev: "#arrow_l", next: "#arrow_r" }