<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Author;
use App\Collection;

class CollectionController extends Controller
{

    public function index()
    {
        $collections = Collection::OrderBy('created_at','desc')->paginate(5);
        return view('collections.index',compact(['collections']));
    }

    public function show(Collection $collection)
    {
        return view('collections.show',compact(['collection']));
    }

    public function edit(Collection $collection)
    {
        return view('collections.edit',compact(['collection']));
    }

    public function update(Request $request,Collection $collection)
    {
        $collection->update($request->all());
        return redirect()->route('collection.show',$collection)->with('success','Data berhasil di update');
    }

    public function destroy(Collection $collection)
    {
        $collection->authors()->detach();
        $collection->delete();
        return redirect()->route('collection.index')->with('toastr-success','Koleksi Berhasil di hapus.');
    }
	public function fatwa()
	{
		$fatwas = Collection::whereTypeId(1)->get();
		return view('fatwa/index',compact(['fatwas']));
	}
    public function addFatwa()
    {
    	$categories = \App\Category::whereTypeId(1)->pluck('name','id')->prepend('Pilih','')->toArray();
    	return view('fatwa.add',compact(['categories']));
    }

    public function insertFatwa(Request $request)
    {
        //dd($request->all());
    	$fatwa = Collection::create($request->all());
    	return redirect()->route('collection.index')->with('success','Data Fatwa Berhasil ditambahkan');
    }

    public function book()
    {
        
    }

    public function addbook()
    {
        $authors = Author::pluck('name','id')->prepend('Pilih','')->toArray();
        $categories = \App\Category::whereTypeId(3)->pluck('name','id')->prepend('Pilih','')->toArray();
        return view('books.add',compact(['categories','authors']));
    }

    public function insertbook(Request $request)
    {
        $fatwa = Collection::create($request->except(['author_id']));
        //dd($fatwa->authors());
        $fatwa->authors()->attach($request->author_id);
        return redirect()->route('collection.index')->with('success','Data Buku Berhasil ditambahkan');
    }

    public function ijtima()
    {
        
    }

    public function addijtima()
    {        
        return view('ijtima.add');
    }

    public function insertijtima(Request $request)
    {
        //dd($request->all());
        $fatwa = Collection::create($request->all());                
        return redirect()->route('collection.index')->with('success','Data Buku Berhasil ditambahkan');
    }
}
