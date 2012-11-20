// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery
//= require jquery_ujs
//= require modernizr
//= require jquery.autosize.min
//= require placeholder-polyfill.min
//= require bootstrap-redu
//= require olark
//= require analytics

$(function() {

  $(".form-search").submit(function() {
    var val = $(this).children('input').val();
    if ($.trim(val) === "") {
        return false;
    }
  });

});

