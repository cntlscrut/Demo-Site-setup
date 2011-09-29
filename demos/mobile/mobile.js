// Return boolean TRUE/FALSE
function isiPhone(){
    return (
        (navigator.platform.indexOf("iPhone") != -1) ||
        (navigator.platform.indexOf("iPod") != -1)
    );
}

function loadjscssfile(filename, filetype){
 if (filetype=="js"){ //if filename is a external JavaScript file
  var fileref=document.createElement('script')
  fileref.setAttribute("type","text/javascript")
  fileref.setAttribute("src", filename)
 }
 else if (filetype=="css"){ //if filename is an external CSS file
  var fileref=document.createElement("link")
  fileref.setAttribute("rel", "stylesheet")
  fileref.setAttribute("type", "text/css")
  fileref.setAttribute("href", filename)
 }
 if (typeof fileref!="undefined")
  document.getElementsByTagName("head")[0].appendChild(fileref)
}


$(document).ready(function () {
	if (isiPhone()) {
		loadjscssfile("http://code.jquery.com/mobile/1.0b3/jquery.mobile-1.0b3.min.css", 'css');
		loadjscssfile('http://code.jquery.com/mobile/1.0b3/jquery.mobile-1.0b3.min.js', 'js');
	}
});