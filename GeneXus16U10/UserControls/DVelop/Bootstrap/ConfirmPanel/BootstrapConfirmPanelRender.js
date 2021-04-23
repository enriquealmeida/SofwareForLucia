function BootstrapConfirmPanel()
{
	this.Width;
	this.Height;
	this.Title;
	this.ConfirmText;
	this.YesButtonCaption;
	this.NoButtonCaption;
	this.CancelButtonCaption;
	this.YesButtonPosition;
	this.ConfirmType;
	this.Result;
	this.Class;

	this.show = function()
	{
		if(this.my_Panel == undefined){
			this.my_Panel = new DVelopBootstrapConfirmPanel(this);
		}
	}

	this.Confirm = function() {
		if(this.my_Panel != undefined){
			this.my_Panel.openModal();
		}
	}
	
	this.CloseConfirmPanel = function() {
		if(this.my_Panel != undefined){
			this.my_Panel.closeModal();
		}
	}
}
