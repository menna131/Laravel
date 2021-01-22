<?php

namespace App\Http\Controllers\api\product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\models\Product;
use Illuminate\Support\Facades\Validator;
use App\traits\generalTrait;

class productController extends Controller
{
    use generalTrait;
    public function index()
    {
        // $products = Product::all();
        // $products = Product::paginate(4);
        $products = Product::select('id', 'name_en', 'name_ar', 'details_en', 'details_ar', 'price', 'photo')->paginate(4);
        return response()->json([$products], 200);
    }

    public function store(Request $request)
    {
        $rules =[
            "name_en"        => "required|unique:products,name_en|string|min:2",
            "name_ar"        => "required|unique:products,name_ar|string|min:2",
            "price"          => "required|numeric|min:1",
            "supplier_id"    => "required|integer|exists:suppliers,id",
            "brand_id"       => "required|integer|exists:brands,id",
            "subcategory_id" => "required|integer|exists:subcategorys,id",
            "photo"          => "required|image|mimes:jpg,jpeg,png|max:1024"// KBytes
        ];
        // at2kd mnl data...b-validator 2na h3milo
        $validator = Validator::make($request->all(), $rules);
        // return $request;
        if ($validator->fails()) {
            $errors = $validator->errors();
            return $errors;
            // foreach ($errors->all() as $message=>$value) {
            //     echo $value;
            // }
        }
        return $request->all();
        $imageName = $this->uploadPhoto($request->photo, 'products');
        // return $request;
        $data = $request->except('photo');
        $data['photo'] = $imageName;

        // insert fl db
        Product::insert($data);

        //w 3shan dh api...hn3milo return gamiiiiiil
        return response()->json(['success'=>true,'message'=>'The product is successfully inserted'], 200);
    }

    

    public function update(Request $request)
    {
        // l data fl $request...check 3liha
        $rules=[
            "name_en"        => "required|string|min:2",
            "name_ar"        => "required|string|min:2",
            "price"          => "required|numeric|min:1",
            "supplier_id"    => "required|integer|exists:suppliers,id",
            "brand_id"       => "required|integer|exists:brands,id",
            "subcategory_id" => "required|integer|exists:subcategorys,id",
            "photo"          => "image|mimes:jpg,jpeg,png|max:1024"// KBytes
        ];

        // validation
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            $errors = $validator->errors();
            return $errors;
        }
        $data = $request->except('id');
        if($request->photo){
            $data = $request->except('id','photo');
            $imageName = $this->uploadPhoto($request->photo, 'products');
            $data['photo'] = $imageName;
        }
        Product::where('id', '=', $request->id)->update($data);
        return response()->json(['success'=>true, 'message'=>'The product has been updated successfully'], 200);
    }

    public function delete(Request $request)
    {
        // l id bs li h5do
        // n-delete l image mnl folder
            //ngib esm l image mnl table bl id
        //    return $request->id;
        $rules =[
            "id"=> "required|exists:products,id|integer",
        ];
        $validator = Validator::make($request->all(), $rules);
        if($validator->fails()){
            $errors = $validator->errors();
            return $errors;
        }
        $product = Product::find($request->id);
        // return $product;
        // delete the image
        $photoPath = public_path("uploads\products\\".$product->photo);
        if(file_exists($photoPath)){
            unlink($photoPath);
            // return "tmaam";
        }
        Product::destroy($request->id);
        return response()->json(['success'=>true, 'message'=>'The product is deleted successfully'], 200);
    }
}
