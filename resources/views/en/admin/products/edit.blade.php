@extends('en.admin.template.layout')
@section('title', 'Edit Product')

@section('links')
@endsection

@section('content')
<div class="col-12">
    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">Edite Product</h3>
        </div>
        <form method="POST" action="{{asset('admin/product/update-product/'.$product->id)}}" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            {{-- check the session --}}
            @if(Session()->has('Success'))
                <div class="laert alert-success"> {{Session()->get('Success')}} </div>
                {{-- distroy session --}}
                @php
                    Session()->forget('Success');
                @endphp
            @endif
            @if(Session()->has('Error'))
                <div class="laert alert-danger"> {{Session()->get('Error')}} </div>
                {{-- distroy session --}}
                @php
                    Session()->forget('Error');
                @endphp
            @endif
            <div class="card-body">
                <div class="form-group">
                    <img src="{{ asset('uploads/products/'.$product->photo) }}">
                    <input type="file" name="photo" class="form-control" id="exampleInputEmail1">
                    @error('photo')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="name_ar">Name_AR</label>
                    <input type="text" name="name_ar" class="form-control" id="name_ar" placeholder="Enter name" value="{{$product->name_ar}}">
                    @error('name_ar')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="name_en">Name_En</label>
                    <input type="text" name="name_en" class="form-control" id="name_en" placeholder="Enter name" value="{{$product->name_en}}">
                    @error('name_en')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="">Details_Ar</label>
                    <textarea name="details_ar" class="form-control" cols="20" rows="5">{{$product->details_ar}}</textarea>
                </div>
                <div class="form-group">
                    <label for="">Details_En</label>
                    <textarea name="details_en" class="form-control" cols="20" rows="5">{{$product->details_en}}</textarea>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="text" name="price" class="form-control" id="price" placeholder="Enter price" value="{{$product->price}}">
                    @error('price')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
                <div class="form-group">
                    <label for="">Brands</label>
                    <select name="brand_id" class="form-control">
                        @foreach($brands as $key=>$value)
                            <option @php echo( ($product->brand_id == $value->id) ? 'selected' : '' ); @endphp value="{{$value->id}}">{{$value->name}}</option>
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
                            <option @php echo( ($product->supplier_id == $value->id) ? 'selected' : '' ); @endphp value="{{$value->id}}">{{$value->name}}</option>
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
                            <option @php echo( ($product->subcategory_id == $value->id) ? 'selected' : '' ); @endphp value="{{$value->id}}">{{$value->name}}</option>
                        @endforeach
                    </select>
                    @error('subcategory_id')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>
            </div>
            <div class="card-footer">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    </div>
</div>
@endsection

@section('scripts')
@endsection