#!/usr/bin/env ruby

# file: geozone.rb


require 'dynarex'


class GeoZone

  def initialize(locations: nil, journey: nil)

    @dx = Dynarex.new locations if locations
    @journey = journey

  end

  def zone(location)

    a = @dx.all.map do |x|
      [x.label, distance(location, x.coords.split(/, */).map(&:to_f)).round]
    end

    label, distance = a.min_by(&:last)
    {zone: label.to_sym, distance: distance}

  end

  private

  def distance(loc1, loc2)

    rad = Math::PI/180
    rkm = 6371          # Earth radius in kilometers
    rm = rkm * 1000     # Radius in meters

    dlat_rad = (loc2[0]-loc1[0]) * rad     # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad

    lat1_rad, lon1_rad = loc1.map {|i| i * rad }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) \
        * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c     # Distance in meters
  end

end

