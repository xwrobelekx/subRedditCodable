//
//  PostController.swift
//  SubRedditCodable
//
//  Created by Kamil Wrobel on 9/4/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit


class PostController {
    static let shared = PostController()
    private init() {}
    var posts: [Post] = []
    let baseURL = URL(string: "https://www.reddit.com/r")
    
    //FIXME: i had [Post]? in a completion - i guess i thought the completion should of return me array of posts...
    func fetchPost(bySearchTerm: String, completion: @escaping () -> Void ){
        guard let unwrappedBaseUrl = baseURL else {
            print("😢this Url Sucks!")
            completion()
            return
        }
        let url = unwrappedBaseUrl.appendingPathComponent(bySearchTerm).appendingPathExtension("json")
        print("😏 ...is this url right?: \(url)")
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            do{
                if let error = error { throw error }
                guard let data = data else {throw NSError() }
                
                let json = try JSONDecoder().decode(JSONDictionary.self, from: data)
                let posts = json.data.children.compactMap({ $0.post })
                self.posts = posts
                completion()
                //print(posts)
                
            }catch let error {
                print("🤬 there was an error in the URLSession: \(error), \(error.localizedDescription)")
                completion()
                return
            }
            }.resume()
    }
    
    //fetch thumbnails
    func fetchThumbnails(thumbnailURL: String, completion: @escaping ((UIImage?) -> Void)){
        guard let unwrappedURL = URL(string: thumbnailURL) else {
            print("invalid URL")
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: unwrappedURL) { (data, _, error) in
            if let error = error {
                print("Error in URLSession: \(error), \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data ,
                let image = UIImage(data: data) else {
                    print("No Data")
                    completion(nil)
                    return
            }
            completion(image)
            }.resume()
    }
}
