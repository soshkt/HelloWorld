# Place all the behaviors and hooks related to the matching controller here.  # All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("a[data-remote=true]").live 'click', ->
      $(@).text($(@).attr("data-disable-with"))


  slide = (param)->
        switch param
            when 'show' then [moveTo, condition] = ['0px', '-133px']
            when 'hide' then [moveTo, condition] = ['-133px', '0px']
            else  alert "世界末日！不该有这个框的！"
        ($(@).animate "marginRight" : moveTo, 200, ->) if ($(@).css('marginRight') is condition)
  $("#login_widget").hover (-> slide.call @, 'show'),
        (-> slide.call @, 'hide')

  place_footer = ->
        footer = $("#footer")
        if $("#person_timeline_page #moments").size() > 0
            $("#footer").css {
                "marginTop" : parseInt($("#moments").height()) + 140
            }
        if $("#misc_frontpage").size() > 0
            $("#footer").css {
                "position": "fixed",
                "bottom": "0px",
                "width": "100%"
            }
        if $("#invitation").size() > 0
            $("#footer").css {
                "marginTop" : "380px",
            }
        


  place_footer()
  $(window).resize( place_footer )

  $("#iphone_layout").cycle { speed: 1000, prev: "#arrow_l", next: "#arrow_r" }

  $(".menu").hover ->
      $(@).children(".submenu").fadeToggle(100)


  $(".user_avatar").live "hover", ->
      $(@).children(".profile_box").toggle()
