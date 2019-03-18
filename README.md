# Introducing the geozone

    require 'geozone'


    s=<<EOF
    <?dynarex schema='locations[title]/location(label, coords, radius)' delimiter=' # '?>

    duddingston_rd_west # 55.942445,-3.143624
    abercorn_crescent # 55.951543,-3.146184
    park # 55.945005,-3.146394
    EOF

    gz = GeoZone.new(locations: s)

    # find out what zone you are in
    gz.zone([55.94824167, -3.14314333])
    #=> {:zone=>:abercorn_crescent, :distance=>413} 

Note: Distance is in meters

## Resources

* geozone https://rubygems.org/gems/geozone

gps zone distance location
