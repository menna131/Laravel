<?php

namespace App\Http\Controllers\admin\product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
// awl use ll trait (1/2)
use App\traits\generalTrait;

class productController extends Controller
{
    // tani use ll trait (2/2)
    use generalTrait;
    public function index(){
        $products = DB::table('products')->select('products.*')->get();
        // $products = DB::select('SELECT `products`.* FROM `products`');
        return view('en.admin.products.all', compact('products'));
    }

    public function edit($id){
        $product = db::table('products')->select('products.*')->where('products.id', '=', $id)->first();
        $brands = db::table('brands')->select('brands.id', 'brands.name')->get();
        $suppliers = db::table('suppliers')->select('suppliers.id', 'suppliers.name')->get();
        $subs = db::table('subcategorys')->select('subcategorys.id', 'subcategorys.name')->get();
        return view('en.admin.products.edit', compact('product', 'brands', 'suppliers', 'subs'));
    }

    public function create(){
        $brands = db::table('brands')->select('brands.id', 'brands.name')->get();
        $suppliers = db::table('suppliers')->select('suppliers.id', 'suppliers.name')->get();
        $subs = db::table('subcategorys')->select('subcategorys.id', 'subcategorys.name')->get();
        return view('en.admin.products.create', compact('brands', 'suppliers', 'subs'));
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
            "photo"          => "required|image|mimes:jpg,png,jpeg|max:1024"// KBytes
        ];
        $request->validate($rules);
        // photo's logic ..... mnl generalTrait li fl app/traits
        $imageName = $this->uploadPhoto($request->photo, 'products');
        // b3diin n3araf l array li hnro7 n-insertaha...mnl request...ma3ada l _token wl photo
        $data = $request->except('_token', 'photo');
        // azawd l photo 3la l array
        $data['photo'] = $imageName; // appendinggggg fl $data array
        $check = DB::table('products')->insert($data);
        return redirect('admin/product/all-products');
    }

    public function update(Request $request, $id)
    {
        $rules =[
            "name_en"        => "required|string|min:2",
            "name_ar"        => "required|string|min:2",
            "price"          => "required|numeric|min:1",
            "supplier_id"    => "required|integer|exists:suppliers,id",
            "brand_id"       => "required|integer|exists:brands,id",
            "subcategory_id" => "required|integer|exists:subcategorys,id",
            "photo"          => "image|mimes:jpg,png,jpeg|max:1024"// KBytes
        ];
        $request->validate($rules);
        // return $request;
        // ngahz l data 3shan ab3tha
        $data = $request->except('_token', '_method');
        if($request->photo){
            $imageName = $this->uploadPhoto($request->photo, 'products');
            $data = $request->except('_token', '_method', 'photo');
            $data['photo'] = $imageName;
        }
        // insert
        $check = DB::table('products')->where('id', '=', $id)->update($data);
        if($check){
            return redirect()->back()->with('Success', 'Product has been inserted successfully');
        }else{
            return redirect()->back()->with('Error', 'Something went wrong');
        }
    }

    public function delete(Request $request)
    {
        $rules = [
            "id"=>"required|exists:products,id|integer"
        ];
        $request->validate($rules);
        $photoPath = public_path('uploads\products\\'.$request->photo);
        if(file_exists($photoPath)){
            unlink($photoPath);
        }
        $check = DB::table('products')->where('id', '=', $request->id)->delete();
        if($check){
            return redirect()->back()->with('Success', 'Product has been deleted successfully');
        }else{
            return redirect()->back()->with('Error', 'Something went wrong');
        }
    }

}
