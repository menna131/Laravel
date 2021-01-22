@extends('en.admin.template.layout')
@section('title', 'Add Product')

@section('links')
@endsection

@section('content')
<div class="col-12">
    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">Add Product</h3>
        </div>
        <form method="POST" action="{{asset('admin/product/create')}}" enctype="multipart/form-data">
            @csrf
            {{-- tare2a ngib byha l errors --}}
            {{-- @if ($errors->any()) 
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif --}} 
            <div class="card-body">
                <div class="form-group">
                    <input type="file" name="photo" class="form-control" id="exampleInputEmail1">
                    @error('photo')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="name_ar">Name_AR</label>
                    <input type="text" name="name_ar" class="form-control" id="name_ar" placeholder="Enter name in Aarabic" value="{{old('name_ar')}}">
                    @error('name_ar')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="name_en">Name_En</label>
                    <input type="text" name="name_en" class="form-control" id="name_en" placeholder="Enter name in English" value="{{old('name_en')}}">
                    @error('name_en')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="">Details_Ar</label>
                    <textarea name="details_ar" class="form-control" cols="20" rows="5" placeholder="Enter Details in Arabic">{{old('details_ar')}}</textarea>
                </div>
                <div class="form-group">
                    <label for="">Details_En</label>
                    <textarea name="details_en" class="form-control" cols="20" rows="5" placeholder="Enter Details in English">{{old('details_en')}}</textarea>
                </div>
                <div class="form-group">
                    <label for="name_ar">Price</label>
                    <input type="number" name="price" class="form-control" id="name_ar" placeholder="Enter price" value="{{old('price')}}">
                    @error('price')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="">Brands</label>
                    <select name="brand_id" class="form-control">
                        @foreach($brands as $key=>$value)
                            <option {{old('brand_id') == $value->id ? 'selected' : ''}}  value="{{$value->id}}">{{$value->name}}</option>
                        @endforeach
                    </select>
                    @error('brand_id')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="">Suppliers</label>
                    <select name="supplier_id" class="form-control">
                        @foreach($suppliers as $key=>$value)
                            <option {{old('supplier_id') == $value->id ? 'selected' : ''}} value="{{$value->id}}">{{$value->name}}</option>
                        @endforeach
                    </select>
                    @error('supplier_id')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="">SubCategories</label>
                    <select name="subcategory_id" class="form-control">
                        @foreach($subs as $key=>$value)
                            <option {{old('subcategory_id') == $value->id ? 'selected' : ''}} value="{{$value->id}}">{{$value->name}}</option>
                        @endforeach
                    </select>
                    @error('subcategory_id')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
            </div>
            <div class="card-footer">
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
    </div>
</div>
@endsection

@section('scripts')
@endsection