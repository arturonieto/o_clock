// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require angular
//= require popper
//= require bootstrap-sprockets
//= require chartkick
//= require Chart.bundle


$(document).ready(function () {

    //setInterval(function () {
    //    $('.clock-container .clock').load('/admin/get_time');
    //}, 1000);
    //return $("a[data-remote]").on("ajax:success", function(event) {
      //return location.reload();
    //});

    $(".left_menu").hover(function(){
      $(this).addClass("open_left_menu");
    }, function() {
      $(this).removeClass("open_left_menu");
    });

    $(window).scroll(function() {
        var scroll = $(window).scrollTop();

        if (scroll >= 3) {
          $(".header").addClass("shadow");
        }
        else{
          $(".header").removeClass("shadow");
        }
    });


});
