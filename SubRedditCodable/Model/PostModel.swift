//
//  PostModel.swift
//  SubRedditCodable
//
//  Created by Kamil Wrobel on 9/4/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import Foundation

struct MainDictionary{
    
    let data: Datadictionary
    
    struct Datadictionary {
        
        let childern: childernsDictionary
        
        struct childernsDictionary {
            
            let data2 : dataDictionaty
            
            private enum CodingKeys: String, CodingKey {
                case data2 = "data"
            }
            
            struct dataDictionaty {
                let title           : String
                let upVotes         : Int
                let postImage       : String
                let numberOfComents : Int
                
                private enum CodingKeys: String, CodingKey {
                    case title
                    case upVotes         = "ups"
                    case postImage       = "url"
                    case numberOfComents = "num_comments"
                }
            }
        }
    }
}

//let post = MainDictionary(data: data)
//let data = MainDictionary.Datadictionary(childern: childern)
//let childern = MainDictionary.Datadictionary.childernsDictionary(data: data2)
//let data2 = MainDictionary.Datadictionary.childernsDictionary.dataDictionaty(title: "title", upVotes: 234, postImage: "http:bulshit.com", numberOfComents: 34)


