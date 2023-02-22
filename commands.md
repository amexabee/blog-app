```bash
rake db:setup
rails generate migration CreateUser name:string photo:string bio:text posts_counter:integer
rails generate migration CreatePost title:string text:text comments_counter:integer likes_counter:integer
rails generate migration CreateLike
rails generate migration CreateComment text:text
rails db:migrate

rails generate migration AddUserRefToPost author_id:integer:index
rails generate migration AddUserRefToLike author_id:integer:index
rails generate migration AddUserRefToComment author_id:integer:index
rails db:migrate

rails generate migration AddPostRefToLike post_id:integer:index
rails generate migration AddPostRefToComment post_id:integer:index
rails db:migrate
```
