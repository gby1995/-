var imgs = document.getElementById("xiao").getElementsByTagName("img");
var da = document.getElementById("da");
var l = imgs.length;
for(var i=0;i<l;i++){
    (function(i){
        imgs[i].addEventListener('mouseenter',function(){
            var name = this.getAttribute("src");
            da.setAttribute("src",name);
        });
    })(i)
}

//增加
$("#add").click(function() {
    var num = parseInt($("#bookNum").val()) || 0;
    $("#bookNum").val(num + 1);
});
//减去
$("#sub").click(function() {
    var num = parseInt($("#bookNum").val()) || 0;
    num = num - 1;
    num = num < 1 ? 1 : num;
    $("#bookNum").val(num);
});