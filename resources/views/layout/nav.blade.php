<div class="blog-masthead">
    <div class="container">
        <form action="/posts/search" method="GET">
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <a class="blog-nav-item " href="/posts">首页</a>
                </li>
                <li>
                    <a class="blog-nav-item" href="/posts/create">写文章</a>
                </li>
                <li>
                    <a class="blog-nav-item" href="/notices">通知</a>
                </li>
                <li>
                    <input name="query" type="text" value="" class="form-control" style="margin-top:10px"
                           placeholder="搜索词">
                </li>
                <li>
                    <button class="btn btn-default" style="margin-top:10px" type="submit">Go!</button>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <div>
                        <img src="http://images.love-wendy.top/2019/06/1ef2b2cd05760ced45447bc97fb8f510803.png" alt="" class="img-rounded" style="border-radius:500px; height: 30px">
                        <a href="#" class="blog-nav-item dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">
                            {{Auth::user()->name}}
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/user/{{Auth::id()}}">我的主页</a></li>
                            <li><a href="/user/{{Auth::id()}}/setting">个人设置</a></li>
                            <li><a href="/logout">登出</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </form>
    </div>
</div>