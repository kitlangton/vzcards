# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".navlink").mouseenter(->
    if $(@).find("a").hasClass("active") != true
      $(@).find("a").velocity
        color: "#ff0000", 100
      $(@).velocity
        translateY: "-5px"
        borderBottomWidth: "5px"
        marginBottom: "-5px"
      ,
        "100"
    ).mouseleave ->
      if $(@).find("a").hasClass("active") != true
        $(@).find("a").velocity("stop", true).velocity
          color: "#777"
        $(@).velocity("stop", true).velocity
          translateY: "0px"
          borderBottomWidth: "0px"
          marginBottom: "0px"
        ,
          "100"

  $(".cart-status").on 'click', ->
    if $(@).hasClass "added"
      $(@).closest(".card").find(".cart-added").velocity
        width: "10px"
        paddingRight: "5px"
      ,
        "100"
      $(@).removeClass "added"
    else
      $(@).addClass "added"
      $(@).closest(".card").find(".cart-added").velocity
        width: "75px"
        paddingRight: "12px"
      ,
        "spring"
