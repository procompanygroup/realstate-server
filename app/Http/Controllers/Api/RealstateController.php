<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class RealstateController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }
    public function getAllStates()
    {
        //
        $List = DB::table("realstates")
            ->select( 'id', 'name',
            'desc',
            'realmodel',
            'periodtime',
           // 'price',
          //  'location',
           // 'owner',
           // 'userid',
            'image',
    
            'isFavorite',)
            ->get();
       
        return response()->json([
            'list' =>  $List
          ]);
    }
    public function getStatesbyId()
    {
        //
        $formdata = request(['id']);
if(isset($formdata["id"])){


        $item = DB::table("realstates")
        ->where('id',$formdata["id"])
            ->select( 'id', 'name',
            'desc',
            'realmodel',
            'periodtime',
           'price',
           'location',
           'owner',
           'userid',
            'image',
    
            'isFavorite',)
            ->get();
       
        return response()->json([
            'iteminfo' =>  $item 
          ]);
        }else{
            return response()->json([
                'error' =>  "no id"
              ]); 
        }
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
