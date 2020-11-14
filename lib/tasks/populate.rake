desc 'Populate the database with board game data'
task populate: :environment do

    require 'httparty'
    require 'xmlsimple'

    # http://boardgamegeek.com/wiki/page/BGG_XML_API2#

    class BggApi
        include HTTParty
    
        BASE_URI = 'http://www.boardgamegeek.com/xmlapi2'
    
        def self.search
            ids = [174430,161936,224517,167791,233078,182028,220308,187645,12333,193738,115746,169786,162886,84876,120677,173346,124361,28720,291457,205637,266192,177736,183394,164928,96848,3076,180263,167355,102794,175914,237182,31260,205059,221107,170216,55690,199792,2651,126163,209010,164153,216132,25613,35677,72125,230802,276025,185343,247763,171623,121921,124742,192135,285774,125153,28143,68448,284083,159675,62219,229853,157354,201808,122515,110327,18602,521,161533,200680,191189,93,12493,244521,184267,146021,205896,236457,37111,40834,73439,172386,251247,266810,163412,266507,264220,144733,178900,170042,42,132531,2511,102680,269385,36218,182874,30549,198928,203993,127023]
            id = []

            ids.each do |id|
                response = get("http://www.boardgamegeek.com/xmlapi2/thing?id=#{id}&type=boardgame&stats=1")
    
                return if response.code != 200
        
                xml = XmlSimple.xml_in(response.body)
                return if xml['total'] == '0'
        
                bg_hash = xml['item'].map do |item|
                {
                    id:   item['id'].to_i,
                    name: item['name'][0]['value'],
                    year: item['yearpublished'][0]['value'],
                    image: item['image'][0],
                    rank: item['statistics'][0]['ratings'][0]['ranks'][0]['rank'][0]['value'],
                    rating: item['statistics'][0]['ratings'][0]['average'][0]['value'],
                    min_players: item['minplayers'][0]['value'],
                    max_players: item['maxplayers'][0]['value'],
                    min_playing_time: item['minplaytime'][0]['value'],
                    max_playing_time: item['maxplaytime'][0]['value'],
                    age: item['minage'][0]['value'],
                    weight: item['statistics'][0]['ratings'][0]['averageweight'][0]['value'],
                    description: item['description'][0]
                }
                end
                
                nbg = BoardGame.create do |b|
                    b.name = bg_hash[0][:name]
                    b.year_published = bg_hash[0][:year].to_i
                    b.overall_rank = bg_hash[0][:rank].to_i
                    b.geek_rating = bg_hash[0][:rating].to_f
                    b.min_players = bg_hash[0][:min_players].to_i
                    b.max_players = bg_hash[0][:max_players].to_i
                    b.min_playing_time = bg_hash[0][:min_playing_time].to_i
                    b.max_playing_time = bg_hash[0][:max_playing_time].to_i
                    b.age = bg_hash[0][:age].to_i
                    b.weight = bg_hash[0][:weight].to_f
                    b.long_description = bg_hash[0][:description]
                    b.image = bg_hash[0][:image]
                end
            end
        end
    end

    BggApi.search
end