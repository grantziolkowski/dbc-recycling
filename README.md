## Active Record Migrations and Models

Now that you have your schema, create a real live database with the tables!

**1) Use the provided rake tasks to generate migrations and models for your tables.**

```bash
$ bundle exec rake generate:migration NAME=create_your_table_name
$ bundle exec rake generate:model NAME=YourModelName
```

**2) Write your Active Record migrations to align with the schema you designed.**

Think about whether you should add constraints to any of your columns. Try to add at least two different types of constraints.

Once you have written your migrations, make sure that you can successfully (without errors) run:

```bash
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

**3) Test that your models can successfully save to and access the database.**

Drop into a console session using the following rake task:

```bash
$ bundle exec rake console
```

You should at least be able to create a new coat or store by typing `Coat.create` or `Store.create` and passing it some arguments. Cut and paste the commands that you ran in your rake console session into the `ar-queries.txt` file in the root directory of this challenge even if your commands don't work. You can always explain what you expected the commands to return during your review even if they didn't work at the time.

**4) STRETCH (optional): add model associations and validations.**

- Link up your models based on the relationships in your schema using Active Record associations.
- Add Active Record validations to the models based on any constraints that put on your columns in your migrations.
- Test the associations and validations in the console like in step 3) and paste your commands into `ar-queries.txt`.

**5) BONUS POINTS (optional): SQL equivlants**

If you have time to spare, type out how you would have used SQLite3 to create the same tables as in your migrations. Convert as many of your queries (that you tested in your rake console sessions) to SQL as you can. Add these SQL queries to your `ar-queries.txt` file.
