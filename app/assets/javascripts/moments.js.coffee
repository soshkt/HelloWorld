# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$(document).ready ->
    $(".tools > div.share").live 'hover', ->
        $(@).children(".dropdown").fadeToggle(100)

    $("#moment_show a.img_box:not(.selected)").live 'hover',  ->
        $(@).children(".mask").stop(true, true).fadeToggle(200)

    $("#moment_show a.img_box").live 'click',  ->
        $(".selected").removeClass("selected")
        $(@).addClass("selected")
        $(@).children(".mask").show()


    $("#moments .photos img").lazyload
    	effect : "fadeIn"