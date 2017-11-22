function mail() {
	var mail;
	mail = prompt('Введите e-mail адрес:');
	if (mail) ins(' [mail='+mail+']');
	else alert('Не был введён e-mail адрес.');
	}
function bold() {
	var bold;
	bold = prompt('Введите текст, который будет выделен жирным шрифтом:');
	if (bold) ins(' [b]'+bold+'[/b] ');
	else alert('Не был введён текст.');
	}
function italicize() {
	var italicize;
	italicize = prompt('Введите текст, который будет выделен курсивом:');
	if (italicize) ins(' [i]'+italicize+'[/i] ');
	else alert('Не был введён текст.');
	}
function underline() {
	var underline;
	underline = prompt('Введите текст, который будет подчёркнут:');
	if (underline) ins(' [u]'+underline+'[/u] ');
	else alert('Не был введён текст.');
	}
function http() {
	var http,name;
	http = prompt('Введите http адрес:');
	name = prompt('Введите название ссылки:');
	if (http) {
		if (name) ins(' [http='+http+']'+name+'[/http] ');
		else  ins(' [http='+http+']'+http+'[/http] ');
		}
	else alert('Не был введён http адрес.');
	}
function ftp() {
	var ftp,name;
	ftp = prompt('Введите ftp адрес:');
	name = prompt('Введите название ссылки:');
	if (ftp) {
		if (name) ins(' [ftp='+ftp+']'+name+'[/ftp] ');
		else  ins(' [ftp='+ftp+']'+ftp+'[/ftp] ');
		}
	else alert('Не был введён ftp адрес.');
	}
function  quote() {
	var quote;
	quote = prompt('Введите текст цитаты:');
	if (quote) ins(' [q]'+quote+'[/q] ');
	else alert('Не был введён текст цитаты.');
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