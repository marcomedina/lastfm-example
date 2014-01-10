require 'rest_client'
require 'json'

namespace :lastfm do
  desc "TODO"
  task :get_info => :environment do
    api_key = "c20ce6ea99ce233eed05510410dde32e"
    top_songs_url = "http://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=dream+theater&api_key=#{api_key}&format=json&limit=10"
    top_artists_url = "http://ws.audioscrobbler.com/2.0/?method=chart.gettopartists&api_key=#{api_key}&format=json&limit=10"
    result_songs = JSON.parse(RestClient.get(top_songs_url))
    result_artists = JSON.parse(RestClient.get(top_artists_url))
    
    songs = result_songs['toptracks']['track']
    artists = result_artists['artists']['artist']

    Song.delete_all
    songs.each do |s|
      Song.create title: s['name'], artist: s['artist']['name'], listeners: s['listeners'], image: s['image'][0]['#text']
    end

    Artist.delete_all
    artists.each do |s|
      Artist.create name: s['name'], listeners: s['listeners'], image: s['image'][0]['#text']
    end
  end

end
