gx.uc.FileUpload = function ($) {
	var uploadedFiles = [];
	var $fileUpload;

	var toBoolean = gx.lang.gxBoolean;

	var getAcceptFileTypesRegex = function (acceptedFileTypes, customFileType) {
		customFileType = customFileType || "";
		switch(acceptedFileTypes) {
			case "image":
				return /(\.|\/)(gif|jpe?g|png)$/i;
			case "audio":
				return /(\.|\/)(mp3|wav|ogg|3gp|aac|wma)$/i;
			case "video":
				return /(\.|\/)(avi|flv|wmv|mov|mp4)$/i;
			case "custom":
				if (customFileType)
					return new RegExp("(\\.|\\/)(" + customFileType.replace(/,/g, "|") + ")$", "i");
		}
		return undefined;
	};

	this.getFiles = function () {
		return $.map(uploadedFiles, function (item) {
			if (!item.destroyed) {
				return {
					FullName: item.name,
					Name: item.name.replace(new RegExp("\." + item.extension + "$", "i"), ""),
					Extension: item.extension,
					Size: item.size,
					File: item.path
				};
			}
		});
	};

	this.show = function () {
		gx.uc.FileUpload.initTemplates();

		if (!this.IsPostBack) {
			var $container = $(this.getContainerControl()),
				baseId = $container.attr('id'),
				acceptedFileTypes = this.AcceptedFileTypes,
				customFileTypes = this.CustomFileTypes,
				acceptAtt = "",
				multipleAtt = "",
				acceptFileTypesProp = getAcceptFileTypesRegex(acceptedFileTypes, customFileTypes),
				className = this.Class || "",
				options,
				filesToUploadCount = 0,
				uploadedFilesCount = 0;


			if (acceptedFileTypes === "image" || acceptedFileTypes === "audio" || acceptedFileTypes === "video") {
				acceptAtt = ' accept="' + acceptedFileTypes + '/*"';
			}
			else {
				if (customFileTypes) {
					acceptAtt = ' accept=".' + customFileTypes.split(',').join(',.') + '"';
				}
			}

			multipleAtt = this.MaxNumberOfFiles === 1 ? "" : " multiple";

			$fileUpload = $([
				'<div class="gx-fileupload ', className, '">',
					'<div class="row fileupload-buttonbar">',
						'<div class="col-lg-7">',
							'<span class="btn btn-success fileinput-button" title="', this.TooltipText ,'" >',
								'<i class="glyphicon glyphicon-plus"></i>',
								'<span>', gx.getMessage('GXM_fileupload_addfiles'), '</span>',
								'<input type="file" name="files[]"', multipleAtt, acceptAtt, '>',
							'</span>',
							'<button type="submit" class="btn btn-primary start">',
								'<i class="glyphicon glyphicon-upload"></i>',
								'<span>', gx.getMessage('GXM_fileupload_start'), '</span>',
							'</button>',
							'<button type="reset" class="btn btn-warning cancel">',
								'<i class="glyphicon glyphicon-ban-circle"></i>',
								'<span>', gx.getMessage('GXM_fileupload_cancel'), '</span>',
							'</button>',
							'<span class="fileupload-process"></span>',
						'</div>',
						'<div class="col-lg-5 fileupload-progress fade">',
							'<div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">',
								'<div class="progress-bar progress-bar-success" style="width:0%;"></div>',
							'</div>',
							'<div class="progress-extended">&nbsp;</div>',
						'</div>',
					'</div>',
					'<div class="dropzone fade">',
						'<span>', gx.getMessage('GXM_fileupload_drophere'), '</span>',
					'</div>',
					'<table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>',
				'</div>'
			].join("\n"));

			$container.append($fileUpload);

			// Initialize the jQuery File Upload widget:
			$fileUpload.fileupload({
				url: gx.gen.isDotNet() ? 'gxobject.aspx' : '../gxobject',
				autoUpload: toBoolean(this.AutoUpload)
			});

			$fileUpload.bind('fileuploadadded', (function () {
				filesToUploadCount++;
			}).closure(this));

			$fileUpload.bind('fileuploaddestroyed', function (e, data) {
				var destroyedFileIndex = data.context.data('index');
				uploadedFiles[destroyedFileIndex].destroyed = true;
			});

			$fileUpload.bind('fileuploadcompleted', (function () {
				uploadedFilesCount++;
				if (uploadedFilesCount === filesToUploadCount) {
					if (this.UploadComplete) {
						this.UploadComplete();
					}
				}
			}).closure(this));

			options = {
				// Enable image resizing, except for Android and Opera,
				// which actually support image resizing, but fail to
				// send Blob objects via XHR requests:
				disableImageResize: /Android(?!.*Chrome)|Opera/
					.test(window.navigator.userAgent),
				maxFileSize: this.MaxFileSize,
				getFilesFromResponse: function (data) {
					var file;
					for (var i = 0; i < data.result.files.length; i++) {
						file = data.result.files[i];
						file._index = uploadedFilesCount;
						uploadedFiles.push(file);
					}
					return data.result.files;
				},
				messages: {
					maxNumberOfFiles: gx.getMessage('GXM_fileupload_maxNumberOfFiles'),
					acceptFileTypes: gx.getMessage('GXM_fileupload_acceptFileTypes'),
					maxFileSize: gx.getMessage('GXM_fileupload_maxFileSize')
				},
				showCancelDownloadButton: this.EnableUploadedFileCanceling,
				autoDisableAdd: this.AutoDisableAddingFiles
			};

			if (this.MaxNumberOfFiles > 0) {
				options.maxNumberOfFiles = this.MaxNumberOfFiles;
			}

			if (acceptFileTypesProp) {
				options.acceptFileTypes = acceptFileTypesProp;
			}

			$fileUpload.fileupload('option', options);
		}
	};

	this.destroy = function () {
		if ($fileUpload) {
			$fileUpload.fileupload('destroy');
			$.cleanData($fileUpload);
		}
	};

	this.Clear = function () {
		$fileUpload.find("table tbody.files").empty();
		uploadedFiles = [];
	};

	this.StartUpload = function () {
		$fileUpload.find(".start").click();
	};
}

gx.uc.FileUpload.initTemplates = function () {
	if (!gx.uc.FileUpload.templatesInitialized) {
		gx.uc.FileUpload.templatesInitialized = true;
		gx.$(['<script id="template-upload" type="text/x-tmpl">',
		'{% for (var i=0, file; file=o.files[i]; i++) { %}',
			'<tr class="template-upload fade">',
				'<td>',
					'<span class="preview"></span>',
				'</td>',
				'<td>',
					'<p class="name">{%=file.name%}</p>',
					'<strong class="error text-danger"></strong>',
				'</td>',
				'<td>',
					'<p class="size">', gx.getMessage('GXM_fileupload_processing'), '</p>',
					'<div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>',
				'</td>',
				'<td>',
					'{% if (!i && !o.options.autoUpload) { %}',
						'<button class="btn btn-primary start" disabled>',
							'<i class="glyphicon glyphicon-upload"></i>',
							'<span>', gx.getMessage('GXM_fileupload_startone'), '</span>',
						'</button>',
					'{% } %}',
					'{% if (!i) { %}',
						'<button class="btn btn-warning cancel">',
							'<i class="glyphicon glyphicon-ban-circle"></i>',
							'<span>', gx.getMessage('GXM_fileupload_cancelone'), '</span>',
						'</button>',
					'{% } %}',
				'</td>',
			'</tr>',
		'{% } %}',
		'</script>'].join("\n")).appendTo(document.body);

		gx.$(['<script id="template-download" type="text/x-tmpl">',
		'{% for (var i=0, file; file=o.files[i]; i++) { %}',
			'<tr class="template-download fade" data-index="{%=file._index%}">',
				'<td>',
					'<span class="preview"></span>',
				'</td>',
				'<td>',
					'<p class="name">',
						'<span {%=file.thumbnailUrl?\'data-gallery\':\'\'%}>{%=file.name%}</span>',
					'</p>',
					'{% if (file.error) { %}',
						'<div><span class="label label-danger">', gx.getMessage('GXM_fileupload_error'), '</span><strong class="error text-danger">{%=file.error%}</strong></div>',
					'{% } %}',
				'</td>',
				'<td>',
					'<span class="size">{%=o.formatFileSize(file.size)%}</span>',
				'</td>',
				'<td>',
				'{% if (o.options.showCancelDownloadButton) { %}',
					'<button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields=\'{"withCredentials":true}\'{% } %}>',
						'<i class="glyphicon glyphicon-trash"></i>',
						'<span>', gx.getMessage('GXM_fileupload_cancelone'), '</span>',
					'</button>',
				'{% } %}',
				'</td>',
			'</tr>',
		'{% } %}',
		'</script>'].join("\n")).appendTo(document.body);
	}
}

gx.$(gx.uc.FileUpload.initTemplates);