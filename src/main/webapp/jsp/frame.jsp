<!DOCTYPE html>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ include file="/jsp/header.jsp" %>
<html>
    <head>
        <title>Tourism Management System </title>
        <script type="text/javascript" src="/js/frame.js" ></script>
    </head>
    <body>
        <div id="loading_layer" style="display:none"><img src="img/ajax_loader.gif"  alt="" /></div>
		<div class="style_switcher">
			<div class="sepH_c">
				<p>Colors:</p>
				<div class="clearfix">
					<a href="javascript:void(0)" class="style_item jQclr blue_theme style_active" title="blue">blue</a>
					<a href="javascript:void(0)" class="style_item jQclr dark_theme" title="dark">dark</a>
					<a href="javascript:void(0)" class="style_item jQclr green_theme" title="green">green</a>
					<a href="javascript:void(0)" class="style_item jQclr brown_theme" title="brown">brown</a>
					<a href="javascript:void(0)" class="style_item jQclr eastern_blue_theme" title="eastern_blue">eastern blue</a>
					<a href="javascript:void(0)" class="style_item jQclr tamarillo_theme" title="tamarillo">tamarillo</a>
				</div>
			</div>
			<div class="sepH_c">
				<p>Backgrounds:</p>
				<div class="clearfix">
					<span class="style_item jQptrn style_active ptrn_def" title=""></span>
					<span class="ssw_ptrn_a style_item jQptrn" title="ptrn_a"></span>
					<span class="ssw_ptrn_b style_item jQptrn" title="ptrn_b"></span>
					<span class="ssw_ptrn_c style_item jQptrn" title="ptrn_c"></span>
					<span class="ssw_ptrn_d style_item jQptrn" title="ptrn_d"></span>
					<span class="ssw_ptrn_e style_item jQptrn" title="ptrn_e"></span>
				</div>
			</div>
			<div class="sepH_c">
				<p>Layout:</p>
				<div class="clearfix">
					<label class="radio inline"><input type="radio" name="ssw_layout" id="ssw_layout_fluid" value="" checked /> Fluid</label>
					<label class="radio inline"><input type="radio" name="ssw_layout" id="ssw_layout_fixed" value="gebo-fixed" /> Fixed</label>
				</div>
			</div>
			<div class="sepH_c">
				<p>Sidebar position:</p>
				<div class="clearfix">
					<label class="radio inline"><input type="radio" name="ssw_sidebar" id="ssw_sidebar_left" value="" checked /> Left</label>
					<label class="radio inline"><input type="radio" name="ssw_sidebar" id="ssw_sidebar_right" value="sidebar_right" /> Right</label>
				</div>
			</div>
			<div class="sepH_c">
				<p>Show top menu on:</p>
				<div class="clearfix">
					<label class="radio inline"><input type="radio" name="ssw_menu" id="ssw_menu_click" value="" checked /> Click</label>
					<label class="radio inline"><input type="radio" name="ssw_menu" id="ssw_menu_hover" value="menu_hover" /> Hover</label>
				</div>
			</div>
			
			<div class="gh_button-group">
				<a href="#" id="showCss" class="btn btn-primary btn-mini">Show CSS</a>
				<a href="#" id="resetDefault" class="btn btn-mini">Reset</a>
			</div>
			<div class="hide">
				<ul id="ssw_styles">
					<li class="small ssw_mbColor sepH_a" style="display:none">body {<span class="ssw_mColor sepH_a" style="display:none"> color: #<span></span>;</span> <span class="ssw_bColor" style="display:none">background-color: #<span></span> </span>}</li>
					<li class="small ssw_lColor sepH_a" style="display:none">a { color: #<span></span> }</li>
				</ul>
			</div>
		</div>
		
		<div id="maincontainer" class="clearfix">
			<header>
				<div class="navbar navbar-fixed-top">
					<div class="navbar-inner">
						<div class="container-fluid">
							<a class="brand" href="#" ><i class="icon-home icon-white"></i> Tourism Management <span class="sml_t"></span></a>
							<ul class="nav user_menu pull-right">
								<li class="hidden-phone hidden-tablet">
									<div class="nb_boxes clearfix">
										<a data-toggle="modal" data-backdrop="static" href="#myMail" class="label ttip_b" title="新消息">0 <i class="splashy-mail_light"></i></a>
										<a data-toggle="modal" data-backdrop="static" href="#myTasks" class="label ttip_b" title="新任务">0 <i class="splashy-calendar_week"></i></a>
									</div>
								</li>
								<li class="divider-vertical hidden-phone hidden-tablet"></li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle nav_condensed ttip_b" data-toggle="dropdown" title="语言"><i class="flag-cn"></i> <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href="javascript:void(0)"><i class="flag-cn"></i> 中国（简体）</a></li>
										<li><a href="javascript:void(0)"><i class="flag-hk"></i> 香港（繁體）</a></li>
									</ul>
								</li>
								<li class="divider-vertical hidden-phone hidden-tablet"></li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="img/user_avatar.png"  alt="" class="user_avatar" />${username } <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href="javascrip:void(0)" >My Profile</a></li>
										<li><a href="javascrip:void(0)">Another action</a></li>
										<li class="divider"></li>
										<li><a href="/index.do" >注销</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="modal hide fade" id="myMail">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">×</button>
						<h3>New messages</h3>
					</div>
					<div class="modal-body">
						<div class="alert alert-info">In this table jquery plugin turns a table row into a clickable link.</div>
						<table class="table table-condensed table-striped" data-rowlink="a">
							<thead>
								<tr>
									<th>Sender</th>
									<th>Subject</th>
									<th>Date</th>
									<th>Size</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Declan Pamphlett</td>
									<td><a href="javascript:void(0)">Lorem ipsum dolor sit amet</a></td>
									<td>23/05/2012</td>
									<td>25KB</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<a href="javascript:void(0)" class="btn">Go to mailbox</a>
					</div>
				</div>
				<div class="modal hide fade" id="myTasks">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">×</button>
						<h3>New Tasks</h3>
					</div>
					<div class="modal-body">
						<div class="alert alert-info">In this table jquery plugin turns a table row into a clickable link.</div>
						<table class="table table-condensed table-striped" data-rowlink="a">
							<thead>
								<tr>
									<th>id</th>
									<th>Summary</th>
									<th>Updated</th>
									<th>Priority</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>P-23</td>
									<td><a href="javascript:void(0)">Admin should not break if URL&hellip;</a></td>
									<td>23/05/2012</td>
									<td class="tac"><span class="label label-important">High</span></td>
									<td>Open</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<a href="javascript:void(0)" class="btn">Go to task manager</a>
					</div>
				</div>
				
			</header>    
        
	        <div id="contentwrapper">
                <div class="main_content">
                	<!-- <div id="jCrumbs" class="breadCrumb module">
                		<ul>
                			<li>
                				<a href="#"><i class="icon-home" ></i></a>
                			</li>
                			<li>
                				基础数据
                			</li>
                			<li>
                				系统配置
                			</li>
                		</ul>
                	</div> -->
                	<div class="row-fluid">
					    <div class="span12">
					    	<div class="tabbable" id="mainTab">
					    		<ul class="nav nav-tabs">
									<li class="active"><a href="#tab_home" data-toggle="tab">Home</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab_home">
					    				<h3 class="heading">Regular tabs</h3>
									
									</div>
								</div>
					    	</div>
					    </div>
					</div>
				</div>
            </div>
            <!-- <a href="javascript:void(0)" class="sidebar_switch on_switch ttip_r" title="Hide Sidebar">Sidebar switch</a> -->
			<div class="sidebar">
	
			<div class="antiScroll">
				<div class="antiscroll-inner">
					<div class="antiscroll-content">
				
						<div class="sidebar_inner">
							<form action="#" class="input-append" method="post" >
								<input autocomplete="off" name="query" class="search_query input-medium" size="16" type="text" placeholder="Search..." /><button type="submit" class="btn"><i class="icon-search"></i></button>
							</form>
							<div id="side_accordion" class="accordion">
								<div class="accordion-group">
									<div class="accordion-heading">
										<a href="#collapse_calc" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
										   <i class="icon-th"></i> Calculator
										</a>
									</div>
									<div class="accordion-body collapse in" id="collapse_calc">
										<div class="accordion-inner">
											<form name="Calc" id="calc">
												<div class="formSep control-group input-append">
													<input type="text" style="width:130px" name="Input" /><button type="button" class="btn" name="clear" value="c" OnClick="Calc.Input.value = ''"><i class="icon-remove"></i></button>
												</div>
												<div class="control-group">
													<input type="button" class="btn btn-large" name="seven" value="7" OnClick="Calc.Input.value += '7'" />
													<input type="button" class="btn btn-large" name="eight" value="8" OnCLick="Calc.Input.value += '8'" />
													<input type="button" class="btn btn-large" name="nine" value="9" OnClick="Calc.Input.value += '9'" />
													<input type="button" class="btn btn-large" name="div" value="/" OnClick="Calc.Input.value += ' / '">
												</div>
												<div class="control-group">
													<input type="button" class="btn btn-large" name="four" value="4" OnClick="Calc.Input.value += '4'" />
													<input type="button" class="btn btn-large" name="five" value="5" OnCLick="Calc.Input.value += '5'" />
													<input type="button" class="btn btn-large" name="six" value="6" OnClick="Calc.Input.value += '6'" />
													<input type="button" class="btn btn-large" name="times" value="x" OnClick="Calc.Input.value += ' * '" />
												</div>
												<div class="control-group">
													<input type="button" class="btn btn-large" name="one" value="1" OnClick="Calc.Input.value += '1'" />
													<input type="button" class="btn btn-large" name="two" value="2" OnCLick="Calc.Input.value += '2'" />
													<input type="button" class="btn btn-large" name="three" value="3" OnClick="Calc.Input.value += '3'" />
													<input type="button" class="btn btn-large" name="minus" value="-" OnClick="Calc.Input.value += ' - '" />
												</div>
												<div class="formSep control-group">
													<input type="button" class="btn btn-large" name="dot" value="." OnClick="Calc.Input.value += '.'" />
													<input type="button" class="btn btn-large" name="zero" value="0" OnClick="Calc.Input.value += '0'" />
													<input type="button" class="btn btn-large" name="DoIt" value="=" OnClick="Calc.Input.value = Math.round( eval(Calc.Input.value) * 1000)/1000" />
													<input type="button" class="btn btn-large" name="plus" value="+" OnClick="Calc.Input.value += ' + '" />
												</div>
											</form>
										</div>
									 </div>
								</div>
								
								<div class="accordion-group">
									<div class="accordion-heading">
										<a href="#collapse_config" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
											<i class="icon-folder-open"></i> 基础数据
										</a>
									</div>
									<div class="accordion-body collapse" id="collapse_config">
										<div class="accordion-inner">
											<ul class="nav nav-list">
												<li><a href="javascript:void(0)">系统配置</a></li>
												<li><a href="javascript:void(0)">区域配置</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="push"></div>
						</div>
					</div>
				</div>
			</div>

		</div>

	    <script>
	        $(document).ready(function() {
				(function(a){jQuery.browser.mobile=/android.+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))})(navigator.userAgent||navigator.vendor||window.opera);
				if(jQuery.browser.mobile) {
					if (top !== self) top.location.href = self.location.href;
				}
	            setTimeout('$("html").removeClass("js")',1000);
				
	        });
	    </script>
		
		<script type="text/javascript">
	
			var _gaq = _gaq || [];
			_gaq.push(['_setAccount', 'UA-32339645-1']);
			_gaq.push(['_trackPageview']);
		  
			(function() {
			  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();
		  
		  </script>
	  
		</div>
	</body>
</html>