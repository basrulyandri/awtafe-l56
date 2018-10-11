<?php
Route::get('adduser', function(){
	$user = new \App\User;
	$user->role_id = 2;
	$user->username = 'rival';
	$user->email = 'm.trivally@gmail.com';
	$user->password = bcrypt('rival54321');
	$user->activated = 1;
	$user->first_name = 'Muhammad';
	$user->last_name = 'Trivally';
	$user->api_token = str_random(60);
	$user->save();
});

Route::get('/',[
		'uses' => 'PageController@home',
		'as' => 'page.home',
	]
);

Route::get('buku/{slug}', [
		'uses' => 'PageController@bukusingle',
		'as' => 'page.buku.single',
	]);

Route::group(['middleware' => 'rbac','prefix' => 'admin'],function(){
	Route::get('roles',[
		'uses' => 'RoleController@index',
		'as' => 'roles.list',
	]);
	Route::get('dashboard', [
		'uses' => 'DashboardController@index',
		'as' => 'dashboard.index',
	]);	

	Route::get('users',[
		'uses' =>  'UserController@index',
		'as' => 'users.list'
	]);

	Route::get('user/add',[
		'uses' => 'UserController@add',
		'as' => 'user.add',
	]);

	Route::post('user/create',[
		'uses' => 'UserController@create',
		'as' => 'user.create'
	]);

	Route::post('user/updatephoto',[
		'uses' => 'UserController@updatePhoto',
		'as' => 'user.updatephoto'
	]);
	Route::get('user/{username}',[
		'uses' => 'UserController@profile',
		'as' => 'user.profile'
	]);

	Route::get('role/{id}/edit',[
		'uses' => 'RoleController@edit',
		'as' => 'role.edit'
	]);

	Route::post('role/{id}/update',[
		'uses' => 'RoleController@update',
		'as' => 'role.update'
	]);	

	Route::get('permissions',[
		'uses' => 'PermissionController@index',
		'as' => 'permissions.list'
	]);

	Route::get('permission/add',[
		'uses' => 'PermissionController@add',
		'as' => 'permission.add'
	]);

	Route::post('permission/create',[
		'uses' => 'PermissionController@create',
		'as' => 'permission.create',
	]);

	Route::get('/permission/{id}/edit',[
		'uses' => 'PermissionController@edit',
		'as' => 'permission.edit',
	]);

	Route::post('permission/{id}/update',[
		'uses' => 'PermissionController@update',
		'as' => 'permission.update',
	]);

	Route::get('permission/{id}/delete',[
		'uses' => 'PermissionController@delete',
		'as' => 'permission.delete',
	]);

	Route::get('/identitasPT',[
		'uses' => 'SettingController@identitaspt',
		'as' => 'setting.identitaspt',
		]);

	Route::post('identitasPT/update',[
		'uses' => 'SettingController@identitasptupdate',
		'as' => 'setting.identitasptupdate',
	]);
	
	Route::get('laporan/umum',[
		'uses' => 'LaporanController@umum',
		'as' => 'laporan.umum',
	]);	
	
	Route::get('error404',function(){
		return view('errors.404');
	});

	Route::get('setting',[
		'uses' => 'SettingController@aplikasi',
		'as' => 'setting.aplikasi',
	]);

	Route::post('setting/update',[
		'uses' => 'SettingController@update',
		'as' => 'setting.update',
	]);
	

	Route::get('myprofile',[
		'uses' => 'UserController@myprofile',
		'as' => 'user.myprofile',
	]);
	Route::get('collections', [
			'uses' => 'CollectionController@index',
			'as' => 'collection.index',
		]);
	Route::get('collection/{collection}/show', [
			'uses' => 'CollectionController@show',
			'as' => 'collection.show',
		]);
	Route::get('collection/{collection}/edit', [
			'uses' => 'CollectionController@edit',
			'as' => 'collection.edit',
		]);

	Route::post('collection/{collection}/update', [
			'uses' => 'CollectionController@update',
			'as' => 'collection.update',
		]);
	Route::get('collection/{collection}/destroy', [
			'uses' => 'CollectionController@destroy',
			'as' => 'collection.destroy',
		]);

	Route::get('fatwa',[
		'uses' => 'CollectionController@fatwa',
		'as' => 'fatwa.index',
	]);

	Route::get('fatwa/add',[
		'uses' => 'CollectionController@addFatwa',
		'as' => 'fatwa.add',
	]);

	Route::post('fatwa/insert',[
		'uses' => 'CollectionController@insertFatwa',
		'as' => 'fatwa.insert',
	]);

	Route::get('book',[
		'uses' => 'CollectionController@book',
		'as' => 'book.index',
	]);

	Route::get('book/add',[
		'uses' => 'CollectionController@addbook',
		'as' => 'book.add',
	]);

	Route::post('book/insert',[
		'uses' => 'CollectionController@insertbook',
		'as' => 'book.insert',
	]);

	Route::get('ijtima',[
		'uses' => 'CollectionController@ijtima',
		'as' => 'ijtima.index',
	]);

	Route::get('ijtima/add',[
		'uses' => 'CollectionController@addijtima',
		'as' => 'ijtima.add',
	]);

	Route::post('ijtima/insert',[
		'uses' => 'CollectionController@insertijtima',
		'as' => 'ijtima.insert',
	]);

	Route::get('author', [
			'uses' => 'AuthorController@index',
			'as' => 'author.index',
		]);
});



Route::get('error401',[
		'uses'=> function(){return view('errors.401');},
		'as' => 'auth.error401',
	]);

Route::get('searchWilayah',[
	'uses' => 'DashboardController@cariWilayah',
	'as' => 'search.wilayah',
]);

Route::get('login',[
	'uses' => 'AuthController@login',
	'as' => 'auth.login',
	'middleware' => 'guest',
]);

Route::post('dologin',[
	'uses' => 'AuthController@dologin',
	'as' => 'auth.dologin',
]);

Route::get('logout',[
	'uses' => 'AuthController@logout',
	'as' => 'auth.logout',
]);
