== Rails Simple CMS

This is a starting point to make any kind of simple rails websites. As there isnt a really nice platform to make inline editing in rails application in a nice way, this comes very handy, and it is benefitting from the new html5 editable components.

It includes:

* Inplace editing of anything with CKEditor
* User management with devise
* Permission system with cancan
* Admin panel with Active Admin
* bootstrap, sass, compass, coffeescript, slim
* simple_form s
* paperclip, aws
* ruby 2, rails 4

![screenshot](https://www.evernote.com/shard/s128/sh/44039a21-8c29-40e0-9074-4dff0fa9d2f1/ba1bdafb7636d94d543372bedfcd5492/res/593c97e1-06e5-4d12-9fd1-2f9d25442e98/skitch.png)

After setting up users, just open yoursite/login and login with your account. then browse any page of the website and the yellow admin toolbox will appear. by clicking on the edit button you can edit every part of the website just in place and see how does it look like. no more need to use weird admin backends for content editing.

to make something editable there are 3 helpers located in ApplicationHelper:

*st* is a static text. for example a navigation item which goes to contact page can be written as:
```
in the view.slim

= st 'Contact Us'
```
The given 'Contact Us' will be used as the initial text, and then it will be editable and stored in database as user wishes.

```
def st(key, type=:string, editor=:normal, &block)


= st :index_str                         #editable without wysiwyg
= st :index_main_txt, :text, :minimal   #editable with a minimal wysiwyg
= st :index_main_txt, :text, :normal    #editable with a normal wysiwyg
= st :index_main_txt, :text, :full      #editable with a fully featured wysiwyg
```


and 2 more helpers:

```
  def editable_root resource

  def editable resource, field, editor_type=:string, editor=nil

for example in view.slim

= editable_root film do
  .div= editable film, :director, :string
  .div= editable film, :reviews, :text
```

that's quite it. I would like to make the inline editor into a rails engine but that would take some time.
