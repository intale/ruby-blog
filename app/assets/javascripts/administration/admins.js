// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
// = require ckeditor/ckeditor
// = require jquery
// = require jquery_ujs
// = require jquery.autocomplete
$(document).ready(function() {
    $(("#tag_name")).autocomplete({
        source: function(request, callback) {
            console.log(request);
            console.log(callback);
        },
        select: function(event, ui) {

        }
    });
});
$(document).ready(function() {
    $('#tag-form').submit(function() {
        var data = $(this).serialize();
        console.log(data);
        $.ajax({
            type: "POST",
            data: data,
            url: '/administration/tags',
            success: function (response) {
                console.log(response);
            }
        });
       return false;
    });
});
