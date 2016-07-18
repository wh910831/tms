var tabs;
var liTemp = "<li class='active'><a href='#{href}' data-toggle='tab'>#{label}</a></li>";
var contentTemp = "<div class='tab-content'><div class='tab-pane active' id='#{id}'>#{content}</div></div>";
var tabCount;
$(function() {
	
	tabs = $("mainTab").tabs();
	tabCount = 2;
	
	$(".nav-list a").click(function(){
		addTab(this.innerHTML);
	});
	
	

	function addTab(label){
		var id = "tabs-" + tabCount;
		var li = $(liTemp.replace(/#\{href\}/g, "#" + id).replace(/#\{label\}/g, label));
		var content = $(contentTemp.replace(/#\{id\}/g, id).replace(/#\{content\}/g, "<h3 class='heading'>The New Tag</h3>"))
		
		tabs.find(".nav-tabs").append(li);
		tabs.find(".tab-content").append(content);
		tabs.tabs( "refresh" );
		tabCount++;
	}
	
	
	// 关闭图标：当点击时移除标签页
    tabs.delegate( "span.ui-icon-close", "click", function() {
      var panelId = $( this ).closest( "li" ).remove().attr( "aria-controls" );
      $( "#" + panelId ).remove();
      tabs.tabs( "refresh" );
    });
    
    
});

