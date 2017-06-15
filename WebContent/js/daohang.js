var lis = document.getElementsByTagName('li');
var l = lis.length;
var el = document.querySelector(".act a");
el.setAttribute('style','color:white');
for(var i=0;i<l;i++){
    (function(i){
        lis[i].addEventListener('mouseover',function(){
        lis[i].setAttribute('class','act');
        });
        lis[i].addEventListener('mouseout',function(){
        lis[i].removeAttribute('class');
    })
    })(i);
}