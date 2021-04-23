function BootstrapPanel()
{
	this.Collapsible;
	this.Collapsed;
	this.ShowCollapseIcon;
	this.IconPosition;
	this.ShowHeader;
	this.Title;
	this.AutoScroll;
	this.Width;
	this.Height;
	this.AutoWidth;
	this.AutoHeight;
	this.Cls;

	this.show = function()
	{
		///UserCodeRegionStart:[show] (do not remove this comment.)


	    if (this.my_panel == undefined) {
	        this.my_panel = new DVelopBootstrapPanel(this);
	        this.my_panel.render();
	    } else {
	        this.my_panel.refresh()
	    }
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		///UserCodeRegionEnd: (do not remove this comment.)
	}
	///UserCodeRegionStart:[User Functions] (do not remove this comment.)

	this.Collapse = function () {
	    this.Collapsed = true;
	    var id = this.my_panel.containerName;
	    $("#PanelBody_" + id).collapse('hide');
	}

	this.Expand = function () {
	    this.Collapsed = false;
	    var id = this.my_panel.containerName;
	    $("#PanelBody_" + id).collapse('show');
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	///UserCodeRegionEnd: (do not remove this comment.):
}
