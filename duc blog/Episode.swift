//
//  Episode.swift
//  Duc Blog
//
//  Created by Duc Tran on 4/3/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import Foundation


class Episode
{
    var title: String?
    var description: String?
    var thumbnailURL: NSURL?
    var createdAt: String?
    var author: String?
    var url: NSURL?
    
    init(title: String, description: String, thumbnailURL: NSURL, createdAt: String, author: String)
    {
        self.title = title
        self.description = description
        self.thumbnailURL = thumbnailURL
        self.createdAt = createdAt
        self.author = author
    }
    
    init(espDictionary: [String: AnyObject])
    {
        self.title = espDictionary["title"] as? String
        description = espDictionary["description"] as? String
        thumbnailURL = NSURL(string: espDictionary["thumbnailURL"] as! String)
        self.createdAt = espDictionary["pubDate"] as? String
        self.author = espDictionary["author"] as? String
        self.url = NSURL(string: espDictionary["link"] as! String)
    }
    
    static func downloadAllEpisodes() -> [Episode]
    {
        var episodes = [Episode]()
        let jsonFile = NSBundle.mainBundle().pathForResource("DucBlog", ofType: "json")
        let jsonData = NSData(contentsOfFile: jsonFile!)
        
        if let jsonDictionary = NetworkService.parseJSONFromData(jsonData){
            print(jsonDictionary)
            let espDictionaries = jsonDictionary["episodes"] as! [[String: AnyObject]]
            for espDictionary in espDictionaries{
                let newEpisode = Episode(espDictionary: espDictionary)
                episodes.append(newEpisode)
            }   
        }
        return episodes
    }
}





















