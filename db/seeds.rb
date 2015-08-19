# Data imported from:
# http://people.ucalgary.ca/~ghfick/jazz.html
# - http://people.ucalgary.ca/~ghfick/four_crown_core_thousand_beta2.csv

# Info: The current list available for download has been updated to include all CDs that have been given 4 stars in any edition of the guide up to and including the tenth edition. The current list contains 3615 entries and many of the entries refer to multi-disc sets. The list contains a column noting the edition in which an entry was first given a four star rating. Three further columns identify if an entry is crown, core or a part of the best 1001.


# "musician",          "album",           "label", "edition", "crown", "core", "best_1001"
# "Armstrong, Louis" , "Young LA 30-33" , "RCA",   3,          "No" ,  "No" ,  "No"

require 'csv'

Artist.delete_all
Album.delete_all
RecordLabel.delete_all

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

  Artist.create!(
    musician: album[:musician]
    )
  RecordLabel.create!(
    label: album[:label]
    )

  artist_id = Artist.find_by(musician: album[:musician]).id
  record_label_id = RecordLabel.find_by(label: album[:label]).id

  Album.create!(
    album: album[:album],
    edition: album[:edition],
    crown: album[:crown],
    core: album[:core],
    best_1001: album[:best_1001],
    artist_id: artist_id,
    record_label_id: record_label_id
    )

end


