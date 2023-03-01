```bash
rake db:setup
rails generate migration CreateUser name:string photo:string bio:text posts_counter:integer
rails generate migration CreatePost title:string text:text comments_counter:integer likes_counter:integer
rails generate migration CreateLike
rails generate migration CreateComment text:text
rails db:migrate

rails generate migration AddUserRefToPost author_id:integer:index       # don't forget to add a foreign key to the newly created migrate file 
rails generate migration AddUserRefToLike author_id:integer:index       # again foreign key sth like: add_foreign_key :likes, :users, column: :author_id 
rails generate migration AddUserRefToComment author_id:integer:index    # again foreign key sth like: add_foreign_key :comments, :users, column: author_id
rails db:migrate

rails generate migration AddPostRefToLike post_id:integer:index        # don't forget foreign key
rails generate migration AddPostRefToComment post_id:integer:index     # don't forget foreign key
rails db:migrate
```

```bash
rails generate model User name:string photo:string bio:text posts_counter:integer    # go ahead and set associations for the model, delete the new migration file  
rails generate model Post title:string text:text comments_counter:integer likes_counter:integer   # set associations for the model, delete the new migration file
rails generate model Like   # set associations for the model; that's very important in connecting the tables with each other (check commit link below to see example) 
rails generate model Comment text:text   # delete the new migration file because, migrate command create tables based on these models which raises error since they are already created 
```

[commit link for associations](https://github.com/amexabee/blog-app/pull/2/commits/a7bb33dff069017a38d4de7cf161435411d2c9ef)

```bash
rails generate controller Users index show  # change the default route logic to resources ... and also add logic in the index and show methods (check commit link)
rails generate controller Posts index show  # change the default route logic to a nested one inside user and also add logic in the index and show methods (link below)
```
[commit link for the logic of index and show methods](https://github.com/amexabee/blog-app/pull/4/commits/931f585bec4a9adbcdb6da8a09788c0e36d8634c)
