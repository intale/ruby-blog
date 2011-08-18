$(document).ready(function() {
    $('#comment').submit(function() {
        var data = $(this).serialize();
        var url = $(this).attr("action");
        $.ajax({
            type:"POST",
            url: url,
            data: data,
            success: function (response) {
                if (response.author || response.content) {
                    console.log(response); // TODO Do error handling
                }
                else {
                    $(".comments:first").append(response);
                    $("#comment_content").val("");
                }
            }
        });
        return false;
    });

});
