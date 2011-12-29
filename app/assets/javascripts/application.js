// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.cycle.lite 
//= require jquery.purr
//= require jquery.ba-bbq.min
//= require backbone.js/underscore-min
//= require video
//= require jquery.lazyload
//= require bootstrap-twipsy
//= require bootstrap-modal
//= require jquery.cookie
//= require bootstrap-popover
//= require date.format
//= require spin.min
//= require jquery.spin
//= require jquery.lightbox
//= require_tree .

_.templateSettings = {
  interpolate : /\{\{(.+?)\}\}/g,
  evaluate : /\{\-(.+?)\-\}/g
};

function gup( name )
{
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp( regexS );
  var results = regex.exec( window.location.href );
  if( results == null )
    return "";
  else
    return results[1];
}