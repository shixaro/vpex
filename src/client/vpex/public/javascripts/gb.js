function mail() {
	var mail;
	mail = prompt('������� e-mail �����:');
	if (mail) ins(' [mail='+mail+']');
	else alert('�� ��� ����� e-mail �����.');
	}
function bold() {
	var bold;
	bold = prompt('������� �����, ������� ����� ������� ������ �������:');
	if (bold) ins(' [b]'+bold+'[/b] ');
	else alert('�� ��� ����� �����.');
	}
function italicize() {
	var italicize;
	italicize = prompt('������� �����, ������� ����� ������� ��������:');
	if (italicize) ins(' [i]'+italicize+'[/i] ');
	else alert('�� ��� ����� �����.');
	}
function underline() {
	var underline;
	underline = prompt('������� �����, ������� ����� ����������:');
	if (underline) ins(' [u]'+underline+'[/u] ');
	else alert('�� ��� ����� �����.');
	}
function http() {
	var http,name;
	http = prompt('������� http �����:');
	name = prompt('������� �������� ������:');
	if (http) {
		if (name) ins(' [http='+http+']'+name+'[/http] ');
		else  ins(' [http='+http+']'+http+'[/http] ');
		}
	else alert('�� ��� ����� http �����.');
	}
function ftp() {
	var ftp,name;
	ftp = prompt('������� ftp �����:');
	name = prompt('������� �������� ������:');
	if (ftp) {
		if (name) ins(' [ftp='+ftp+']'+name+'[/ftp] ');
		else  ins(' [ftp='+ftp+']'+ftp+'[/ftp] ');
		}
	else alert('�� ��� ����� ftp �����.');
	}
function  quote() {
	var quote;
	quote = prompt('������� ����� ������:');
	if (quote) ins(' [q]'+quote+'[/q] ');
	else alert('�� ��� ����� ����� ������.');
	}
function ins(str) {
	var obj;
	obj = document.getElementById('text');
	obj.focus();
	obj.value = obj.value + str;	
	}
function text_clear() {
	var obj;
	obj = document.getElementById('text');
	obj.focus();
	obj.value = ' ';	
	}
function change_bgc(button,color) {button.style.backgroundColor=color;}