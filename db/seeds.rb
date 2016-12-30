# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


50.times.with_index do |index|
  Metric.create(
    host_name: 'host_name',
    network_name: 'unboxed',
    download_speed: rand(50.0..100.0).round(2),
    created_at: (index + 1).minutes.ago
  )

  Metric.create(
    host_name: 'another_host_name',
    network_name: 'unboxed_5ghz',
    download_speed: rand(50.0..100.0).round(2),
    created_at: (index + 1).minutes.ago
  )
end
