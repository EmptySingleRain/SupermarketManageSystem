/*form表单的name为tianjia,密码name为mm，确认密码name为qrmm,真实姓名name为zsxm,联系方式name为lxfs,邮箱name为yx*/
/*form表单后加上onsubmit="return checkForma();"*/

function checkForma() { 
	   var yhmreg=/^[a-zA-Z0-9_\u4e00-\u9fa5]{5,18}/;//中英文数字，5~18字符
	  // var mmreg=/^[a-z A-Z]\w{6,16}/;//密码必须英文字母开头，总长度不得小于6位
	   var mmreg=/^[0-9a-zA-Z_]{6,16}/;//密码总长度不得小于6位,高于16位
	   var dhreg=/(^\d{11}$)/;//手机号为11位
	   var xmreg=/^[\u4e00-\u9fa5]{2,4}/;//姓名应该是2-4位中文
	   //var idreg=/(^\d{15}$)|(^\d{17}(\d|X)$)/;//身份证号
	   var emailreg=/(^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$)/;//邮箱
	   
	      if(!yhmreg.test(document.tianjia.yhm.value)){
	    	  alert("用户名输入不合要求!不能有空格等非法字符！");
	          document.tianjia.yhm.focus();
	    	  return false;
	      }
	      else if(!mmreg.test(document.tianjia.mm.value)){
	        alert("密码输入不合要求,6~16位的数字 字母 下划线！");
	        document.tianjia.mm.focus();
	        return false;
	      }
	      else if(document.tianjia.qrmm.value!=document.tianjia.mm.value){            
            alert("两次密码输入不一致!");
            document.tianjia.qrmm.focus();
            return false;
         } 
         /* 
            else if(!idreg.test(document.tianjia.sfzh.value)){
            document.tianjia.sfzh.focus();
            alert("身份证号码为15位或者18位，<br>15(数字)，18(前17位为数字，最后一位是校验位，可能为数字或字符X)");
            return false;
          } */
            else if(!xmreg.test(document.tianjia.zsxm.value)){
            document.tianjia.zsxm.focus();
            alert("姓名应该是2到4位的中文，如果您没有中文名，请告知管理员");
            return false;
          }

           else if(!(dhreg.test(document.tianjia.lxfs.value))){
            document.tianjia.lxfs.focus();
            alert("联系方式应该是11位的手机号码");
            return false;
          } 
	      
          else if(!(emailreg.test(document.tianjia.yx.value))){
          document.tianjia.yx.focus();
          alert("Email邮箱格式错误，请输入正确的邮箱")
          return false;
          }
	      
      else
    if (!confirm("请再次确认性别和组别的信息，确认要添加？")) {
		window.event.returnValue = false;
	}
	      document.tianjia.submit;
    }
