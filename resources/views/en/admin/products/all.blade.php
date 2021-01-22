@extends('en.admin.template.layout')
@section('title', 'All Products')

@section('links')
<!-- DataTables -->
<link rel="stylesheet" href="{{asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
<link rel="stylesheet" href="{{asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">
<link rel="stylesheet" href="{{asset('plugins/datatables-buttons/css/buttons.bootstrap4.min.css')}}">
@endsection

@section('content')
<div class="col-12">
    @if(Session()->has('Success'))
                <div class="laert alert-success"> {{Session()->get('Success')}} </div>
                {{-- distroy session --}}
                @php
                    Session()->forget('Success');
                @endphp
            @endif
    <table id="example1" class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Details</th>
                <th>price</th>
                <th>Actions</th>
                {{-- @forelse ($products as $key=>$value)
                    @foreach($value as $key2=>$value2)
                        <td>{{$key2}}</td>
                    @endforeach
                @empty
                
                @endforelse   --}}

            </tr>
        </thead>
        @forelse ($products as $key=>$value)
            <tbody>
            <tr>
                <td>{{$value->id}}</td>
                <td>{{$value->name_en}}</td>
                <td>
                    @php
                        $wordsCount = 20;
                        $detailsArray = str_word_count($value->details_en, 1);
                        array_splice($detailsArray, $wordsCount, count($detailsArray));
                        $detailsArray = implode(" ", $detailsArray);
                        echo $detailsArray. ' ...';
                    @endphp
                </td>
                <td>{{$value->price}}</td>
                <td class="w-0">
                    <div class="row">
                        <div class="col-3">
                            <a class="btn btn-warning" href="{{asset('admin/product/edit-product/'.$value->id)}}">Edit</a>
                        </div>
                        {{-- <a class="btn btn-danger" href="{{asset('admin/product/edit-product/'.$value->id)}}">Delete</a> --}}
                        <div class="col-3">
                            <form method="post" action="{{asset('admin/product/delete')}}">
                                @csrf
                                @method('DELETE')
                                <input name="id" value="{{$value->id}}" type="hidden">
                                <input name="photo" value="{{$value->photo}}" type="hidden">
                                <button class="btn btn-danger">Delete</button>
                            </form>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
        @empty
            <div class="alert aert-warning">No Prooducts</div>
        @endforelse  
        
        <tfoot>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Details</th>
                <th>price</th>
                <th>Actions</th>
            </tr>
        </tfoot>
    </table>
</div>
@endsection

@section('scripts')
<!-- DataTables  & Plugins -->
<script src="{{asset('plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
<script src="{{asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.bootstrap4.min.js')}}"></script>
<script src="{{asset('plugins/jszip/jszip.min.js')}}"></script>
<script src="{{asset('plugins/pdfmake/pdfmake.min.js')}}"></script>
<script src="{{asset('plugins/pdfmake/vfs_fonts.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>
<script src="{{asset('plugins/datatables-buttons/js/buttons.colVis.min.js')}}"></script>
<script>
    $(function() {
        $("#example1").DataTable({
            "responsive": true,
            "lengthChange": false,
            "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        // $('#example2').DataTable({
        //   "paging": true,
        //   "lengthChange": false,
        //   "searching": false,
        //   "ordering": true,
        //   "info": true,
        //   "autoWidth": false,
        //   "responsive": true,
        // });
    });
</script>
@endsection