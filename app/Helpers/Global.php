<?php

function siteName(){
	'test';
}

function appLogo(){
	return \App\Setting::whereName('app_logo')->first()->value;
}

function PTName(){
	return \App\Setting::whereName('pt_name')->first()->value;
}

function motto(){
	return \App\Setting::whereName('motto')->first()->value;
}

function PTAlamat(){
	return \App\Identitaspt::first()->alamat;
}

function PTTelepon(){
	return \App\Identitaspt::first()->telepon;
}

function PTEmail(){
	return \App\Identitaspt::first()->email;
}

//Generate Token untuk aplikan pertama kali daftar / download brosur
function aplikanToken()
{
	for ($i=0; $i < 100; $i++) { 
		$token =  str_random(32);

		if(\App\Aplikan::whereToken($token)->count() == 0){
			return $token;
		}

		break;
	}
	
}

// Menentukan tahun akademik yg sekarang
// return object tahun akademik
function TASekarang()
{
	$tahunAkademikId =  \App\Setting::whereName('TA_aktif')->first()->value;

	return \App\Tahunakademik::find($tahunAkademikId);
	// $tahunAkademik = \App\Tahunakademik::all();

	// foreach ($tahunAkademik as $ta) {
	// 	$mulai = \Carbon\Carbon::createFromFormat('Y-m-d',$ta->tanggal_mulai);
	// 	$akhir = \Carbon\Carbon::createFromFormat('Y-m-d',$ta->tanggal_akhir);
	// 	if(\Carbon\Carbon::now()->between($mulai,$akhir)){
	// 		return $ta;
	// 	}
	// }
}

function semesterG($semester = NULL){
	if($semester){
		return ($semester % 2 == 0) ? 'genap' : 'ganjil';
	}
	return (semesterAktif() % 2 == 0) ? 'genap' : 'ganjil';
}

//mengembalikan nilai semester menjadi 1 atau 2
function semester1Or2($semester){
	return ($semester % 2 == 0) ? 2 : 1;
}

function kurikulumAktif(){
	return \App\Setting::whereName('kurikulum_aktif')->first()->value;	
}

function semesterAktif(){
	return \App\Setting::whereName('semester_aktif')->first()->value;	
}

function emailPengirim()
{
	return \App\Setting::whereName('email_from')->first()->value;
}

function penerimaNotifikasi()
{
	return \App\Setting::whereName('penerima_notifikasi')->first()->value;
}

function isActiveMenu($route){
	if(Route::currentRouteName() == $route){
		return 'class=active';
	}
}

function JumlahAplikanTotal()
{
	return \App\Aplikan::whereStatusAplikanId(2)->count();
}

function JumlahProsesRegistrasiTotal()
{
	return \App\Aplikan::whereStatusAplikanId(3)->count();
}

function JumlahMahasiswaAktif()
{
	return \App\Mahasiswa::whereStatusMahasiswaId(2)->count();
}

function JumlahMahasiswaLulus()
{
	return \App\Mahasiswa::whereStatusMahasiswaId(5)->count();
}

function hariList()
{
	return [
		'Senin' => 'Senin',
		'Selasa' => 'Selasa',
		'Rabu' => 'Rabu',
		'Kamis' => 'Kamis',
		'Jumat' => 'Jumat',
		'Sabtu' => 'Sabtu',
		'Minggu' => 'Minggu'
	];
}

function jumlahKonfirmasiPembayaran($status = 'Terkirim'){
	return \App\Konfirmasipembayaran::whereStatus($status)->count();
}

function nilaiHuruf($nilai){
	if($nilai >= 80){
		return 'A';
	}

	if($nilai < 80 AND $nilai >= 70){
		return 'B';
	}

	if($nilai < 70 AND $nilai >= 60){
		return 'C';
	}
	if($nilai < 60 AND $nilai >= 50){
		return 'D';
	}
	if($nilai < 50){
		return 'E';
	}
}

function nilaiAngka($nilai){
	if($nilai >= 80){
		return 4;
	}

	if($nilai < 80 AND $nilai >= 70){
		return 3;
	}

	if($nilai < 70 AND $nilai >= 60){
		return 2;
	}
	if($nilai < 60 AND $nilai >= 50){
		return 1;
	}
	if($nilai < 50){
		return 0;
	}
}

function wilayah($idvillage){
	$wilayah =  \DB::table('villages')
            ->join('districts', 'districts.id', '=', 'villages.district_id')
            ->join('regencies', 'regencies.id', '=', 'districts.regency_id')
            ->join('provinces', 'provinces.id', '=', 'regencies.province_id')
            ->select('villages.id', 'villages.name as kelurahan','districts.name as kecamatan','regencies.name as kabupaten','provinces.name as provinsi')
            ->where('villages.id','=',$idvillage)
            ->first();
    return $wilayah->kelurahan.' '.$wilayah->kecamatan.' '.$wilayah->kabupaten.' '.$wilayah->provinsi;
}

function collections($type_id= 0,$limit = 12)
{
	if($type_id == 0){
		return \App\Collection::orderBy('created_at','desc')->limit($limit)->get();		
	}
	return \App\Collection::whereTypeId($type_id)->orderBy('created_at','desc')->limit($limit)->get();
}






		