mousepop = function(poptype, data, pt) {
  var div = $('<div class=mousepop id=' + poptype + '>'+data+'</div>');
  div.bind('mouseleave', function() { $(this).remove(); });
  switch (poptype) {
    case 'abbr-popup': {
      div.html(data);
      $('body').prepend(div);
      myl = pt.x-20;
      myt = pt.y-20;
      div.css( { left: myl+'px', top: myt+'px' } ).show();
      return div;
    } break;
    case 'cats-navigator': {
      div.html(data);
      $('body').prepend(div);
      myt = pt.y-20;
      div.css( { left: 'auto', right: '8px', top: myt+'px' } ).show();
      return div;
    } break;
    default: {
      div.html(data);
      $('body').prepend(div);
      myt = pt.y-20;
      div.css( { left: 'auto', right: 0, top: myt+'px' } ).show();
      return div;
    } break;
  }
}
$(function() { //on DOM ready
  $('abbr').click(function() { window.location.href = "/profile.php?mode=viewprofile&u="+this.innerHTML; });
/*  $('abbr').bind('mouseleave', function() {
    $(this).unbind('mousemove');
    if (window['abbr_popup_timeout']) clearTimeout(window['abbr_popup_timeout']);
  });
  $('abbr').mouseover(function(event) {
    abbrname=this.innerHTML;
    pgX = event.pageX; pgY = event.pageY;
    $(this).mousemove(function(event) {
      pgX = event.pageX; pgY = event.pageY;
    });
    if (window['abbr_popup_timeout']) clearTimeout(window['abbr_popup_timeout']);
    window['abbr_popup_timeout'] = setTimeout(function() {
      var pop = mousepop('abbr-popup', '<a href="/profile.php?mode=viewprofile&u='+abbrname+'"><img src="/images/spinner.gif" /></a>', { x: pgX, y: pgY });
      $.post('/aja.php', { command: 'abbr-popup', name: abbrname }, function(data) {
        pop.html(data);
      });
    }, 1000);
  });*/
});


function gen_passkey_alert(user_id, sid)
{
  var truthBeTold = window.confirm("После изменения пасскея вам будет необходимо заново скачать все активные торренты!");
  if (truthBeTold) {
  location.href='/torrent.php?mode=gen_passkey&u='+user_id+'&sid='+sid;
  }  else  window.alert("Спасибо");
}
