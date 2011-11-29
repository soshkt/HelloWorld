$(document).ready ->
    $("#person_timeline_page .img_box, #person_timeline_page .left_box").live 'hover', ->
        $(@).children(".mask").stop(true, true).fadeToggle(200)

    $(document).scroll ->
        if $(document).scrollTop() >=30 
            $("#fixed_box").css {"position" : "fixed", "top" : "0px"}
        else
            $("#fixed_box").css {"position" : "absolute", "top" : "30px"}

# $("#person_mapview_page").ready ->

#     if $(".timeline_item").size() > 0
#         $timeline = $(".timeline")
#         $timeline.append("<span id='magic-line' class='timeline_item theme_border_color'></span>") 

#         $magicLine = $("#magic-line")

#         $magicLine
#             .width($(".selected").width())
#             .css("left", $(".selected").position().left)
#             .data("origLeft", $magicLine.position().left)
#             .data("origWidth", $magicLine.width())


#         $(".timeline a").hover ->
#                 leftPos = $(@).position().left
#                 newWidth = $(@).width()
#                 $magicLine.stop().animate({
#                     left: leftPos,
#                     width: newWidth
#                 })
#             ,->
#                 $magicLine.stop().animate({
#                     left: $magicLine.data("origLeft"),
#                     width: $magicLine.data("origWidth")
#                 })

#         $("a.timeline_item").click ->
#             $("#magic-line").data("origLeft", $(".selected").position().left).data("origWidth", $(".selected").width())
#             $magicLine.stop().animate({
#                 left: $magicLine.data("origLeft"),
#                 width: $magicLine.data("origWidth")
#             })
#         $.get $(".selected").attr("href")

#     $(".sec_0").css "left", ($(window).width() - $(".timeline_item").first().outerWidth()) / 2

    