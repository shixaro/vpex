function srch_fld_up()
{
    var search_field = document.getElementById('search_field');

    if (search_field.value == 'Поиск...') {
        search_field.value = '';
    }
}

function srch_act_up()
{
    var search_field  = document.getElementById('search_field');
    var search_action = document.getElementById('search_action');

    if (search_action.value == 'search.php') {
        search_field.name = 'search_keywords';
    } else {
        search_field.name = 'nm';
    }
}

function change_visible_ips(value)
{
    if (value == 1) {
        for (i = 1; i <= 5; i++) {
            tr_id = 'ip_' + i + '_tr';
            document.getElementById(tr_id).style.display = 'table-row';
        }
    } else {
        for (i = 1; i <= 5; i++) {
            tr_id = 'ip_' + i + '_tr';
            document.getElementById(tr_id).style.display = 'none';
        }
    }
}

function change_visible_flds(value)
{
   switch(value) {
        case 'skill_yes':
                document.getElementById('skill_links').style.display = 'inline';
                document.getElementById('skill_links').style.display = 'table-row';
            break;
        case 'skill_no':
                document.getElementById('skill_links').style.display = 'none';
            break;
        case 'conflict_yes':
                document.getElementById('conflict_with').style.display = 'inline';
                document.getElementById('conflict_with').style.display = 'table-row';
            break;
        case 'conflict_no':
                document.getElementById('conflict_with').style.display = 'none';
            break;
        default:
                document.getElementById('skill_links').style.display = 'none';
                document.getElementById('conflict_with').style.display = 'none';
   }
}

// проверка формы запроса на модеринг
function check_mod_req_form()
{
    error_message = '';
    error = false;

    if (document.mod_req_form.forums.value == '') {
        error_message += 'Вы не ввели форумы!\n';
        error = true;
    }

    if (error == true) {
        alert(error_message);
    } else {
        document.mod_req_form.submit();
    }
}

// выделение текста
function highlight_txt(id)
{
    var field = document.getElementById(id);
    field.focus();
    field.select();
}

//<!--ujifgc async requests (simplified ajax)
function async_go(obj, callback) {
    var url = obj.href || obj.toString();
    var reqTimeout, save, par = obj.parentNode;
    var req = window.ActiveXObject ? new ActiveXObject("Microsoft.XMLHTTP") : new XMLHttpRequest();
    if (req) {
        req.open("POST", url, true);
        req.onreadystatechange = function() {
            if (req.readyState == 4) {
                clearTimeout(reqTimeout);
                if (par) par.style['display']=save;
                if (callback) callback(req.responseText);
            }
        }
        try {
          req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
          req.setRequestHeader("X-Requested-With", "XMLHttpRequest");
          req.setRequestHeader("Accept", "*/*");
        } catch(e) {}
        req.send("aja=1");
        if (par) { save = par.style['display']; par.style['display']='none'; }
        reqTimeout = setTimeout(function() {
          if (par) par.style['display']=save;
          req.abort();
        }, 7000);
    }
}
function karma(obj) {
  async_go(obj, function(data) { obj.parentNode.getElementsByTagName('span')[0].innerHTML = data; } );
  return false;
}
function vote(o, v) {
  var objs = document.getElementsByName('dl_set_sankju');
  var thlist, thave;
  
  for (i=0; i<objs.length; i++) objs[i].disabled=true;
  async_go(o.parentNode.action+'&mode=thanks&value='+v, function(data) {
	thlist = data.split(";")[0];
	thave = data.split(";")[1];
    document.getElementById('thankers_list').innerHTML = thlist;
	document.getElementById('thankers_data').innerHTML = thave;
  });
}
function toggle(eve, obj, type) {
  if (!type) type = 'block';
  state = obj['save_state'] = obj.style['display'];
  if (state == 'none') obj.style['display'] = type;
  else obj.style['display'] = 'none';
  //window.event.cancelBubble = true;
  eve.cancelBubble = true;
  return false;
}
//    ujifgc -->


function popup(what) {
    if (what.style.position != 'relative') {
        what.style.display = 'block';
        what.title='закрепить';
    }
}

function popdown(what) {
    if (what.style.position != 'relative') {
        what.style.display = 'none';
    }
}

function popup_toggle(what) {
    if (what.style.position != 'relative') {//popuped
        what.style.position = 'relative';
        what.style.dispay = '';
        what.title='скрыть';
    }
    else {//spoiled
        what.style.dispay = 'none';
        what.style.position = 'absolute';
        popdown(what);
    }
}
