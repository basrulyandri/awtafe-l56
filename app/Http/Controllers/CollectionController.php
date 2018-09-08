<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

class CollectionController extends Controller
{

	public function fatwa()
	{
		$fatwas = \App\Collection::whereTypeId(1)->get();
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
    	$fatwa = \App\Collection::create($request->all());
    	return redirect()->route('fatwa.index')->with('success','Data Fatwa Berhasil ditambahkan');
    }
}
