@extends("layout.main")
@section("content")
    <div class="col-sm-8 blog-main">
        @include('layout.error')
        <form action="/posts" method="POST">
            {{csrf_field()}}
            <div class="form-group">
                <label for="title">标题</label>
                <input id="title" name="title" type="text" class="form-control" placeholder="这里是标题">
            </div>
            <div class="form-group">
                <label for="content">内容</label>
                <textarea id="content" style="height:400px;max-height:500px;" name="content" class="form-control"
                          placeholder="这里是内容"></textarea>
            </div>
            <button type="submit" class="btn btn-default">提交</button>
        </form>
        <br>
    </div><!-- /.blog-main -->
@endsection
