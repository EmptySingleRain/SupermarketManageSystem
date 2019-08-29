/*form表单的name为xiugai,密码name为mm，确认密码name为qrmm,真实姓名name为zsxm,联系方式name为lxfs,邮箱name为yx*/

function checkForma() { 


	   var mmreg=/^[0-9a-zA-Z_]{6,16}/;//密码总长度不得小于6位,高于16位

	   
	   if(!mmreg.test(document.xiugai.mm.value)){
	        alert("密码输入不合要求,6~16位的数字 字母 下划线！");
	        document.xiugai.mm.focus();
	        return false;
	      }
	      else if(document.xiugai.qrmm.value!=document.xiugai.mm.value){            
            alert("两次密码输入不一致!");
            document.xiugai.qrmm.focus();
            return false;
         } 
	      
      else
    if (!confirm("确认要修改？")) {
		window.event.returnValue = false;
	}
	      document.xiugai.submit;
    }
