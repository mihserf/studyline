var offsetfrommouse=[15,25]; //image x,y offsets from cursor position in pixels. Enter 0,0 for no offset
var displayduration=0; //duration in seconds image should remain visible. 0 for always.

var defaultimageheight = 40;	// maximum image size.
var defaultimagewidth = 40;	// maximum image size.

var timer;

function gettrailobj(){
if (document.getElementById)
return document.getElementById("preview_div").style
}

function gettrailobjnostyle(){
if (document.getElementById)
return document.getElementById("preview_div")
}


function truebody(){
return (!window.opera && document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}


function hidetrail(){	
	gettrailobj().display= "none";
	document.onmousemove=""
	gettrailobj().left="-500px"
	clearTimeout(timer);
}

function showtrail(country_name,large_img_name)
{
	w = 300;
	width = w;
	h = 250;
	height = h;
	t=country_name;
	if(large_img_name=='') {i='empty';t='';w=1;h=1;}
	else i='http://www.premierboatandyachtclub.com.ua/img/boats/large/'+large_img_name;
	timer = setTimeout("show('"+i+"',t,w,h);",10);
}
function show(imagename,title,width,height){
    var docwidth=document.all? truebody().scrollLeft+truebody().clientWidth : pageXOffset+window.innerWidth - offsetfrommouse[0]
	var docheight=document.all? Math.min(truebody().scrollHeight, truebody().clientHeight) : Math.min(window.innerHeight)

	if( (navigator.userAgent.indexOf("Konqueror")==-1  || navigator.userAgent.indexOf("Firefox")!=-1 || (navigator.userAgent.indexOf("Opera")==-1 && navigator.appVersion.indexOf("MSIE")!=-1)) && (docwidth>650 && docheight>500)) 
	{
		( width == 0 ) ? width = defaultimagewidth: '';
		( height == 0 ) ? height = defaultimageheight: '';
		height+=15;
		defaultimageheight = height;
		defaultimagewidth = width;
		document.onmousemove=followmouse; 
		newHTML = '<div width='+width+' height='+height+'>';
		newHTML = newHTML + "<center><h2 style='color:black;margin:0px;padding:0px;padding-top:5px;padding-bottom:5px;'><font size='4'><nobr>" + title+'</nobr></font></h2><center>';
		newHTML = newHTML +"<div>";
		newHTML = newHTML + '<img onload="javascript:remove_loading();" src="' + imagename + '" border="0">';
		newHTML = newHTML + '</div>'; 
		newHTML = newHTML + '</div>'; 
		gettrailobjnostyle().innerHTML = newHTML;
		gettrailobj().display="block";
	}
}

function followmouse(e){

	var xcoord=offsetfrommouse[0]
	var ycoord=offsetfrommouse[1]

	var docwidth=document.all? truebody().scrollLeft+truebody().clientWidth : pageXOffset+window.innerWidth-15
	var docheight=document.all? Math.min(truebody().scrollHeight, truebody().clientHeight) : Math.min(window.innerHeight)

	if (typeof e != "undefined"){
		if (docwidth - e.pageX < defaultimagewidth + 2*offsetfrommouse[0]){
			xcoord = e.pageX - xcoord - defaultimagewidth; // Move to the left side of the cursor
		} else {
			xcoord += e.pageX;
		}
		if (docheight - e.pageY < defaultimageheight + 2*offsetfrommouse[1]){
			ycoord += e.pageY - Math.max(0,(2*offsetfrommouse[1] + defaultimageheight + e.pageY - docheight - truebody().scrollTop));
		} else {
			ycoord += e.pageY;
		}

	} else if (typeof window.event != "undefined"){
		if (docwidth - event.clientX < defaultimagewidth + 2*offsetfrommouse[0]){
			xcoord = event.clientX + truebody().scrollLeft - xcoord - defaultimagewidth; // Move to the left side of the cursor
		} else {
			xcoord += truebody().scrollLeft+event.clientX
		}
		if (docheight - event.clientY < (defaultimageheight + 2*offsetfrommouse[1])){
			ycoord += event.clientY + truebody().scrollTop - Math.max(0,(2*offsetfrommouse[1] + defaultimageheight + event.clientY - docheight));
		} else {
			ycoord += truebody().scrollTop + event.clientY;
		}
	}
	gettrailobj().left=xcoord+"px"
	gettrailobj().top=ycoord+"px"

}// JavaScript Document