<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Author;

class AuthorController extends Controller
{
	public function index()
	{
		$authors = Author::paginate(20);
		return view('authors.index',compact('authors'));
	}
}
