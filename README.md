![](http://bitbybit.co/wp-content/uploads/2014/11/gaflatlogo.png)

# `WDI JAZZ RECORDS` Lab

![](http://bmtmedia.org/wp-content/uploads/2012/02/jamsession-clipart.jpeg)

## Introduction

Our client, the infamous `WDI Jazz Records` company has a rapidly growing business and reach out to you. They have just signed the highest rating Jazz artists in history and need urgently a website to sell those albums.

As part of their licensing purchase, they received a `CSV (Comma-separated Values)` file  from their business partner. This contains 3615 of the [best rated Jazz albums](http://people.ucalgary.ca/~ghfick/jazz.html) in history and they want to make money, time is ticking!

## Objective

Your mission, should you choose to accept it, would be to:

- Create all the different models to store this data
- Implement all the relationships between the models
- Import all the data from the CSV file

### Data Model

The given `db/seeds.csv` file contains the following information:

Fields |musician|album|label| edition| crown| core| best_1001
----|----|----|----|----|----|----|----|----|
**Description** | Artist | Album | Record Label | Album edition | Album in the crown of jazz? | Is it a core album? | Album part of the 1001 Best Jazz Albums?
**Data Types** | String|String|String|Integer|Boolean|Boolean|Boolean
**Example** | Armstrong, Louis|Young LA 30-33|RCA|3|No|No|No

You will have to create separate models for `Artists`, `Albums`, and `RecordLabels` and decide which column should be store in which model.

The client would also like some validations to be added to the different fields to ensure their database doesn't get corrupted. Think about what restrictions you would like to add!

When you are done, please make sure you create a `commit` with the appropiate models.

### Model Relationships

After you create the basic models, you should model the relationships between them:

- Every `Artist` should have a unique entry in the `Artists` model (No duplicates!)
- Every `Artist` may have one, or many, `Albums`
- Every `Album` may belong to only one `Artist`
- Every `Album` may belong to only one `RecordLabel`
- Every `Artist` may belong to one or many `RecordLabel`s, through their albums
 
Make sure we can navigate all the relationships with ease. All these relationships should work when you are done :)

```ruby
@artist = Artist.first
@artist.recordLabels
@artist.albums

@album = Album.first
@album.artist
@album.recordLabel

@label = RecordLabel.first
@label.artists
@label.albums
```

When you are done, please make sure you create a `commit` with the appropiate relationships.

### Importing the Data

After you create all the models and their relationships, it's time to import all the data.

In Rails, if we run the command `rake db:seed`, it will execute the file `db/seeds.rb` within our rails app. This means that we have access to all our models as if we were in `rails console`.

We have provided the boilerplate code for you to get started, including how to use the [csv](http://ruby-doc.org/stdlib-1.9.2/libdoc/csv/rdoc/CSV.html) class from the Ruby Standard Library to import the data, and how to convert the values into the appropiate data types:

```ruby
require 'csv'

CSV.foreach("db/seeds.csv") do |row|
  album = {
      musician:  row[0],
      album:     row[1],
      label:     row[2],
      edition:   row[3].to_i,
      crown:     (row[4] == "No"? false : true),
      core:      (row[5] == "No"? false : true),
      best_1001: (row[6] == "No"? false : true)
  }
  puts album
end
```

Your goal would be to add the code in `db/seeds.rb` so that we can safely import all the data into our database.

When you are done, please make sure you create a `commit` with your `seeds.rb`.

Happy Coding!!
