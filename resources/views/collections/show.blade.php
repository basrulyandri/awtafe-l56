@extends('layouts.backend.main')
@section('header')
  
@endsection
@section('title')
  {{$collection->type->name}} {{$collection->title}}
@stop

@section('content')
  <section class="content-header">
    <h1>Detail {{$collection->type->name}}</h1>    
    <ol class="breadcrumb">
        <li><a href="{{route('dashboard.index')}}"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="{{route('collection.index')}}">Collections</a></li>
        <li class="active">Detail</li>
      </ol>
  </section>
  

  <section class="content"> 
    <div class="row">
    	 <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="img-responsive" src="{{url('/')}}{{$collection->thumbnail}}" alt="User profile picture">

              <h3 class="profile-username text-center">{{$collection->title}}</h3>

              <p class="text-muted text-center">Penulis</p>
               <p class="text-muted text-center">{{$collection->author->name}}</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Kode</b> <a class="pull-right">{{$collection->code}}</a>
                </li>
              </ul>

              <a target="_blank" href="{{url('/')}}{{$collection->filename}}" class="btn btn-primary"><b>Lihat</b></a>
              <a href="" class="btn btn-warning"><b>Edit</b></a>
              <a href="{{route('collection.destroy',$collection)}}" class="btn btn-danger"><b>Hapus</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>

        <div class="col-md-9">
          <div class="box box-primary">
            <div class="box-header" style="cursor: move;">
              <h3 class="box-title">Sinopsis</h3>
            </div>
            <div class="box-body">
              {!!$collection->content!!}
            </div>
          </div>
        </div>
    </div>
  </section>
@stop

@section('footer')

@endsection
