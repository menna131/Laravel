<?php

namespace App\traits;

trait generalTrait {
    // 3mlna trait..3shann dh hytkrr f ay form tb2a fyha photo
    // $image..dh li kant $request
    // $folder...3shan lw b3ml photo li user
    public function uploadPhoto($image, $folder)
    {
        // photo's logic
            // 1) rename the photo
            // return($image);//die;
        $imageName = time(). '.' . $image->extension();
            // 2) save photo on server
        $image->move(public_path('uploads/'.$folder), $imageName);
        return $imageName;
    }
}



?>