<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateUsersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('users', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('role_id')->index('role_id_2');
			$table->string('username', 100)->unique('username');
			$table->string('email')->unique();
			$table->string('password');
			$table->boolean('activated')->default(0);
			$table->string('activation_code')->nullable()->index();
			$table->dateTime('activated_at')->nullable();
			$table->dateTime('last_login')->nullable();
			$table->string('reset_password_code')->nullable()->index();
			$table->string('remember_token', 100)->nullable();
			$table->string('first_name')->nullable();
			$table->string('last_name')->nullable();
			$table->string('api_token', 60);
			$table->text('about', 65535)->nullable();
			$table->text('address', 65535)->nullable();
			$table->string('phone', 45)->nullable();
			$table->string('facebook_url')->nullable();
			$table->string('twitter_url')->nullable();
			$table->string('google_plus_url')->nullable();
			$table->timestamps();
			$table->string('photo', 100)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('users');
	}

}
