@extends('layouts.backend.main')
@section('header')
  
@endsection
@section('title')
  Koleksi
@stop

@section('content')
  <section class="content-header">
    <h1>Kumpulan Koleksi</h1>    
    <ol class="breadcrumb">
        <li><a href="{{route('dashboard.index')}}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li>Collections</li>        
      </ol>
  </section>
  

  <section class="content"> 
    <div class="row">
    	@foreach($collections as $collection)    	
		<div class="col-md-6 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-gray" style="height: 125px;"><a style="color: #FFF" href="{{route('collection.show',$collection)}}"><img src="{{url('/')}}{{$collection->thumbnail}}" style="width: 100%; padding:5px;"></a></span>

            <div class="info-box-content">
              <span class="info-box-number"><a  style="color: #000" href="{{route('collection.show',$collection)}}">{{$collection->title}}</a></span>
              <span class="text-muted"><i class="fa fa-barcode"></i> {{$collection->code}}</span><br>
              @if($collection->isBuku())
              <span class="text-muted"><i class="fa fa-calendar"></i> {{$collection->date}} Kategori: <strong>{{$collection->category->name}}</strong></span>
              @endif
            </div>
            <div class="info-box-description" style="clear: both;padding: 5px; max-height: 68px;overflow: hidden">
            	<span class="text-muted">{{$collection->description,100}}</span>
            </div>
            <!-- /.info-box-content-->
          </div>
          <!-- /.info-box -->
        </div>   
        @endforeach
    </div>
        {{$collections->links()}}
    </div>
  </section>
@stop

@section('footer')

@endsection
