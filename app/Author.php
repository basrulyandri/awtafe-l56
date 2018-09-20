<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Author extends Model
{
    public function collections()
    {
    	return $this->belongsToMany(Collection::class);
    }
}
