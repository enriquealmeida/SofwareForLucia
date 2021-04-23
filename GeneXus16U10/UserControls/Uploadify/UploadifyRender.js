function Uploadify()
{
	this.Width;
	this.Height;
	this.Multi;
	this.AutomaticUpload;
	this.ButtonText;
	this.ButtonImage;
	this.SizeLimit;
	this.SimultaneousUploadLimit;
	this.FileExtension;
	this.FileDescription;
	this.UploadedFiles;
	this.QueuedFiles;
	this.File; 
	this.Error;
	this.UploadScript;

	this.SetFile = function(data)
	{
		this.File = data;
	}

	this.GetFile = function()
	{
		return this.File;
	} 
	
	this.SetUploadedFiles = function(data)
	{
		this.UploadedFiles = data;
	}

	this.GetUploadedFiles = function()
	{
		return this.UploadedFiles;
	} 

	this.SetQueuedFiles = function(data)
	{
		this.QueuedFiles = data;
	}

	this.GetQueuedFiles = function()
	{
		return this.QueuedFiles;
	}
	
	this.Clean = function()
	{
		this.UploadedFiles = new Array();
		this.QueuedFiles = new Array();
		this.ClearFile();
		this.Error="";
		var fileName =  this.ContainerName +"File"
 		$('#'+fileName).uploadifyClearQueue();
	}
	
	this.ClearFile = function()
	{
		this.File.OriginalFileName = "";
		this.File.TemporalFileName = "";
		this.File.FileSize = 0;
		this.File.FileType = "";
		this.File.CreationDate  = "";
		this.File.ModificationDate  = "";
	}
	
	
	this.Refresh = function()
	{			
		var containerName = this.ContainerName
		var mythis = this;
 		var fileName =  containerName +"File";
		
		$('#'+fileName).uploadifySettings('buttonText',mythis.ButtonText);
		$('#'+fileName).uploadifySettings('fileExt',mythis.FileExtension);
		$('#'+fileName).uploadifySettings('fileDesc',mythis.FileDescription);
		$('#'+fileName).uploadifySettings('simUploadLimit',parseInt(mythis.SimultaneousUploadLimit));
		$('#'+fileName).uploadifySettings('sizeLimit',mythis.SizeLimit*1024);
		$('#'+fileName).uploadifySettings('folder',mythis.Folder);
		$('#'+fileName).uploadifySettings('script',mythis.UploadScript);
		$('#'+fileName).uploadifySettings('height',mythis.Height);
		$('#'+fileName).uploadifySettings('width',mythis.Height);
		if (mythis.ButtonImage != null && mythis.ButtonImage != "")
		{
			if((gx.ajax.isabsoluteurl(mythis.ButtonImage)) || (mythis.ButtonImage.substring(0,1) == '/' ))
			{
				$('#'+fileName).uploadifySettings('buttonImg',mythis.ButtonImage);
			}
			else
			{
				$('#'+fileName).uploadifySettings('buttonImg',gx.util.resourceUrl(gx.basePath + gx.staticDirectory, true)+mythis.ButtonImage);
			}		
		}
	}
	
	this.baseUrl = function() {
        return location.href.substr(0, location.href.lastIndexOf('/') + 1);
    }
	
	this.Start = function(){
		var fileName =  this.ContainerName +"File"
 		$('#'+fileName).uploadifyUpload();
	}
	
	this.show = function()
	{
		if (!this.IsPostBack)
		{
			if (swfobject.getFlashPlayerVersion().major<9)
			{
				this.Error = "Required Flash Player 9.0.24 or greater, detected: " + swfobject.getFlashPlayerVersion()
				var containerName = this.ContainerName
				$('#'+containerName).append(this.Error)
			}
			else
			{
			if (this.QueuedFiles=="")
			{
				this.QueuedFiles = [ ];
			}
			var containerName = this.ContainerName
			var fileName =  containerName +"File"
			var buttonName = containerName+ "Button"
			var file = $('<input/>').attr({ id : fileName, name : fileName , type: "file"})
			var mythis = this;
			$('#'+containerName).append(file)
			if (this.UploadScript=="")
			{
				if (gx.gen.isDotNet())
				{
					this.UploadScript = "upload.aspx"
				}
				else
				{ 
					this.UploadScript =  this.baseUrl() + "upload";
				}
			}
			var diccionario = {
					'width':mythis.Width,
					'height' : mythis.Height,
					'uploader':  gx.util.resourceUrl(gx.basePath + gx.staticDirectory + 'Uploadify/', true)+'uploadify.swf',
					'script': mythis.UploadScript,
					'cancelImg': gx.util.resourceUrl(gx.basePath + gx.staticDirectory + 'Uploadify/', true)+'cancel.png',
					'folder': mythis.Folder,
					'sizeLimit': mythis.SizeLimit*1024,
					'simUploadLimit': parseInt(mythis.SimultaneousUploadLimit),
					'fileExt' : mythis.FileExtension,
					'fileDesc' : mythis.FileDescription,
					'auto' :	mythis.AutomaticUpload,
					'multi' : mythis.Multi,
					'buttonText' : mythis.ButtonText,
					'wmode'     : 'transparent',
					'onComplete': function(event,queueID,fileObj,EncodedResponse,data) 
					{	
					
						if (gx.gen.isDotNet())
						{
							response = EncodedResponse;
						}
						else
						{
							if (EncodedResponse.search("tempfilename")==-1)
							{
								response = gx.base64.decode(EncodedResponse);
							}
							else
							{
								response = EncodedResponse;
							}
						}
						var archivename = jQuery.parseJSON(response)
						var fileTemp = new Object()
						fileTemp.OriginalFileName = archivename.filename;
						fileTemp.TemporalFileName = archivename.tempfilename;
						fileTemp.FileSize = fileObj.size;
						fileTemp.FileType = fileObj.type;
						fileTemp.CreationDate  = fileObj.creationDate.fullYear + "-" + gx.text.padl(fileObj.creationDate.month + "",2,"0") + "-"  + gx.text.padl(fileObj.creationDate.day + "",2,"0") + "T" + gx.text.padl(fileObj.creationDate.hours + "",2,"0") + ":" +  gx.text.padl(fileObj.creationDate.minutes + "",2,"0") + ":" + gx.text.padl(fileObj.creationDate.seconds + "",2,"0")
						fileTemp.ModificationDate  =  fileObj.modificationDate.fullYear + "-" + gx.text.padl(fileObj.modificationDate.month + "",2,"0") + "-"  + gx.text.padl(fileObj.modificationDate.day + "",2,"0") + "T" + gx.text.padl(fileObj.modificationDate.hours + "",2,"0") + ":" +  gx.text.padl(fileObj.modificationDate.minutes + "",2,"0") + ":" + gx.text.padl(fileObj.modificationDate.seconds + "",2,"0")  
						mythis.UploadedFiles.push(fileTemp)
						mythis.File = fileTemp;
												
						for (var z=0;z<mythis.QueuedFiles.length;z++)
						{
							
							if (mythis.QueuedFiles[z].OriginalFileName == archivename.filename)
							{
								mythis.QueuedFiles.splice(z,1);					
							}
						}
						if (mythis.OnComplete)
						{
							mythis.OnComplete();
						}
						
					},
					'onAllComplete'    : function(event,data)
					{
						if (mythis.Error=="")
						{
							if (mythis.OnAllComplete)
							{
								mythis.OnAllComplete();
							}
						}
					},
					'onError' :function(event,queueID,fileObj,errorObj) 
					{
						switch(errorObj.info)
						{
						case 404:
							mythis.Error = "Error " + errorObj.info + ": Calling " + mythis.UploadScript  + " Please check documentation.";
							break;
						case 512:
							mythis.Error = "Error " + errorObj.info + ": " + "SERVER ERROR - " + errorObj.desc.replace("%3A",":");;
							break;
						default:
							mythis.Error = "Error " + errorObj.info + ": " + errorObj.type ;
						}
					
						var fileTemp = new Object()
						fileTemp.OriginalFileName = fileObj.name;
						fileTemp.FileSize = fileObj.size;
						fileTemp.FileType = fileObj.type;				
						fileTemp.CreationDate  = fileObj.creationDate.fullYear + "-" + gx.text.padl(fileObj.creationDate.month + "",2,"0") + "-"  + gx.text.padl(fileObj.creationDate.day + "",2,"0") + "T" + gx.text.padl(fileObj.creationDate.hours + "",2,"0") + ":" +  gx.text.padl(fileObj.creationDate.minutes + "",2,"0") + ":" + gx.text.padl(fileObj.creationDate.seconds + "",2,"0")
						fileTemp.ModificationDate  =  fileObj.modificationDate.fullYear + "-" + gx.text.padl(fileObj.modificationDate.month + "",2,"0") + "-"  + gx.text.padl(fileObj.modificationDate.day + "",2,"0") + "T" + gx.text.padl(fileObj.modificationDate.hours + "",2,"0") + ":" +  gx.text.padl(fileObj.modificationDate.minutes + "",2,"0") + ":" + gx.text.padl(fileObj.modificationDate.seconds + "",2,"0")  

						
						fileTemp.TemporalFileName = "";
						mythis.File = fileTemp;
						if (mythis.OnError)
						{	
							mythis.OnError();
						}
					},
					'onCancel'    : function(event,ID,fileObj,data) 
					{
						this.ClearFile();
						if (fileObj != undefined)
						{
							var fileTemp = new Object()
							fileTemp.OriginalFileName = fileObj.name;
							fileTemp.FileSize = fileObj.size;
							fileTemp.FileType = fileObj.type;
							fileTemp.CreationDate  = fileObj.creationDate.fullYear + "-" + gx.text.padl(fileObj.creationDate.month + "",2,"0") + "-"  + gx.text.padl(fileObj.creationDate.day + "",2,"0") + "T" + gx.text.padl(fileObj.creationDate.hours + "",2,"0") + ":" +  gx.text.padl(fileObj.creationDate.minutes + "",2,"0") + ":" + gx.text.padl(fileObj.creationDate.seconds + "",2,"0")
							fileTemp.ModificationDate  =  fileObj.modificationDate.fullYear + "-" + gx.text.padl(fileObj.modificationDate.month + "",2,"0") + "-"  + gx.text.padl(fileObj.modificationDate.day + "",2,"0") + "T" + gx.text.padl(fileObj.modificationDate.hours + "",2,"0") + ":" +  gx.text.padl(fileObj.modificationDate.minutes + "",2,"0") + ":" + gx.text.padl(fileObj.modificationDate.seconds + "",2,"0")  

							fileTemp.TemporalFileName = "";
							mythis.File = fileTemp;
						}
						for (var z=0;z<mythis.QueuedFiles.length;z++)
						{
							
							if (mythis.QueuedFiles[z].OriginalFileName == fileObj.name)
							{
								mythis.QueuedFiles.splice(z,1);					
							}
						}

						if (mythis.OnCancel)
						{
							mythis.OnCancel();
						}

					},
					 'onSelect'    : function(event,ID,fileObj) {
					 
						mythis.Error="";
						mythis.UploadedFiles = new Array();
						var fileTemp = new Object()
						fileTemp.OriginalFileName = fileObj.name;
						fileTemp.FileSize = fileObj.size;
						fileTemp.FileType = fileObj.type;
						fileTemp.CreationDate  = fileObj.creationDate.fullYear + "-" + gx.text.padl(fileObj.creationDate.month + "",2,"0") + "-"  + gx.text.padl(fileObj.creationDate.day + "",2,"0") + "T" + gx.text.padl(fileObj.creationDate.hours + "",2,"0") + ":" +  gx.text.padl(fileObj.creationDate.minutes + "",2,"0") + ":" + gx.text.padl(fileObj.creationDate.seconds + "",2,"0")
						fileTemp.ModificationDate  = fileObj.modificationDate.fullYear + "-" + gx.text.padl(fileObj.modificationDate.month + "",2,"0") + "-"  + gx.text.padl(fileObj.modificationDate.day + "",2,"0") + "T" + gx.text.padl(fileObj.modificationDate.hours + "",2,"0") + ":" +  gx.text.padl(fileObj.modificationDate.minutes + "",2,"0") + ":" + gx.text.padl(fileObj.modificationDate.seconds + "",2,"0")  
						fileTemp.TemporalFileName = "";
						mythis.QueuedFiles.push(fileTemp)
						mythis.File = fileTemp;
						if (mythis.OnSelect)
						{
							mythis.OnSelect();
						}
					},
					 'onSelectOnce'    : function(event,data) {
						if (mythis.OnSelectOnce)
						{
							mythis.OnSelectOnce();
						}
					}
				};	
			if (mythis.ButtonImage != null && mythis.ButtonImage != "")
			{
		
				if((gx.ajax.isabsoluteurl(mythis.ButtonImage)) || (mythis.ButtonImage.substring(0,1) == '/' ))
				{
					diccionario['buttonImg'] = mythis.ButtonImage;
				}
				else
				{
					diccionario['buttonImg'] = gx.util.resourceUrl(gx.basePath + gx.staticDirectory, true)+mythis.ButtonImage;
				}
				
			}
			$(document).ready(function() {
				$('#'+fileName).uploadify(diccionario);
			});
			}
		}
		
	}

}
