/*
 * --------------------------------------------------------------------
 * jQuery-Plugin "Rolla"
 * (c) Thomas Petrovic 2008
 *
 * http://www.FreaKzero.com
 * http://www.bonsai.co.at
 *
 * Demo & Doc: http://dev.freakzero.com/jquery/rolla
 * Copyright (c) 2008 Thomas Petrovic
 * Licensed under GPL (http://www.opensource.org/licenses/gpl-license.php)
 *
 * Version: 1.2 // Last Edited: 25.03.2008 15:16:15
 * --------------------------------------------------------------------
 */

$.rollaHover = function(settings){
	//overrideable defaults
	settings = jQuery.extend({
		 imgDir: 'images',
		 onFade: 'fast',
		 outFade: 'slow',
		 mainOpacity: "1",
		 css: 'rolla'
	}, settings);
	
// Recognize msie6
   $.browser.msie6 = $.browser.msie && /MSIE 6\.0/i.test(window.navigator.userAgent) && !/MSIE 7\.0/i.test(window.navigator.userAgent);

// Define Short Vars
   var cssClass = settings.css;
   var imgClass = "img."+cssClass;

// Set Image Path and new Array for Text to Image Regocnize
   var arr_a = [];
   var imagepath = settings.imgDir+"/";

// Get all a Elements and set Backgrounds
//--------------------------------------------МИША ЭТО ТЕБЕ-------------------------------------------------------------------
// Миша ошибка  с вероятностью 99% формируется здесь. 
   var arr_a = jQuery.makeArray(document.getElementsByTagName("a")); 
//Если хочешь понять почему я так считаю то: раскомментируй строку № 47 и посмотри в броузере какой отстой генерит JScript (в строке №48) качастве ссылок на файлы.
//удивительно что в фоксе с диска вообще что то работает!!!
//-------------------------------------------------------------------------------------------------------------------------------------

// Set First Image as Background in List Element (no Flickering) and set a to Block Element
   $(arr_a).each(function(k){
//		alert("url("+imagepath+arr_a[k].innerHTML+".jpg)");
      $("."+cssClass+":contains("+arr_a[k].innerHTML+")").css("background-image","url("+imagepath+arr_a[k].innerHTML+".jpg)");
      $("."+cssClass+":contains("+arr_a[k].innerHTML+")").css("background-repeat","no-repeat");
      $("."+cssClass+":contains("+arr_a[k].innerHTML+")").css("display","block");

// get Items from image folder from Linktext
      $("a."+cssClass+":contains("+arr_a[k].innerHTML+")").html("<img src="+imagepath+arr_a[k].innerHTML+".jpg title="+arr_a[k].innerHTML+" alt="+arr_a[k].innerHTML+" class="+cssClass+">");
    });

// Jquery IE6 Hide Bug -> Flickering -> No Animation Block
  if ($.browser.msie6) {
        $(imgClass).hover(
          function(){
          if($(this).attr("src").indexOf("-on#hover") == -1) {
            var newSrc = $(this).attr("src").replace(".jpg","-on.jpg#hover");
            $(this).attr("src",newSrc);
          }
	       }, function(){
            if($(this).attr("src").indexOf("-on.jpg#hover") != -1 ) {
              var oldSrc = $(this).attr("src").replace("-on.jpg#hover",".jpg");
                $(this).attr("src",oldSrc);
            }
        });
  } else {
// All Other Browsers -> with Animation
    $(imgClass).bind("mouseenter",function(){
    var newSrc = $(this).attr("title")+"-on.jpg";
    $(this).attr("src",imagepath+newSrc).css("opacity","0").animate({opacity: settings.mainOpacity},settings.onFade);

    }).bind("mouseleave",function(){
       var oldSrc = $(this).attr("title")+".jpg";
       $(this).animate({opacity: 0},settings.outFade,function(){
       $(this).attr("src",imagepath+oldSrc);
       
// dequeue for flickering debug (when mouse too fast)
     $(imgClass).dequeue();
       });
    });
  }
}