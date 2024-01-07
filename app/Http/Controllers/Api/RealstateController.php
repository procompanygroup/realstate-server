<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Api\Realstate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; 
use File;
use Illuminate\Support\Carbon;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;

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
            ->select(
                'id',
                'name',
                'desc',
                'realmodel',
                'periodtime',
                // 'price',
                //  'location',
                // 'owner',
                // 'userid',
                'image',

                'isFavorite',
            )
            ->get();

        return response()->json([
            'list' => $List
        ]);
    }
    public function getStatesbyId()
    {
        //
        $formdata = request(['id']);
        if (isset($formdata["id"])) {


            $item = DB::table("realstates")
                ->where('id', $formdata["id"])
                ->select(
                    'id',
                    'name',
                    'desc',
                    'realmodel',
                    'periodtime',
                    'price',
                    'location',
                    'owner',
                    'userid',
                    'image',

                    'isFavorite',
                )
                ->get();

            return response()->json([
                'iteminfo' => $item
            ]);
        } else {
            return response()->json([
                'error' => "no id"
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
    public function storeImage(Request $filerequest)
    {

        // $formdata = request(['id']);

        $formdata = $filerequest->all();
        $id = $formdata["id"];
        $imagemodel = Realstate::find($id);

        $path = 'media';
        $separator = '/';
        // $user->photo ="image.jpg";   

        //save photo
        if ($filerequest->hasFile('image')) {
            // $imagemodel->save();
            $image_tmp = $filerequest->file('image');
            if ($image_tmp->isValid()) {
                $folderpath = $path . $separator;
                //Get image Extension
                $extension = $image_tmp->getClientOriginalExtension();
                //Generate new Image Name
                //Hash::make($request->password),
                $now = Carbon::now();
                $imageName = rand(10000, 99999) . $imagemodel->id . '.' . $extension;

                if (!File::isDirectory($folderpath)) {
                    File::makeDirectory($folderpath, 0777, true, true);
                }
                $imagePath = $folderpath . $separator . $imageName;
                //Upload the Image
                $manager = new ImageManager(new Driver());

// read image from filesystem
$image = $manager->read($image_tmp);
//$image= $image->toWebp(75);
$image->save($imagePath);
            // Image::read($image_tmp)->save($imagePath);
                //   $imagemodel->image = $imagePath;
                Realstate::find($id)->update([
                    "image" => $imagePath
                ]);
                //  $imagemodel->save();
            }
        }
        return response()->json([
            'message' => "success"
        ]);



    }
}
