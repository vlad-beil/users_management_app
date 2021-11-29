
var user_name = $("#user_user_name").val() ?? null;
var folder = "users_management_app" + (user_name ? ('/' + user_name) : '');

var myWidget = cloudinary.createUploadWidget({
    cloudName: 'vlad-beil-cloudinary',
    upload_preset: 'users_management_app',
    folder: folder
    }, (error, result) => { if (result.event == "success") {
        console.log(result.info)
        $("#user_img")?.attr("value", result.info.public_id);
        $("#user_current_img")?.find("img")?.attr("src", result.info.eager[1].secure_url);
    } })

$("#user_current_img")?.on("click", function() {
        myWidget.open();
});
