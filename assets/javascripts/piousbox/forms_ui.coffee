
$(document).ready ->

  $(".add-hover-toggle").hover ->
    $(this).next().fadeIn 500

  $(".add-hover-toggle").next().hover (->
    return
  ), ->
    $(this).fadeOut 100

  $(".addToggle").click ->
    $(this).next().toggle 500

  $("input.name").keyup ->
    Text = $(this).val()
    Text = $.trim(Text.toLowerCase())
    Text = Text.replace(/\s/g, "-")
    Text = Text.replace(/[^a-zA-Z0-9]+/g, "-")
    $("input.name-seo").val Text