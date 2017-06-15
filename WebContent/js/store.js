var spans = document.getElementsByTagName('span');
for(var i=0;i<spans.length;i++){
    (function(i){
        spans[i].addEventListener('mouseenter',function(){
            spans[i].style.backgroundColor='#ACACAC';
        });
        spans[i].addEventListener('mouseleave',function(){
            spans[i].style.backgroundColor='#7F7F7F';
        });
    })(i)
}