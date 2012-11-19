// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery
//= require jquery_ujs
//= require modernizr
//= require jquery.autosize.min
//= require placeholder-polyfill.min
//= require bootstrap-redu
//= require olark

$(document).ready(function() {

  $(".form-search .button-default").click(function(e) {
    var val = $(".form-search .control-area").val();
    if ($.trim(val) === "") {
        return false;
    }
  });

});

