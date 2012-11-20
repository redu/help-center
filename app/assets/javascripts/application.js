// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery
//= require jquery_ujs
//= require modernizr
//= require jquery.autosize.min
//= require placeholder-polyfill.min
//= require bootstrap-redu
//= require olark

$(function() {

  $(".form-search").submit(function() {
    var val = $(this).children('input').val();
    if ($.trim(val) === "") {
        return false;
    }
  });

});

$.cachedScript = function(url) {
  options = {
    dataType: "script",
    cache: true,
    url: url
  };

  return $.ajax(options);
};

$.cachedScript("http://use.typekit.com/lpo4rgu.js").done(function() {
    try {
        Typekit.load();
        $(".typekit-badge").css("left", "0");
    }catch(e){}
});
