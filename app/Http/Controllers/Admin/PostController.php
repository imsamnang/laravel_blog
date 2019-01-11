<?php

namespace App\Http\Controllers\Admin;
use App\Category;
use App\Notifications\AuthorPostApproved;
use App\Notifications\NewPostNotify;
use App\Subscriber;
use App\Tag;
use App\Post;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

ini_set('memory_limit', '3000M');
ini_set('max_execution_time', '0');
class PostController extends Controller
{
    public function index()
    {
        $posts = Post::latest()->get();
        return view('admin.post.index',compact('posts'));
    }

    public function create()
    {
        $categories = Category::all();
        $tags = Tag::all();
        return view('admin.post.create',compact('categories','tags'));
    }

    public function store(Request $request)
    {
        $this->validate($request,[
           'title' => 'required',
           'image' => 'required',
           'categories' => 'required',
            'tags' => 'required',
            'body' => 'required'
        ]);
        $image = $request->file('image');
        $slug = str_slug($request->title);
        if(isset($image)){
//            make unique ame for image
            $currentDate = Carbon::now()->toDateString();
            $imagename = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();
            if(!Storage::disk('public')->exists('post'))
            {
                Storage::disk('public')->makeDirectory('post');
            }
            $postimage = Image::make($image)->resize(1600,1066)->stream();
            Storage::disk('public')->put('post/'.$imagename,$postimage);
        } else {
            $imagename = "default.png";
        }
        $post = new Post();
        $post->title = $request->title;
        $post->user_id =Auth::id();
        $post->slug = $slug;
        $post->image = $imagename;
        $post->body = $request->body;
        if(isset($request->status))
        {
            $post->status = true;
        } else {
            $post->status = false;
        }
        $post->is_approved = true;
        $post->save();

        $post->categories()->attach($request->categories);
        $post->tags()->attach($request->tags);
        
        $subscribers = Subscriber::all();
        foreach ($subscribers as $subscriber)
        {
            Notification::route('mail',$subscriber->email)
                ->notify(new NewPostNotify($post));
        }
        Toastr::success('Post Successfully Save:)','Success');
        return redirect()->route('admin.post.index');
    }

    public function show(Post $post)
    {
        return view('admin.post.show',compact('post'));
    }

    public function edit(Post $post)
    {
        $categories = Category::all();
        $tags = Tag::all();
        return view('admin.post.edit',compact('post','categories','tags'));
    }

    public function update(Request $request, Post $post)
    {
        $this->validate($request,[
            'title' => 'required',
            'image' => 'required',
            'categories' => 'required',
            'tags' => 'required',
            'body' => 'required'
        ]);
        $image = $request->file('image');
        $slug = str_slug($request->title);
        if(isset($image)){
//            make unique ame for image
            $currentDate = Carbon::now()->toDateString();
            $imagename = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();
            if(!Storage::disk('public')->exists('post'))
            {
                Storage::disk('public')->makeDirectory('post');
            }
//           Delete old Post image
            if(Storage::disk('public')->exists('post/'.$post->image))
            {
                Storage::disk('public')->delete('post/'.$post->image);
            }
            $postimage = Image::make($image)->resize(1600,1066)->stream();
            Storage::disk('public')->put('post/'.$imagename,$postimage);
        } else {
            $imagename = $post->image;
        }
        $post->user_id =Auth::id();
        $post->title = $request->title;
        $post->slug = $slug;
        $post->image = $imagename;
        $post->body = $request->body;
        if(isset($request->status))
        {
            $post->status = true;
        } else {
            $post->status = false;
        }
        $post->is_approved = true;
        $post->save();

        $post->categories()->sync($request->categories);
        $post->tags()->sync($request->tags);
        Toastr::success('Post Successfully Updated:)','Success');
        return redirect()->route('admin.post.index');
    }

    public function pending()
    {
        $posts = Post::where('is_approved',false)->get();
        return view('admin.post.pending',compact('posts'));
    }

    public function approval($id)
    {
        $post = Post::find($id);
        if ($post->is_approved == false)
        {
            $post->is_approved = true;
            $post->save();
            $post->user->notify(new AuthorPostApproved($post));
            $subscribers = Subscriber::all();
            foreach ($subscribers as $subscriber)
            {
                Notification::route('mail',$subscriber->email)
                    ->notify(new NewPostNotify($post));
            }
            Toastr::success('Post Successfully Approved :)','Success');
        } else {
            Toastr::info('This Post is already approved','Info');
        }
        return redirect()->back();
    }

    public function destroy(Post $post)
    {
        if(Storage::disk('public')->exists('post/'.$post->image))
        {
            Storage::disk('public')->delete('post/'.$post->image);
        }
        $post->categories()->detach();
        $post->tags()->detach();
        $post->delete();
        Toastr::success('Post Successfully Deleted',"Success");
        return redirect()->back();
//        return view('admin.post.index',compact('post'));
    }
}
