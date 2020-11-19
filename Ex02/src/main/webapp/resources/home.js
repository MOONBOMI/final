$(frm).submit(function(e){
		e.preventDefault();
		if($(frm.name).val()=="") {
			alert("이름 입력!!!!");
			$(frm.name).focus();
		} else if(frm.tel.value=="") {
			alert("전화번호 입력!!!!!!!!!");
			$(frm.tel).focus();
		} else if(frm.addr.value=="") {
			alert("주소 입력!!!!!!!!!!!!!");
			$(frm.addr).focus();
		} else{
			if(!confirm("저장하실?????")) return;
			frm.submit();
		}
	})