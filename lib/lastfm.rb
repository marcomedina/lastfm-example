class SongsList
  def initialize
    @api_key = "c20ce6ea99ce233eed05510410dde32e"
    @top_url = "http://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=dream+theater&api_key=#{@api_key}&format=json&limit=10"
  end

  def get_top
    result = JSON.parse(RestClient.get(@top_url))
    songs = result['toptracks']['track']
    songs = songs.map{|s| s['name']}

    songs.sort
  end
end

