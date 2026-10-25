<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Message;


class MessageController extends Controller
{
    function save(Request $request){
		
		$newmessage = $request->validate([
          'name' => ['required', 'max:50'],
          'email' => ['required', 'max:50','email'],
          'subject' => ['required', 'max:50'],
          'content' => ['required', 'max:50'],
        ]);
		$newmessage['mobile'] = 'mobile here';
		$newmessage['status'] = 1;
		$newmessage['seen'] = 0;
		Message::create($newmessage);

        return to_route('home');
	}
}
