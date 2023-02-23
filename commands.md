```bash
rake db:setup
rails generate migration CreateUser name:string photo:string bio:text posts_counter:integer
rails generate migration CreatePost title:string text:text comments_counter:integer likes_counter:integer
rails generate migration CreateLike
rails generate migration CreateComment text:text
rails db:migrate

rails generate migration AddUserRefToPost author_id:integer:index   // don't forget to go and add a foreign key to the newly created migrate file 
rails generate migration AddUserRefToLike author_id:integer:index   // // again foreign key sth like: add_foreign_key :likes, :users, column: :author_id 
rails generate migration AddUserRefToComment author_id:integer:index // again foreign key sth like: add_foreign_key :comments, :users, column: author_id
rails db:migrate

rails generate migration AddPostRefToLike post_id:integer:index
rails generate migration AddPostRefToComment post_id:integer:index
rails db:migrate
```

```bash
rails generate model User name:string photo:string bio:text posts_counter:integer    // go ahead and set associations for the model, delete the new migration file  
rails generate model Post title:string text:text comments_counter:integer likes_counter:integer   // set associations for the model, delete the new migration file
rails generate model Like   // set associations for the model; that's very important in connecting the tables with each other (check commit link below to see example) 
rails generate model Comment text:text   // delete the new migration file because, migrate command create tables based on these models which raises error since they are already created 
```

commit ![link](hhttps://github.com/amexabee/blog-app/pull/2/commits/a7bb33dff069017a38d4de7cf161435411d2c9ef)
