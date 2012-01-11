# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#


$(document).ready ->
  $('#photo_and_page_layout').mouseenter ->
    $('#last_page').css "visibility","visible"
    $('#next_page').css "visibility","visible"
  $('#photo_and_page_layout').mouseleave ->
    $('#last_page').css "visibility","hidden"
    $('#next_page').css "visibility","hidden"
    
