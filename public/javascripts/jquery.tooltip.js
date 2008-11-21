/*
 * Image preview script 
 * powered by jQuery (http://www.jquery.com)
 * 
 * written by Alen Grakalic (http://cssglobe.com)
 * 
 * for more info visit http://cssglobe.com/post/1695/easiest-tooltip-and-image-preview-using-jquery
 *
 */
 
this.imagePreview = function(){	
	/* CONFIG */
		
		xOffset = 10;
		yOffset = 30;
		
		// these 2 variable determine popup's distance from the cursor
		// you might want to adjust to get the right result
		
	/* END CONFIG */
	
	x_position=function(pageX){
		x=pageX + xOffset;
		ww=$(window).width()
		tw=$("#preview").width();
		offset_x=ww-pageX;
		if (offset_x < tw) x=x-tw-xOffset*2; 
		return x; 
    	}
	y_position=function(pageY){
		y=pageY - yOffset;
		wh=$(window).height()
		th=$("#preview").height();
		offset_y=wh-pageY;
		if (offset_y < th) y=wh-th;
		if ((wh-pageY)>0) y=pageY;
		return y;
    	}
		
	$("a.preview").hover(function(e){
		this.t = this.title;
		this.title = "";	
		var c = (this.t != "") ? "<br/>" + this.t : "";
		$("body").append("<p id='preview'><img src='"+ this.href +"' alt='Image preview' />"+ c +"</p>");
										 
		$("#preview")
			.css("top",(y_position(e.pageY)) + "px")
			.css("left",(x_position(e.pageX)) + "px")
			.show();
								
    },
	function(){
		this.title = this.t;	
		$("#preview").remove();
    });	
	$("a.preview").mousemove(function(e){
		$("#preview")
			.css("top",(y_position(e.pageY)) + "px")
			.css("left",(x_position(e.pageX)) + "px");
	});			
};


// starting the script on page load
$(document).ready(function(){
	imagePreview();
});