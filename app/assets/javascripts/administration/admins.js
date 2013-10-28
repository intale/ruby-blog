// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
// = require ckeditor/ckeditor
// = require jquery
// = require jquery_ujs
// = require jquery.autocomplete

$(document).ready(function() {
    $("#tag_name").autocomplete("/administration/search_tag");
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

$(function() {
  function updatePostIframe() {
      var message = $("#cke_contents_post_message > iframe").contents().find(".cke_show_borders").html();
      var subject = $("#post_subject").val();
      $("#post-iframe").contents().find("#post-body").html(message);
      $("#post-iframe").contents().find(".item:first > h2").html(subject);
      setTimeout(updatePostIframe, 5000);
      return false;
  }
  updatePostIframe();
});