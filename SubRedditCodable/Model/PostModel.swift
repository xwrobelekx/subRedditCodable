//
//  PostModel.swift
//  SubRedditCodable
//
//  Created by Kamil Wrobel on 9/4/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import Foundation


struct JSONDictionary: Codable {
    let data: DataDictionary
    
    
    struct DataDictionary: Codable{
        let children: [PostDictionary]
        
        
        struct PostDictionary: Codable {
            let post: Post
            
            private enum CodingKeys: String, CodingKey{
                case post = "data"
            }
        }
    }
}




struct Post: Codable{
    let title: String
    let thumbnailEndpoint: String
    let numberOfUpvotes: Int
    let numberOfComments: Int
    
    private enum CodingKeys: String, CodingKey{
        case title
        case thumbnailEndpoint = "thumbnail"
        case numberOfUpvotes = "ups"
        case numberOfComments = "num_comments"
        
    }
}



























//struct DataDictionary: Codable{
//
//    let title : String
//    let ups: Int
//    let num_comments: Int
//    let url: String
//
//
//    private enum CodableKeys: String, CodingKey{
//        case title
//        case upPosts = "ups"
//        case numberOfComments = "num_comments"
//        case postImage = "url"
//    }
//
//}
//
//struct Number {
//
//    let number = Int
//
//
//}
























//
//struct Post: Decodable{
//
//    let data: [Datadictionary]
//
//    struct Datadictionary: Decodable {
//
//        let childern: childernsDictionary
//
//        struct childernsDictionary: Decodable {
//
//            let data2 : dataDictionaty
//
//            private enum CodingKeys: String, CodingKey {
//                case data2 = "data"
//            }
//
//            struct dataDictionaty: Decodable {
//                let title           : String
//                let upVotes         : Int
//                let postImage       : String
//                let numberOfComents : Int
//
//                private enum CodingKeys: String, CodingKey {
//                    case title
//                    case upVotes         = "ups"
//                    case postImage       = "url"
//                    case numberOfComents = "num_comments"
//                }
//            }
//        }
//    }
//}

//let post = MainDictionary(data: data)
//let data = MainDictionary.Datadictionary(childern: childern)
//let childern = MainDictionary.Datadictionary.childernsDictionary(data: data2)
//let data2 = MainDictionary.Datadictionary.childernsDictionary.dataDictionaty(title: "title", upVotes: 234, postImage: "http:bulshit.com", numberOfComents: 34)


