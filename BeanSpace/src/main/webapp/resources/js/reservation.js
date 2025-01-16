var basefee;
var basetime;
var utime;
var addfee;
var address;
var name;
var notContain = /[~@#$%";',&*()+|</>=>`?:{[}]/g;

 $(function () {
 basefee=sessionStorage.getItem("basefee");
 basefee = Number(basefee);
 basetime=Number(sessionStorage.getItem("basetime"));
 utime=Number(sessionStorage.getItem("utime"));
 addfee=Number(sessionStorage.getItem("addfee"));
 address = sessionStorage.getItem("address");
 name = sessionStorage.getItem("name");
    
   	dummy = 5;
      let ptime = document.getElementById('parking-time');
      let etime = document.getElementById('exit-time');
    let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -8);
   	ptime.value = date;
   	etime.value = date
 	  ptime.setAttribute("min", date);
	 etime.setAttribute("min", date);

	$("#haddress").val(address); 

//	$("#hfee").val(basefee + ((utime * 5 - basetime) * addfee));
	//$("#hmileage").val((basefee + (utime * 5 - basetime) * addfee)*0.02);

	$("#hname").val(name);
	$("#rsvnum").val(dummy);
/*
 	$("#hemail").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(notContain)) {
        
                   x = x.replace(notContain, "");
                }
                $(this).val(x);
            }
        }).on("keyup", function() {
        
            $(this).val($(this).val().replace(notContain, ""));

        });
*/	
$("#hemail").change(function() {
    const inputElement = document.getElementById('hemail');
    let value = inputElement.value; 
    console.log(value);

    // 허용되지 않은 문자 정규식
    const regExp = /[^0-9a-zA-Z!._^]/g; 

    if (regExp.test(value)) {
        alert("예약 번호는 영어, 숫자, 특수문자 !, ., _, ^만 입력 가능합니다.");

        // 허용되지 않은 문자 제거
        value = value.replace(regExp, '');

        // 입력 필드 값 업데이트
        inputElement.value = value;
    }
});

 });
 

 

function checkReg() {
 const value = document.getElementById('hemail').value; 
    console.log(value);
    const regExp = /[^0-9a-zA-Z!._^]/g; // 숫자와 영문자만 허용

 if(regExp.test(value)) {
        alert("예약 번호는 영어, 숫자, 특수문자 !, ., _,^만 입력 가능합니다.");
    } 

/*
 	$("#hemail").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(notContain)) {
        
                   x = x.replace(notContain, "");
                }
                $(this).val(x);
            }
        }).on("keyup", function() {
        
            $(this).val($(this).val().replace(notContain, ""));

        });

    const value = document.getElementById('hemail').value; 
    console.log(value);
    const regExp = /[^0-9a-zA-Z!._^]/g; // 숫자와 영문자만 허용
    if(regExp.test(value)) {
        alert("영어와 숫자만 입력 가능합니다.");
        return false;
    } else {
        alert("통과");
        return true;
    }
    */
}; 
 
function setFee(total){
var mileageVal = 0;
$("#feeText").text("결제 금액: " + total+ "원");

 $("#hfee").val(total);
  console.log($("#hemail").val());
 if($("#hemail").val()!=null &&  $("hemail").val()!=""){
 mileageVal = total*0.02;
  $("#mileageText").text("+"+  mileageVal + "p");
	$("#hmileage").val( mileageVal );
	}
  console.log(mileageVal);
 }

 
function setMinValue(){
count = 0;
     let ptime = document.getElementById('parking-time');
     let etime = document.getElementById('exit-time');

     if(etime.value<ptime.value){
     alert("주차 시간보다 이전으로 지정할 수 없습니다.")
         let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -8);
        	ptime.value = date;
        	etime.value = date;

     }
        count = (etime.valueAsNumber-ptime.valueAsNumber)/60000-basetime;
       if(count<0)count=0;	
      var total =basefee + (count/utime) * addfee;
       setFee(total);      	
}
