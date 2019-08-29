/*form表单的name为xiugai,密码name为mm，确认密码name为qrmm,真实姓名name为zsxm,联系方式name为lxfs,邮箱name为yx*/

function checkForma() { 
	   var yhmreg=/^[a-zA-Z0-9_\u4e00-\u9fa5]{5,18}/;//中英文数字，5~18字符
	  // var mmreg=/^[a-z A-Z]\w{6,16}/;//密码必须英文字母开头，总长度不得小于6位
	   var mmreg=/^[0-9a-zA-Z_]{6,16}/;//密码总长度不得小于6位,高于16位
	   var dhreg=/(^\d{11}$)/;//手机号为11位
	   var xmreg=/^[\u4e00-\u9fa5]{2,4}/;//姓名应该是2-4位中文
	   //var idreg=/(^\d{15}$)|(^\d{17}(\d|X)$)/;//身份证号
	   var emailreg=/(^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$)/;//邮箱
	   
	      if(!yhmreg.test(document.xiugai.yhm.value)){
	    	  alert("用户名输入不合要求!不能有空格等非法字符！");
	          document.xiugai.yhm.focus();
	    	  return false;
	      }
	      else if(!mmreg.test(document.xiugai.mm.value)){
	        alert("密码输入不合要求,6~16位的数字 字母 下划线！");
	        document.xiugai.mm.focus();
	        return false;
	      }
	      else if(document.xiugai.qrmm.value!=document.xiugai.mm.value){            
            alert("两次密码输入不一致!");
            document.xiugai.qrmm.focus();
            return false;
         } 
         /* 
            else if(!idreg.test(document.xiugai.sfzh.value)){
            document.xiugai.sfzh.focus();
            alert("身份证号码为15位或者18位，<br>15(数字)，18(前17位为数字，最后一位是校验位，可能为数字或字符X)");
            return false;
          } */
            else if(!xmreg.test(document.xiugai.zsxm.value)){
            document.xiugai.zsxm.focus();
            alert("姓名应该是2到4位的中文，如果您没有中文名，请告知管理员");
            return false;
          }

           else if(!(dhreg.test(document.xiugai.lxfs.value))){
            document.xiugai.lxfs.focus();
            alert("联系方式应该是11位的手机号码");
            return false;
          } 
	      
          else if(!(emailreg.test(document.xiugai.yx.value))){
          document.xiugai.yx.focus();
          alert("Email邮箱格式错误，请输入正确的邮箱")
          return false;
          }
	      
      else
    if (!confirm("确认要修改？")) {
		window.event.returnValue = false;
	}
	      document.xiugai.submit;
    }
