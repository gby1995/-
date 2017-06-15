//判断当前浏览器类型
// // function lazyload() {
        //     var images = document.getElementsByTagName('img');
        //     var len    = images.length;
        //     var n      = 0;      //存储图片加载到的位置，避免每次都从第一张图片开始遍历       
        //     return function() {
        //     var seeHeight = document.documentElement.clientHeight; //当前可视区域内的高度
        //     var scrollTop = document.documentElement.scrollTop || document.body.scrollTop; //网页被卷去的高度
        //     for(var i = n; i < len; i++) {
        //         if(images[i].offsetTop < seeHeight + scrollTop) { //offsetTop:图片距离文档顶部的距离
        //             if(images[i].getAttribute('src') === '../images/12.jpg') {
        //              images[i].src = images[i].getAttribute('data-src');
        //         }
        //         n = n + 1;
        //          }
        //     }
        //     }
        // }
function myBrowser(){
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    var isOpera = userAgent.indexOf("Opera") > -1;
    if (isOpera) {
        return "Opera"
    }; //判断是否Opera浏览器
    if (userAgent.indexOf("Firefox") > -1) {
        return "FF";
    } //判断是否Firefox浏览器
    if (userAgent.indexOf("Chrome") > -1){
  return "Chrome";
 }
    if (userAgent.indexOf("Safari") > -1) {
        return "Safari";
    } //判断是否Safari浏览器
    if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {
        return "IE";
    }; //判断是否IE浏览器
}

//以下是调用上面的函数
var mb = myBrowser();
if ("IE" || "FF" || "Opera" || "Safari" == mb) {
    function throttle(fn, delay, atleast) {
            var timeout = null,
            startTime = new Date();
            return function() {
            var curTime = new Date();
            clearTimeout(timeout);
            if(curTime - startTime >= atleast) {
                fn();
                startTime = curTime;
            }else {
                timeout = setTimeout(fn, delay);
            }
            }
        }
        function lazyload() {
            var images = document.getElementsByTagName('img');
            // var trs = document.getElementById("content").getElementsByTagName("tr");
            var len    = images.length;
            // var len = trs.length;
            var n      = 0;      //存储图片加载到的位置，避免每次都从第一张图片开始遍历       
            return function() {
            var seeHeight = document.documentElement.clientHeight;
            var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
            for(var i = n; i < len; i++) {
                if(images[i].offsetTop < seeHeight + scrollTop) {
                    if(images[i].getAttribute('src') === '../images/12.jpg') {
                     images[i].src = images[i].getAttribute('data-src');
                    }
                    n = n + 1;
                 }
            }
            }
        }
    var loadImages = lazyload();
    loadImages();          //初始化首页的页面图片
    //window.addEventListener('scroll', loadImages, false);
    window.addEventListener('scroll', throttle(loadImages, 500, 1000), false);
}

if ("Chrome" == mb) {
    function query(selector) {
            return Array.from(document.querySelectorAll(selector));
            //array.form()方法从一个类似数组或可迭代对象创建一个新的数组实例
        }
        var io = new IntersectionObserver(function(items) { //IntersectionObserver判断对象是否进入用户可视区域内
            items.forEach(function(item) {
                //console.log(query('img'));
            var target = item.target;
            if(target.getAttribute('src') == '../images/12.jpg') {
                target.src = target.getAttribute('data-src');
            }
            })
        });
        query('img').forEach(function(item) {
            io.observe(item); //开始观察
        });
}
