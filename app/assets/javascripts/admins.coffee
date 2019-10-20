# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#setInterval (->
#  $('.clock-container .clock').load '/admin/get_time'
#  return
#), 1000

$(document).ready ->
 #$(document).on 'turbolink:load', ->
 #$("a[data-remote]").each ->
   #$(this).on "ajax:success", (event) ->
     #location.reload()
 $("a[data-remote]").on "ajax:success", (event) ->
   location.reload()
    #$('.employees_buttons_or_records').load '/admin/get_button_or_record'
   #$(this).click  ->
   #$("a[data-remote]").on "ajax:success", (event) ->
    #$('.employees_buttons_or_records').load '/admin/get_button_or_record'
    #return
###
 $(".registrar_entrada_0").on "ajax:success", (event) ->
  $('.employees_buttons_or_records').load '/admin/get_button_or_record'
 $(".registrar_entrada_1").on "ajax:success", (event) ->
  $('.employees_buttons_or_records').load '/admin/get_button_or_record'
 $(".registrar_entrada_2").on "ajax:success", (event) ->
  $('.employees_buttons_or_records').load '/admin/get_button_or_record'
 $(".registrar_entrada_3").on "ajax:success", (event) ->
  $('.employees_buttons_or_records').load '/admin/get_button_or_record'
 $(".registrar_entrada_4").on "ajax:success", (event) ->
  $('.employees_buttons_or_records').load '/admin/get_button_or_record'
 $(".registrar_entrada_5").on "ajax:success", (event) ->
  $('.employees_buttons_or_records').load '/admin/get_button_or_record'
 $(".registrar_entrada_6").on "ajax:success", (event) ->
  $('.employees_buttons_or_records').load '/admin/get_button_or_record'
###

#$('.control_sheet a').click.load '/admin/get_record_time'
#$( ".employees_buttons_or_records" )
  #.html( "<p>All new content. <em>You bet!</em></p>" );
#$(document).ready ->
 #$('.employees_buttons_or_records').load '<%= render partial: "buttons_or_records" %>'


 #$("a.registrar_entrada").click ->
  #setTimeout (->
   #$('.employees_buttons_or_records').load '/admin/get_button_or_record'
   #return
  #), 5000

 #$('#div_id').html("<%= render :partial => 'my_partial' %>");
 #$('.employees_buttons_or_records').html '<p>All new content. <em>You bet!</em></p>'
  #return
  #$(".control_sheet").click
#$('.employees_buttons_or_records').html "<%= render :partial => '_buttons_or_records', locals: { employees: @employees } >"
#$('div.demo-container').html '<p>All new content. <em>You bet!</em></p>'
