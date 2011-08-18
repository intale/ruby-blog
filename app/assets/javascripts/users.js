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
                if (response.error){
                    console.log(response.error); //TODO Make errors handle
                }
                $("form#comment .captcha_field").html(response.captcha);
            }
        });
        return false;
    });

});
