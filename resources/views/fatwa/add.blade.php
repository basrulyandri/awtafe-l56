@extends('layouts.backend.main')
@section('header')
  <link rel="stylesheet" href="{!!url('assets')!!}/dist/css/autocomplete.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" type="text/css" href="{{asset('assets/backend/plugins/tinymce/tinymce.min.js')}}">
@endsection
@section('title')
  Tambah Fatwa
@stop

@section('content')

  <section class="content-header">
    <h1>Tambah Fatwa</h1>    
  </section>
  

  <section class="content"> 
    <div class="row">
    	<div class="col-md-8">
    		{!!Form::open(['route' => 'fatwa.insert','class' => 'form-horizontal','enctype' => 'multipart/form-data'])!!}
    			<div class='form-group{{$errors->has('code') ? ' has-error' : ''}}'>
    				{!!Form::label('code','No. Fatwa',['class' => 'col-sm-2 control-label'])!!}
    				<div class="col-sm-10">
    				  {!!Form::text('code',old('code'),['class' => 'form-control','placeholder' => 'No. Fatwa','required' => 'true'])!!}
    				  @if($errors->has('code'))
    				    <span class="help-block">{{$errors->first('code')}}</span>
    				  @endif
    				</div>
    			</div>

    			

    			<input type="hidden" name="type_id" value="1">
    			<div class='form-group{{$errors->has('title') ? ' has-error' : ''}}'>
    				{!!Form::label('title','Judul',['class' => 'col-sm-2 control-label'])!!}
    				<div class="col-sm-10">
    				  {!!Form::text('title',old('title'),['class' => 'form-control','placeholder' => 'Judul','required' => 'true'])!!}
    				  @if($errors->has('title'))
    				    <span class="help-block">{{$errors->first('title')}}</span>
    				  @endif
    				</div>
    			</div>
    			
    			<input type="hidden" name="user_id" value="{{\Auth::user()->id}}">
    			
    			<div class='form-group{{$errors->has('description') ? ' has-error' : ''}}'>
					{!!Form::label('description','Deskripsi',['class' => 'col-sm-2 control-label'])!!}
					<div class="col-sm-10">
					  {!!Form::textarea('description',old('description'),['class' => 'form-control','placeholder' => 'Deskripsi'])!!}
					  @if($errors->has('description'))
					    <span class="help-block">{{$errors->first('description')}}</span>
					  @endif
					</div>
				</div>

				<div class='form-group{{$errors->has('content') ? ' has-error' : ''}}'>
					{!!Form::label('content','Konten',['class' => 'col-sm-2 control-label'])!!}
					<div class="col-sm-10">
					  {!!Form::textarea('content',old('content'),['class' => 'form-control tinyMCE','placeholder' => 'Konten'])!!}
					  @if($errors->has('content'))
					    <span class="help-block">{{$errors->first('content')}}</span>
					  @endif
					</div>
				</div>
    		
    	</div>
    	<div class="col-md-4" role="form">
    		<div class='form-group{{$errors->has('date') ? ' has-error' : ''}}'>
				{!!Form::label('date','Tanggal Terbit',[])!!}
				
				  {!!Form::text('date',old('date'),['class' => 'form-control','placeholder' => 'Tanggal Terbit','required' => 'true','id'=>'tanggalterbit'])!!}
				  @if($errors->has('date'))
				    <span class="help-block">{{$errors->first('date')}}</span>
				  @endif
				
			</div>
			<div class='form-group{{$errors->has('category_id') ? ' has-error' : ''}}'>
				{!!Form::label('category_id','Kategori',[])!!}				
				  {!!Form::select('category_id',$categories,old('category_id'),['class' => 'form-control','required' => 'true'])!!}
				  @if($errors->has('category_id'))
				    <span class="help-block">{{$errors->first('category_id')}}</span>
				  @endif				
			</div>

		
      <div class="from-group">
        <h4>File PDF</h4> 
        <div class="input-group">
           <span class="input-group-btn">
             <a id="uploadfile" data-input="filename" class="btn btn-primary">
               <i class="fa fa-file-pdf-o"></i> Choose
             </a>
           </span>
           <input id="filename" class="form-control" type="text" name="filename">
         </div>         
       </div>
			<div class="from-group">
				<h4>Image Thumbnail</h4> 
        <div class="input-group">
           <span class="input-group-btn">
             <a id="uploadbutton" data-input="thumbnail" data-preview="holder" class="btn btn-primary">
               <i class="fa fa-picture-o"></i> Choose
             </a>
           </span>
           <input id="thumbnail" class="form-control" type="text" name="thumbnail">
         </div>
         <img src="{{url('assets/backend')}}/no-thumbnail.jpg" id="holder" style="margin-top:15px;width:100%"> 
       </div>
       <div class="from-group">
			<input type="submit" class="btn btn-info pull-right" value="Simpan">
			</div>
			{!!Form::close()!!}
    	</div>
    </div>
  </section>
@stop

@section('footer')
<script src="{{asset('assets/backend/plugins/tinymce/tinymce.min.js')}}"></script>
<script src="{{asset('/')}}/vendor/laravel-filemanager/js/lfm.js"></script>
	<script>
		$(document).ready(function(){
	    	var editor_config = {
                path_absolute : "{{ URL::to('/') }}/",
                selector: ".tinyMCE",
                plugins: [
                  "advlist autolink lists link image charmap print preview hr anchor pagebreak",
                  "searchreplace wordcount visualblocks visualchars code fullscreen",
                  "insertdatetime media nonbreaking save table contextmenu directionality",
                  "emoticons template paste textcolor colorpicker textpattern"
                ],
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media",
                relative_urls: false,
                file_browser_callback : function(field_name, url, type, win) {
                  var x = window.innerWidth || document.documentElement.clientWidth || document.getElementsByTagName('body')[0].clientWidth;
                  var y = window.innerHeight|| document.documentElement.clientHeight|| document.getElementsByTagName('body')[0].clientHeight;

                  var cmsURL = editor_config.path_absolute + 'admin/rollo-filemanager?field_name=' + field_name;
                  if (type == 'image') {
                    cmsURL = cmsURL + "&type=Images";
                  } else {
                    cmsURL = cmsURL + "&type=Files";
                  }

                  tinyMCE.activeEditor.windowManager.open({
                    file : cmsURL,
                    title : 'Filemanager',
                    width : x * 0.8,
                    height : y * 0.8,
                    resizable : "yes",
                    close_previous : "no"
                  });
                }
              };
			$('#tanggalterbit').datepicker({
		        dateFormat : 'yy-mm-dd',
		        yearRange: "-70:+0",
		        changeYear: true,
		        changeMonth: true,	        
	    	});
        
      tinymce.init(editor_config);  
      var domain = "{{url('/')}}/admin/rollo-filemanager";         
      $('#uploadfile').filemanager('file', {prefix: domain});
      $('#uploadbutton').filemanager('image', {prefix: domain});
		});
	</script>
@endsection
