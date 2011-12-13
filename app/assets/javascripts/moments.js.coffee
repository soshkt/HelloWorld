# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$(document).ready ->
  $('#photo_layout').mouseenter ->
    $('#last_page').css "visibility","visible"
    $('#next_page').css "visibility","visible"
  $('#photo_layout').mouseleave ->
    $('#last_page').css "visibility","hidden"
    $('#next_page').css "visibility","hidden"
  
  $('#weibo_icon').mouseenter ->
    $('#weibo_icon').css "background-position","0px 0px"
  $('#weibo_icon').mouseleave ->
    $('#weibo_icon').css "background-position","0px -36px" 
  $('#douban_icon').mouseenter ->
    $('#douban_icon').css "background-position","-41px 0px"
  $('#douban_icon').mouseleave ->
    $('#douban_icon').css "background-position","-41px -36px"
  $('#renren_icon').mouseenter ->
    $('#renren_icon').css "background-position","-82px 0px"
  $('#renren_icon').mouseleave ->
    $('#renren_icon').css "background-position","-82px -36px"
  $('#qq_icon').mouseenter ->
    $('#qq_icon').css "background-position","-123px 0px"
  $('#qq_icon').mouseleave ->
    $('#qq_icon').css "background-position","-123px -36px"
  $('#download_iphone').mouseenter ->
    $('#download_iphone').css "background-position","0px -72px"
  $('#download_iphone').mouseleave ->
    $('#download_iphone').css "background-position","0px 0px"
  $('#download_android').mouseenter ->
    $('#download_android').css "background-position","-220px -72px"
  $('#download_android').mouseleave ->
    $('#download_android').css "background-position","-220px 0px"
    
  