# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#setInterval (->
#  $('.clock-container .clock').load '/admin/get_time'
#  return
#), 1000

 
$(document).ready ->
   

 $(document).on 'ajax:success', 'a[data-remote]', -> 
  $('.employees_buttons_or_records').load '/admin/get_records'

 $(window).scroll ->
   scroll = $(window).scrollTop()
   if scroll >= 5
    $(".calometro .row").addClass "shadow_calometro"
    $(".title .row").addClass "shadow_calometro"
   else
    $(".calometro .row").removeClass "shadow_calometro"
    $(".title .row").removeClass "shadow_calometro"
   return
