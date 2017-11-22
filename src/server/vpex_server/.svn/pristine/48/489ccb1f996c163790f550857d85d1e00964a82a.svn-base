function chbg(obj,color) {
	obj.style.backgroundColor=color;
	}
function show(id,X,Y) {
    var div = document.getElementById('serv'+id)
    var map = document.getElementById('map')
    var pos = getAbsolutePos(map)
    div.style.visibility = 'visible'
    div.style.left = X + pos.x + 8
    div.style.top = Y + pos.y + 8
    }
function hide(id) {
    var div = document.getElementById('serv'+id);
    div.alt = 0;
    div.style.visibility = 'hidden';
    }
function getAbsolutePos(el) {
    var r = { x: el.offsetLeft, y: el.offsetTop };
    if (el.offsetParent) {
	var tmp = getAbsolutePos(el.offsetParent);
	r.x += tmp.x;
	r.y += tmp.y;
	}
    return r;
    }