<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Collection extends Model
{
	 use Sluggable;

    
	protected $fillable = ['code','date','type_id','title','description','user_id','content','category_id','parent','author_id','thumbnail','filename'];

	protected $dates = ['date'];

	/**
     * Return the sluggable configuration array for this model.
     *
     * @return array
     */
    public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }
	public function category()
	{
		return $this->belongsTo('App\Category');
	}

    public function author()
    {
        return $this->belongsTo(Author::class);
    }

    public function type()
    {
        return $this->belongsTo(Type::class);
    }

}
