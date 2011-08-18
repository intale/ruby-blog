$(document).ready(function() {
    $('#comment').submit(function() {
        var data = $(this).serialize();
        var url = $(this).attr("action");
        $.ajax({
            type:"POST",
            url: url,
            data: data,
            success: function (response) {
                if (response.comment){
                    $(".comments:first").append(response.comment);
                    $("#comment_content").val("");
                }
                if (response.errors){
                    console.log(response.errors); //TODO Make errors handle
                }
                $("form#comment .captcha_field").html(response.captcha);
            }
        });
        return false;
    });

});
