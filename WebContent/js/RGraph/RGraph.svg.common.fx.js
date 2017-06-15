
RGraph=window.RGraph||{isRGraph:true};RGraph.SVG=RGraph.SVG||{};RGraph.SVG.FX=RGraph.SVG.FX||{};(function(win,doc,undefined)
{var RG=RGraph,ua=navigator.userAgent,ma=Math;RG.SVG.FX.decorate=function(obj)
{for(i in RG.SVG.FX){if(typeof RG.SVG.FX[i]==='function'){obj[i]=RG.SVG.FX[i];}}};RG.SVG.FX.fadein=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,duration=(frames/60)*1000,frame=0,callback=opt.callback||function(){};obj.svg.style.opacity=0;RG.SVG.redraw(this.svg);for(var i=1;i<=frames;++i){(function(index)
{setTimeout(function()
{obj.svg.style.opacity=(index/frames);if(index>=frames){callback(obj);}},(index/frames)*duration);})(i)}
return this;};RG.SVG.FX.fadeout=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,duration=(frames/60)*1000,frame=0,callback=opt.callback||function(){};for(var i=1;i<=frames;++i){(function(index)
{setTimeout(function()
{obj.svg.style.opacity=1-(index/frames);if(index>=frames){callback(obj);}},(index/frames)*duration);})(i)}
return this;};RG.SVG.FX.fadeslidein=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,frame=0,pc=-20,step=(120-pc)/frames,color=opt.color||'white',width=this.container.offsetWidth,height=this.container.offsetHeight,callback=opt.callback||function(){};RG.SVG.redraw(this.svg);$('<div id="rgraph_fadeslide_cover_'+obj.id+'"></div>').css({background:'linear-gradient(135deg, rgba(255,255,255,0) '+pc+'%, '+color+' '+(pc+20)+'%)',width:width+'px',height:height+'px',top:0,left:0,position:'absolute'}).appendTo($(this.container));function iterator()
{if(pc<120){$('div#rgraph_fadeslide_cover_'+obj.id).css({background:'linear-gradient(135deg, rgba(255,255,255,0) '+pc+'%, '+color+' '+(pc+20)+'%)'});pc+=step;RG.SVG.FX.update(iterator);}else{$('div#rgraph_fadeslide_cover_'+obj.id).remove();callback(obj);}}
iterator();return this;};RG.SVG.FX.fadeslideout=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,frame=0,pc=-20,step=(120-pc)/frames,canvasXY=RG.SVG.getSVGXY(obj.svg),color=opt.color||'white',width=this.container.offsetWidth,height=this.container.offsetHeight,callback=opt.callback||function(){};$('<div id="rgraph_fadeslide_cover_'+obj.id+'"></div>').css({background:'linear-gradient(135deg, '+color+' '+pc+'%, rgba(255,255,255,0) '+(pc+20)+'%)',width:width+'px',height:height+'px',top:0,left:0,position:'absolute'}).appendTo($(obj.svg.parentNode));function iterator()
{if(pc<120){$('div#rgraph_fadeslide_cover_'+obj.id).css({background:'linear-gradient(135deg, '+color+' '+pc+'%, rgba(255,255,255,0) '+(pc+20)+'%)'});pc+=step;RG.SVG.FX.update(iterator);}else{RG.SVG.clear(obj.svg);$('div#rgraph_fadeslide_cover_'+obj.id).remove();callback(obj);}}
iterator();return this;};RG.SVG.FX.fadecircularinoutwards=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,frame=1,radius=0,svgXY=RG.SVG.getSVGXY(obj.svg),color=opt.color||'white',callback=opt.callback||function(){};RG.SVG.redraw(this.svg);$('<div id="rgraph_fadecircularinoutwards_cover_'+obj.id+'"></div>').css({background:'radial-gradient(rgba(255,255,255,0) 0%, '+color+' '+radius+'%)',width:this.container.offsetWidth+'px',height:this.container.offsetHeight+'px',top:0,left:0,position:'absolute'}).appendTo($(obj.svg.parentNode));function iterator()
{if(frame<frames){$('div#rgraph_fadecircularinoutwards_cover_'+obj.id).css({background:'radial-gradient(rgba(255,255,255,0) '+((frame++/ frames) * 100) + '%, ' + color + ' ' + ((frame++ /frames)*150)+'%)'});RG.SVG.FX.update(iterator);}else{$('div#rgraph_fadecircularinoutwards_cover_'+obj.id).remove();callback(obj);}}
iterator();return this;};RG.SVG.FX.fadecircularoutoutwards=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,frame=0,width=this.container.offsetWidth,height=this.container.offsetHeight,canvasXY=RG.SVG.getSVGXY(obj.svg),color=opt.color||'white',callback=opt.callback||function(){};$('<div id="rgraph_fadeslide_cover_'+obj.id+'"></div>').css({background:'radial-gradient(rgba(255,255,255,0) 0%, transparent 0%)',width:width+'px',height:height+'px',top:0,left:0,position:'absolute'}).appendTo($(obj.svg.parentNode));function iterator()
{if(frame<frames){$('div#rgraph_fadeslide_cover_'+obj.id).css({background:'radial-gradient('+color+' '+((frame++/ frames) * 100) + '%, rgba(255,255,255,0) ' + ((frame++ /frames)*150)+'%)'});RG.SVG.FX.update(iterator);}else{RG.SVG.clear(obj.svg);$('div#rgraph_fadeslide_cover_'+obj.id).remove();callback(obj);}}
iterator();return this;};RG.SVG.FX.fadecircularininwards=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,frame=0,radius=ma.max(obj.container.offsetWidth,obj.container.offsetHeight),color=opt.color||'white',callback=opt.callback||function(){};RG.SVG.redraw(this.svg);$('<div id="rgraph_fadeslide_cover_'+obj.id+'"></div>').css({background:'radial-gradient(rgba(255,255,255,0) 100%, rgba(255,255,255,0) 0%)',width:this.container.offsetWidth+'px',height:this.container.offsetHeight+'px',top:0,left:0,position:'absolute'}).appendTo($(obj.svg.parentNode));function iterator()
{if(frame<frames){$('div#rgraph_fadeslide_cover_'+obj.id).css({background:'radial-gradient('+color+' '+(((frames-frame++)/frames)*100)+'%, rgba(255,255,255,0) '+(((frames-frame++)/frames)*120)+'%)'});RG.SVG.FX.update(iterator);}else{$('div#rgraph_fadeslide_cover_'+obj.id).remove();callback(obj);}}
iterator();return this;};RG.SVG.FX.fadecircularoutinwards=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,frame=0,radius=ma.max(this.container.offsetWidth,this.container.offsetHeight),color=opt.color||'white',callback=opt.callback||function(){};$('<div id="rgraph_fadeslide_cover_'+this.id+'"></div>').css({background:'radial-gradient(rgba(255,255,255,0) 0%, rgba(255,255,255,0) 0%)',width:this.container.offsetWidth+'px',height:this.container.offsetHeight+'px',top:0,left:0,position:'absolute'}).appendTo($(obj.svg.parentNode));function iterator()
{if(frame<frames){$('div#rgraph_fadeslide_cover_'+obj.id).css({background:'radial-gradient(rgba(255,255,255,0) '+(((frames-frame++)/frames)*100)+'%, '+color+' '+(((frames-frame++)/frames)*120)+'%)'});RG.SVG.FX.update(iterator);}else{RG.SVG.clear(obj.svg);$('div#rgraph_fadeslide_cover_'+obj.id).remove();callback(obj);}}
iterator();return this;};RG.SVG.FX.reveal=function()
{var obj=this,opt=arguments[0]||{}
color=opt.color||'white',frames=opt.frames||90,duration=(frames/60)*1000,callback=opt.callback||function(){}
var divs=[['rgraph_reveal_left_'+this.id,0,0,this.container.offsetWidth/2,this.container.offsetHeight],['rgraph_reveal_right_'+this.id,(this.container.offsetWidth/2),0,(this.container.offsetWidth/2),this.container.offsetHeight],['rgraph_reveal_top_'+this.id,0,0,this.container.offsetWidth,(this.container.offsetHeight/2)],['rgraph_reveal_bottom_'+this.id,0,(this.container.offsetHeight/2),this.container.offsetWidth,(this.container.offsetHeight/2)]];for(var i=0,len=divs.length;i<len;++i){var div=doc.createElement('DIV');div.id=divs[i][0];div.style.left=divs[i][1]+'px';div.style.top=divs[i][2]+'px';div.style.width=divs[i][3]+'px';div.style.height=divs[i][4]+'px';div.style.position='absolute';div.style.backgroundColor=color;this.container.appendChild(div);}
RG.SVG.redraw(obj.svg);jQuery('#rgraph_reveal_left_'+obj.id).animate({width:0},duration);jQuery('#rgraph_reveal_right_'+obj.id).animate({left:'+='+(this.container.offsetWidth/2),width:0},duration);jQuery('#rgraph_reveal_top_'+obj.id).animate({height:0},duration);jQuery('#rgraph_reveal_bottom_'+obj.id).animate({top:'+='+(this.container.offsetHeight/2),height:0},duration);setTimeout(function()
{obj.container.removeChild(doc.getElementById("rgraph_reveal_top_"+obj.id));obj.container.removeChild(doc.getElementById("rgraph_reveal_bottom_"+obj.id));obj.container.removeChild(doc.getElementById("rgraph_reveal_left_"+obj.id));obj.container.removeChild(doc.getElementById("rgraph_reveal_right_"+obj.id));callback(obj);},duration);return this;};RG.SVG.FX.conceal=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,callback=opt.callback||function(){},color=opt.color||'white',duration=(frames/60)*1000,frame=0;var divs=[['rgraph_conceal_left_'+obj.id,0,0,0,this.container.offsetHeight],['rgraph_conceal_right_'+obj.id,this.container.offsetWidth,0,0,this.container.offsetHeight],['rgraph_conceal_top_'+obj.id,0,0,this.container.offsetWidth,0],['rgraph_conceal_bottom_'+obj.id,0,this.container.offsetHeight,this.container.offsetWidth,0]];for(var i=0,len=divs.length;i<len;++i){var div=doc.createElement('DIV');div.id=divs[i][0];div.style.left=divs[i][1]+'px';div.style.top=divs[i][2]+'px';div.style.width=divs[i][3]+'px';div.style.height=divs[i][4]+'px';div.style.position='absolute';div.style.backgroundColor=color;this.container.appendChild(div);}
jQuery('#rgraph_conceal_left_'+obj.id).animate({width:'+='+(this.container.offsetWidth/2)},duration);jQuery('#rgraph_conceal_right_'+obj.id).animate({left:'-='+(this.container.offsetWidth/2),width:(this.container.offsetWidth/2)},duration);jQuery('#rgraph_conceal_top_'+obj.id).animate({height:'+='+(this.container.offsetHeight/2)},duration);jQuery('#rgraph_conceal_bottom_'+obj.id).animate({top:'-='+(this.container.offsetHeight/2),height:(this.container.offsetHeight/2)},duration);setTimeout(function()
{obj.container.removeChild(doc.getElementById("rgraph_conceal_top_"+obj.id));obj.container.removeChild(doc.getElementById("rgraph_conceal_bottom_"+obj.id));obj.container.removeChild(doc.getElementById("rgraph_conceal_left_"+obj.id));obj.container.removeChild(doc.getElementById("rgraph_conceal_right_"+obj.id));RG.SVG.clear(obj.svg);callback(obj);},duration);return this;};RG.SVG.FX.hblindsopen=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,duration=(frames/60)*1000,frame=0,callback=opt.callback||function(){},color=opt.color||'white',height=this.container.offsetHeight/5;RG.SVG.redraw(this.svg);for(var i=0;i<5;++i){var div=doc.createElement('DIV');div.id='rgraph_hblinds_'+i+'_'+obj.id;div.style.left=0;div.style.top=((this.container.offsetHeight*(i/5)))+'px';div.style.width=this.container.offsetWidth+'px';div.style.height=(this.container.offsetHeight/5)+'px';div.style.position='absolute';div.style.backgroundColor=color;this.container.appendChild(div);jQuery('#rgraph_hblinds_'+i+'_'+obj.id).animate({height:0},duration);}
setTimeout(function(){this.container.removeChild(doc.getElementById('rgraph_hblinds_0_'+obj.id));},duration);setTimeout(function(){this.container.removeChild(doc.getElementById('rgraph_hblinds_1_'+obj.id));},duration);setTimeout(function(){this.container.removeChild(doc.getElementById('rgraph_hblinds_2_'+obj.id));},duration);setTimeout(function(){this.container.removeChild(doc.getElementById('rgraph_hblinds_3_'+obj.id));},duration);setTimeout(function(){this.container.removeChild(doc.getElementById('rgraph_hblinds_4_'+obj.id));},duration);setTimeout(function(){callback(obj);},duration);return this;};RG.SVG.FX.hblindsclose=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,duration=(frames/60)*1000,frame=0,callback=opt.callback||function(){},color=opt.color='white',height=this.container.offsetHeight/5;for(var i=0;i<5;++i){var div=doc.createElement('DIV');div.id='rgraph_hblinds_'+i+'_'+obj.id;div.style.left=0;div.style.top=(this.container.offsetHeight*(i/5))+'px';div.style.width=this.container.offsetWidth+'px';div.style.height=0;div.style.position='absolute';div.style.backgroundColor=color;this.container.appendChild(div);jQuery('#rgraph_hblinds_'+i+'_'+obj.id).animate({height:height+'px'},duration);}
setTimeout(function(){RG.SVG.clear(obj.svg);},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_hblinds_0_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_hblinds_1_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_hblinds_2_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_hblinds_3_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_hblinds_4_'+obj.id));},duration+100);setTimeout(function(){callback(obj);},duration+100);};RG.SVG.FX.vblindsopen=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,duration=(frames/60)*1000,frame=0,callback=opt.callback||function(){},color=opt.color||'white',width=this.container.offsetWidth/10;RG.SVG.redraw(obj.svg);for(var i=0;i<10;++i){var div=doc.createElement('DIV');div.id='rgraph_vblinds_'+i+'_'+obj.id;div.style.width=width+'px';div.style.height=this.container.offsetHeight+'px';div.style.left=(this.container.offsetWidth*(i/10))+'px';div.style.top=0;div.style.position='absolute';div.style.backgroundColor=color;this.container.appendChild(div);jQuery('#rgraph_vblinds_'+i+'_'+obj.id).animate({width:0},duration);}
setTimeout(function(){doc.body.removeChild(doc.getElementById('rgraph_vblinds_0_'+obj.id));},duration+100);setTimeout(function(){doc.body.removeChild(doc.getElementById('rgraph_vblinds_1_'+obj.id));},duration+100);setTimeout(function(){doc.body.removeChild(doc.getElementById('rgraph_vblinds_2_'+obj.id));},duration+100);setTimeout(function(){doc.body.removeChild(doc.getElementById('rgraph_vblinds_3_'+obj.id));},duration+100);setTimeout(function(){doc.body.removeChild(doc.getElementById('rgraph_vblinds_4_'+obj.id));},duration+100);setTimeout(function(){doc.body.removeChild(doc.getElementById('rgraph_vblinds_5_'+obj.id));},duration+100);setTimeout(function(){doc.body.removeChild(doc.getElementById('rgraph_vblinds_6_'+obj.id));},duration+100);setTimeout(function(){doc.body.removeChild(doc.getElementById('rgraph_vblinds_7_'+obj.id));},duration+100);setTimeout(function(){doc.body.removeChild(doc.getElementById('rgraph_vblinds_8_'+obj.id));},duration+100);setTimeout(function(){doc.body.removeChild(doc.getElementById('rgraph_vblinds_9_'+obj.id));},duration+100);setTimeout(function(){callback(obj);},duration+100);return this;};RG.SVG.FX.vblindsclose=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,duration=(frames/60)*1000,frame=0,callback=opt.callback||function(){},color=opt.color||'white',width=this.container.offsetWidth/10;for(var i=0;i<10;++i){var div=doc.createElement('DIV');div.id='rgraph_vblinds_'+i+'_'+obj.id;div.style.left=(this.container.offsetWidth*(i/10))+'px';div.style.top=0;div.style.width=0;div.style.height=this.container.offsetHeight+'px';div.style.position='absolute';div.style.backgroundColor=color;this.container.appendChild(div);jQuery('#rgraph_vblinds_'+i+'_'+obj.id).animate({width:width},duration);}
setTimeout(function(){RG.SVG.clear(obj.svg);},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_vblinds_0_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_vblinds_1_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_vblinds_2_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_vblinds_3_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_vblinds_4_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_vblinds_5_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_vblinds_6_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_vblinds_7_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_vblinds_8_'+obj.id));},duration+100);setTimeout(function(){obj.container.removeChild(doc.getElementById('rgraph_vblinds_9_'+obj.id));},duration+100);setTimeout(function(){callback(obj);},duration+100);return this;};RG.SVG.FX.slidein=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,duration=(frames/60)*1000,frame=0,callback=opt.callback||function(){},color=opt.color||'white',width=this.container.offsetWidth/10,from=opt.from||'left';this.container.style.overflow='hidden';RG.SVG.redraw(this.svg);this.svg.style.position='relative';if(from=='left'){this.svg.style.left=(0-this.container.offsetWidth)+'px';this.svg.style.top=0;}else if(from=='top'){this.svg.style.left=0;this.svg.style.top=(0-this.container.offsetHeight)+'px';}else if(from=='bottom'){this.svg.style.left=0;this.svg.style.top=this.container.offsetHeight+'px';}else{this.svg.style.left=this.container.offsetWidth+'px';this.svg.style.top=0;}
jQuery(this.svg).animate({left:0,top:0},duration,function()
{callback(this);});return this;};RG.SVG.FX.slideout=function()
{var opt=arguments[0]||{},frames=opt.frames||90,color=opt.color||'white',to=opt.to||'left',duration=(frames/60)*1000,frame=0,callback=opt.callback||function(){},width=this.container.offetsWidth/10;this.container.style.overflow='hidden';this.svg.style.position='relative';this.svg.style.left=0;this.svg.style.top=0;if(to=='left'){jQuery(this.svg).animate({left:(0-this.container.offsetWidth)+'px'},duration,function(){callback(this);});}else if(to=='top'){jQuery(this.svg).animate({left:0,top:(0-this.container.offsetHeight)+'px'},duration,function(){callback(this);});}else if(to=='bottom'){jQuery(this.svg).animate({top:(0+this.container.offsetHeight)+'px'},duration,function(){callback(this);});}else{jQuery(this.svg).animate({left:(0+this.container.offsetWidth)+'px'},duration,function(){callback(this);});}
return this;};RG.SVG.FX.hscissorsopen=function()
{var opt=arguments[0]||{},obj=this,frames=opt.frames||90,callback=opt.callback||function(){},color=opt.color||'white',to=opt.to||'left',frame=0,duration=(frames/60)*1000,width=this.container.offsetWidth/10,height=this.container.offsetHeight/5;RG.SVG.redraw(this.svg);for(var i=0;i<5;++i){var div=doc.getElementById("rgraph_hscissors_"+i+'_'+this.id)
if(!div){var div=doc.createElement('DIV');div.id='rgraph_hscissors_'+i+'_'+this.id;div.style.width=this.container.offsetWidth+'px';div.style.height=(this.container.offsetHeight/5)+'px';div.style.left=0;div.style.top=(this.container.offsetHeight*(i/5))+'px';div.style.position='absolute';div.style.backgroundColor=color;this.container.appendChild(div);}
if(i%2==0){jQuery('#'+'rgraph_hscissors_'+i+'_'+this.id).animate({left:this.container.offsetWidth+'px',width:0},duration);}else{jQuery('#'+'rgraph_hscissors_'+i+'_'+this.id).animate({width:0},duration);}}
setTimeout(function()
{obj.container.removeChild(doc.getElementById('rgraph_hscissors_0_'+obj.id));obj.container.removeChild(doc.getElementById('rgraph_hscissors_1_'+obj.id));obj.container.removeChild(doc.getElementById('rgraph_hscissors_2_'+obj.id));obj.container.removeChild(doc.getElementById('rgraph_hscissors_3_'+obj.id));obj.container.removeChild(doc.getElementById('rgraph_hscissors_4_'+obj.id));callback(obj);},duration);return this;};RG.SVG.FX.hscissorsclose=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||60,duration=(frames/60)*1000,frame=0,callback=opt.callback||function(){},color=opt.color||'white',height=this.container.offsetHeight/5;for(var i=0;i<5;++i){var div=doc.createElement('DIV');div.id='rgraph_hscissors_'+i+'_'+this.id;div.style.width=0;div.style.height=height+'px';div.style.left=(i%2==0?this.container.offsetWidth:0)+'px';div.style.top=(this.container.offsetHeight*(i/5))+'px';div.style.position='absolute';div.style.backgroundColor=color;this.container.appendChild(div);if(i%2==0){jQuery('#'+'rgraph_hscissors_'+i+'_'+this.id).animate({left:0,width:this.container.offsetWidth+'px'},duration);}else{jQuery('#'+'rgraph_hscissors_'+i+'_'+this.id).animate({width:this.container.offsetWidth+'px'},duration);}}
setTimeout(function()
{RG.SVG.clear(obj.svg);jQuery('#'+'rgraph_hscissors_'+0+'_'+obj.id).remove();jQuery('#'+'rgraph_hscissors_'+1+'_'+obj.id).remove();jQuery('#'+'rgraph_hscissors_'+2+'_'+obj.id).remove();jQuery('#'+'rgraph_hscissors_'+3+'_'+obj.id).remove();jQuery('#'+'rgraph_hscissors_'+4+'_'+obj.id).remove();callback(obj);},duration);return this;};RG.SVG.FX.vscissorsopen=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,duration=(frames/60)*1000,frame=0,callback=opt.callback||function(){},color=opt.color||'white',width=this.container.offsetWidth/10;RG.SVG.redraw(this.svg);for(var i=0;i<10;++i){var div=doc.getElementById("rgraph_vscissors_"+i+'_'+this.id);if(!div){var div=doc.createElement('DIV');div.id='rgraph_vscissors_'+i+'_'+this.id;div.style.width=width+'px';div.style.height=this.container.offsetHeight+'px';div.style.left=this.container.offsetWidth*(i/10)+'px';div.style.top=0;div.style.position='absolute';div.style.backgroundColor=color;this.container.appendChild(div);}
if(i%2==0){jQuery('#'+'rgraph_vscissors_'+i+'_'+this.id).animate({top:this.container.offsetHeight+'px',height:0},duration);}else{jQuery('#'+'rgraph_vscissors_'+i+'_'+this.id).animate({height:0},duration);}}
setTimeout(function()
{this.container.removeChild(doc.getElementById('rgraph_vscissors_0'+'_'+this.id));this.container.removeChild(doc.getElementById('rgraph_vscissors_1'+'_'+this.id));this.container.removeChild(doc.getElementById('rgraph_vscissors_2'+'_'+this.id));this.container.removeChild(doc.getElementById('rgraph_vscissors_3'+'_'+this.id));this.container.removeChild(doc.getElementById('rgraph_vscissors_4'+'_'+this.id));callback(this);},duration);return this;};RG.SVG.FX.vscissorsclose=function()
{var obj=this,opt=arguments[0]||{},frames=opt.frames||90,duration=(frames/60)*1000,frame=0,callback=opt.callback||function(){},color=opt.color||'white',width=this.container.offsetWidth/10;for(var i=0;i<10;++i){var div=doc.getElementById("rgraph_vscissors_"+i+'_'+this.id)
if(!div){var div=doc.createElement('DIV');div.id='rgraph_vscissors_'+i+'_'+this.id;div.style.width=width+'px';div.style.height=0;div.style.left=(width*i)+'px';div.style.top=(i%2==0?this.container.offsetHeight:0)+'px';div.style.position='absolute';div.style.backgroundColor=color;this.container.appendChild(div);}
if(i%2==0){jQuery('#'+'rgraph_vscissors_'+i+'_'+this.id).animate({top:0,height:this.container.offsetHeight+'px'},duration);}else{jQuery('#'+'rgraph_vscissors_'+i+'_'+this.id).animate({height:this.container.offsetHeight+'px'},duration);}}
setTimeout(function()
{RG.SVG.clear(obj.svg);for(var i=0;i<10;i++){jQuery('#rgraph_vscissors_'+i+'_'+obj.id).remove();}
callback(obj);},duration);return this;};})(window,document);