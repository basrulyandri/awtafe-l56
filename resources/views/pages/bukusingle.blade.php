@extends('layouts.frontend.main')

@section('content')
 <main role="main">
  <div class="album py-5 bg-light">
     <div class="container">
          <div class="row">
               <div class="col-md-4 item-photo">
                    <img style="width:100%;" src="{{url('/').$buku->thumbnail}}" />
                </div>
                <div class="col-md-8" style="border:0px solid gray">
                    <!-- Datos del vendedor y titulo del producto -->
                    <h3>{{$buku->title}}</h3>    
                    <h5 style="color:#337ab7">Penulis: <a href="#">{{$buku->author->name}}</a> </h5>
        
                  
                    <div class="section">
                       {!!$buku->description!!}
                   </div>               
        
                    <!-- Botones de compra -->
                    <div class="section" style="padding-bottom:20px;">                          
                        <button type="button" class="btn btn-block btn-primary" data-toggle="modal" data-target="#exampleModal">
                          Lihat Buku
                        </button>                   
                    </div>                                        
                </div>  

                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document" style="max-width: 100%;width:100%;">
                    <div class="modal-content" style="height:100vh;">                    
                      <div class="modal-body">
                        <div class="col-md-12">
                          <div id="my-pdf"></div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                      </div>
                    </div>
                  </div>
                </div>

                                            
        
                 
            </div>
        </div>   
        </div>  
    </main>
@stop

@section('footer')
<script type="text/javascript" src="{{asset('assets/frontend/js')}}/pdfobject.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    PDFObject.embed('{{url("/")}}/{{$buku->filename}}','#my-pdf')
  });
</script>
@stop