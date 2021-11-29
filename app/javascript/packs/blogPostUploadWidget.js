
var user_name = $("#user_name").val() ?? null;
var folder = "users_management_app" + (user_name ? ('/' + user_name) : '' + '/blog_posts');
folder += '/blog_posts';

var myWidget = cloudinary.createUploadWidget({
    cloudName: 'vlad-beil-cloudinary',
    upload_preset: 'users_management_app',
    folder: folder
    }, (error, result) => { if (result.event == "success") {
        console.log(result.info)
        $("#blog_post_img")?.attr("value", result.info.public_id);
        $("#post_current_img")?.find("img")?.attr("src", result.info.eager[1].secure_url);
    } })

$("#post_current_img")?.on("click", function() {
        myWidget.open();
});
