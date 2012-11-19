// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery
//= require jquery_ujs
//= require modernizr
//= require jquery.autosize.min
//= require placeholder-polyfill.min
//= require bootstrap-redu
//= require olark

$.getScript("http://use.typekit.com/lpo4rgu.js", function () {
    try {
        Typekit.load();
        $(".typekit-badge").css("left", "0");
    }catch(e){}
});
