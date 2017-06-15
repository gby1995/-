$().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
    $("#formd").validate({ //document.getELementById('but');
        rules: {
            username: {
                required: true,
                minlength: 2
            },
            password: {
                required: true,
                minlength: 6,
                maxlength:15
            },
            confirm_password: {
                required: true,
                minlength: 6,
                maxlength: 15,
                equalTo: "#password"
            },
            email: {
                required: true,
                email: true
            },
            phone:{
                required:true,
                isMobile:true
            }
        },
        messages: {
            username: {
                required: "请输入用户名",
                minlength: "用户名必需至少由两个字母组成"
            },
            password: {
                required: "请输入密码",
                minlength: "密码长度不能小于 6个字母",
                maxlength:"密码长度不能大于 15个字母"
            },
            confirm_password: {
                required: "请输入密码",
                minlength: "密码长度不能小于 6 个字母",
                maxlength:"密码长度不能大于 15个字母",
                equalTo: "两次密码输入不一致"
            },
            email: "请输入一个正确的邮箱",
            phone:{
                required:"请输入手机号",
                isMobile:"请输入有效的手机号"
            }
        },
        errorPlacement: function(error, element) { //错误信息位置设置方法
            error.appendTo( element.next()); //这里的element是录入数据的对象
           console.log(element.next());
        }
    });
});
jQuery.validator.addMethod("isMobile", function(value, element) {
    var length = value.length;
    var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
    return this.optional(element) || (length == 11 && mobile.test(value));
}, "请正确填写您的手机号码");