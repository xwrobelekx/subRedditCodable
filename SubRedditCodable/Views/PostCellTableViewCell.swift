//
//  PostCellTableViewCell.swift
//  SubRedditCodable
//
//  Created by Kamil Wrobel on 9/4/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class PostCellTableViewCell: UITableViewCell {
    
    //Mark: - Properties
    
    var postToPresent: Post? {
        didSet {
            updateViews()
        }
    }
    
    var thumbnail: UIImage? {
        didSet{
            updateViews()
        }
        
    }
    
    //MARK: - Outlets
    
    @IBOutlet weak var postImageView        : UIImageView!
    @IBOutlet weak var postTitleLabel       : UILabel!
    @IBOutlet weak var upVotesLabel         : UILabel!
    @IBOutlet weak var numberOfComentsLabel : UILabel!
    
    
    
    
    func updateViews() {
        
        guard let post = postToPresent else {return}
        
        if let thumbnail = thumbnail {
            postImageView.image = thumbnail
        }else {
            postImageView.image = UIImage(named: "noImage")
        }
        self.postTitleLabel.text = post.title
        self.upVotesLabel.text = "\(post.numberOfUpvotes)"
        self.numberOfComentsLabel.text = "\(post.numberOfComments)"
    }
    
}













