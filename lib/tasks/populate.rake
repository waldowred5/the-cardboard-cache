desc 'Populate the database with board game data'
task populate: :environment do

    require 'httparty'
    require 'xmlsimple'

    # http://boardgamegeek.com/wiki/page/BGG_XML_API2#

    class BggApi
        include HTTParty
    
        BASE_URI = 'http://www.boardgamegeek.com/xmlapi2'
    
        def self.search(id)
            # response = get(BASE_URI + '/search', query: {query: id, type: 'boardgame', stats: 'stats=1'})
            response = get("http://www.boardgamegeek.com/xmlapi2/thing?id=#{id}&type=boardgame&stats=1")
    
            return if response.code != 200
    
            xml = XmlSimple.xml_in(response.body)
            return if xml['total'] == '0'
    
            xml['item'].map do |item|
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
                description: item['description']
            }
            end
        end
    end
end