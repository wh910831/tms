<!DOCTYPE html>
<html lang="en" class="login_page">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login Page</title>
    
        <!-- Bootstrap framework -->
		<link rel="stylesheet" href="/css/bootstrap.min.css"  />
		<link rel="stylesheet" href="/css/bootstrap-responsive.min.css"  />
        <!-- theme color-->
		<link rel="stylesheet" href="/css/blue.css"  />
        <!-- tooltip -->    
		<link rel="stylesheet" href="/css/jquery.qtip.min.css"  />
        <!-- main styles -->
		<link rel="stylesheet" href="/css/style.css"  />
        <!-- favicon -->
		<!-- <link rel="shortcut icon" href="favicon.ico" /> -->
		
        <script type="text/javascript" src="/js/jquery.min.js" ></script>
        <script type="text/javascript" src="/js/jquery.actual.min.js" ></script>
        <script type="text/javascript" src="/js/jquery.validate.js" ></script>
		<script type="text/javascript" src="/js/bootstrap.min.js" ></script>
		<script type="text/javascript" src="/js/common.js" ></script>
    
    </head>
    <body>
		<div class="login_box">
			
			<form action="/login.do" method="post" id="login_form">
				<div class="top_b">请登录</div>    
				<div class="alert alert-info alert-login">
					<span>Tourism Management System</span>
				</div>
				<div class="cnt_b">
					<div class="formRow">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span><input type="text" id="username" name="username" placeholder="Username" />
						</div>
					</div>
					<div class="formRow">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-lock"></i></span><input type="password" id="password" name="password" placeholder="Password" />
						</div>
					</div>
					<div class="formRow clearfix">
						<span class="linkform">&nbsp;&nbsp;<a href="#pass_form">忘记密码?</a></span>
						<!-- <label class="checkbox"><input type="checkbox" /> Remember me</label> -->
					</div>
				</div>
				<div class="btm_b clearfix">
					<button class="btn btn-inverse pull-right" id="login" type="submit">登录</button>
					<span class="link_reg"><a href="#reg_form">注册</a></span>
				</div>  
			</form>
			
			<form action="" method="post" id="pass_form" style="display:none">
				<div class="top_b">找回密码</div>    
					<div class="alert alert-info alert-login">
					请前往邮箱验证
				</div>
				<div class="cnt_b">
					<div class="formRow clearfix">
						<div class="input-prepend">
							<span class="add-on">@</span><input type="text" placeholder="Your email address" />
						</div>
					</div>
				</div>
				<div class="btm_b tac">
					<button class="btn btn-inverse" type="submit">发送验证信息</button>
				</div>  
			</form>
			
			<form action="" method="post" id="reg_form" style="display:none">
				<div class="top_b">用户注册</div>
				<div class="alert alert-login">
					点击阅读 <a data-toggle="modal" href="#terms">条款协议</a>
				</div>
				<div id="terms" class="modal hide fade" style="display:none">
					<div class="modal-header">
						<a class="close" data-dismiss="modal">x</a>
						<h3>条款协议</h3>
					</div>
					<div class="modal-body">
						<p>
							我是协议
						</p>
					</div>
					<div class="modal-footer">
						<a data-dismiss="modal" class="btn" href="#">Close</a>
					</div>
				</div>
				<div class="cnt_b">
					
					<div class="formRow">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-user"></i></span><input type="text" placeholder="Username" />
						</div>
					</div>
					<div class="formRow">
						<div class="input-prepend">
							<span class="add-on"><i class="icon-lock"></i></span><input type="text" placeholder="Password" />
						</div>
					</div>
					<div class="formRow">
						<div class="input-prepend">
							<span class="add-on">@</span><input type="text" placeholder="Your email address" />
						</div>
						<small>邮箱用于找回密码</small>
					</div>
					 
				</div>
				<div class="btm_b tac">
					<button class="btn btn-inverse" type="submit">注册</button>
				</div>  
			</form>
			
			<div class="links_b links_btm clearfix">
				<!-- <span class="linkform"><a href="#pass_form">å¿è®°å¯ç ?</a></span> -->
				<span class="linkform" style="display:none"><a href="#login_form">返回登录界面</a></span>
			</div>
			
		</div>
		 
        <script type="text/javascript">
            $(document).ready(function(){
                
				//* boxes animation
				form_wrapper = $('.login_box');
				function boxHeight() {
					form_wrapper.animate({ marginTop : ( - ( form_wrapper.height() / 2) - 24) },400);	
				};
				form_wrapper.css({ marginTop : ( - ( form_wrapper.height() / 2) - 24) });
                $('.linkform a,.link_reg a').on('click',function(e){
					var target	= $(this).attr('href'),
						target_height = $(target).actual('height');
					$(form_wrapper).css({
						'height' : form_wrapper.height()
					});	
					$(form_wrapper.find('form:visible')).fadeOut(400,function(){
						form_wrapper.stop().animate({
                            height	 : target_height,
							marginTop: ( - (target_height/2) - 24)
                        },500,function(){
                            $(target).fadeIn(400);
                            $('.links_btm .linkform').toggle();
							$(form_wrapper).css({
								'height' : ''
							});	
                        });
					});
					e.preventDefault();
				});
				
				//* validation
				$('#login_form').validate({
					onkeyup: false,
					errorClass: 'error',
					validClass: 'valid',
					rules: {
						username: { required: true, minlength: 1 },
						password: { required: true, minlength: 1 }
					},
					highlight: function(element) {
						$(element).closest('div').addClass("f_error");
						setTimeout(function() {
							boxHeight()
						}, 200)
					},
					unhighlight: function(element) {
						$(element).closest('div').removeClass("f_error");
						setTimeout(function() {
							boxHeight()
						}, 200)
					},
					errorPlacement: function(error, element) {
						$(element).closest('div').append(error);
					}/* ,
					submitHandler: function(form){
						$.ajax({
							type		: 'post',
							url			: '/user/login.do',
							dataType	: 'json',      
				            contentType	: 'application/json',  
				            data		: JSON.stringify($('#login_form').serializeObject()),
				            success 	: function(data){
				            	if(data.success == true){
				            		
				            	}else{
				            		
				            	}
				            },
				            error 		: function(xhr, status, error) {
				            	 
				            }
						});
					} */
				});
				
            });
            
        </script>
			
    </body>
</html>
