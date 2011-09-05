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
        $.ajax({
            type: "POST",
            data: data,
            url: '/administration/tags',
            success: function (response) {
                if (response.tag) {
                    $(".navigation").append(response.tag);
                    $("#tag_name").val('');
                }
                else {
                    $(".flash").html('<div class="message error">' + response.error + '</div>');
                }
            }
        });
        return false;
    });
});


function deleteTagAssociation(post_id, tag_id, auth_token) {
    var url = '/administration/tags/' + tag_id
    $.ajax({
        type: "DELETE",
        data: {post_id: post_id, authenticity_token: auth_token},
        url: url,
        success: function (response) {
            if (response == "ok") {
                $("#tag_" + tag_id).html('');
            }
            else {
                $(".flash").html('<div class="message error">' + response + '</div>');
            }
        }
    });
}
