var editor = new wangEditor('content');
if (editor.config) {
    editor.config.uploadImgUrl = '/posts/image/upload';
    editor.config.uploadHeaders = {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    };
    editor.create();
}

$.ajaxSetup({
    headers:{
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
})

$('.like-button').click(function (event) {
    var target = $(event.target)
    var current_like = target.attr('like-value')
    var user_id = target.attr('like-user')

    var url = ''
    if (current_like == 1) {
        url = '/user/' + user_id + '/unfan'
        $.ajax({
            url,
            method: 'POST',
            dataType: 'json',
            success: function (data) {
                if (data.error != 0) {
                    alert(data.msg)
                    return
                }
                target.attr('like-value', 0)
                target.text('关注')
            }
        })
    } else {
        url = '/user/' + user_id + '/fan'
        $.ajax({
            url,
            method: 'POST',
            dataType: 'json',
            success: function (data) {
                if (data.error != 0) {
                    alert(data.msg)
                    return
                }
                target.attr('like-value', 1)
                target.text('取消关注')
            }
        })
    }
})