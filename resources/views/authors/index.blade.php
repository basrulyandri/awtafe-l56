@extends('layouts.backend.main')
@section('header')
  
@endsection
@section('title')
  Penulis
@stop

@section('content')
  <section class="content-header">
    <h1>Penulis</h1>    
  </section>
  

  <section class="content"> 
    <div class="row">
    	<div class="col-md-12">
          <div class="box">
            <div class="box-body">
              <table class="table table-bordered">
                <tbody>
                <tr>
                  <th>Nama</th>
                  <th>Tentang Penulis</th>                  
                </tr>
                @foreach($authors as $author)
                <tr>
                  <td>{{$author->name}}</td>
                  <td>{{$author->bio}}</td>                 
                </tr>
               @endforeach
              </tbody></table>
            </div>
            <!-- /.box-body -->
          {{$authors->links()}}
          </div>       
        </div>
    </div>
  </section>
@stop

@section('footer')

@endsection
