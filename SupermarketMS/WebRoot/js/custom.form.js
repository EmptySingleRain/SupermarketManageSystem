/*表单信息验证*/
$(function() {
		/*顾客登录信息验证*/	
		$(".customer_login_error").Validform({
			tiptype : function(msg, o, cssctl) {
				var objtip = $(".customer_error_box");
				cssctl(objtip, o.type);
				objtip.text(msg);
			},

		});
		/*员工登录信息验证*/
		$(".staff_login_error").Validform({
			tiptype : function(msg, o, cssctl) {
				var objtip = $(".staff_error_box");
				cssctl(objtip, o.type);
				objtip.text(msg);
			},

		});
		/*管理员登录信息验证*/
		$(".admin_login_error").Validform({
			tiptype : function(msg, o, cssctl) {
				var objtip = $(".admin_error_box");
				cssctl(objtip, o.type);
				objtip.text(msg);
			},
		});
	});