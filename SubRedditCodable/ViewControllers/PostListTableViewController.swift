//
//  PostListTableViewController.swift
//  SubRedditCodable
//
//  Created by Kamil Wrobel on 9/4/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    //MARK: - Fetch Functions
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        guard let searchTerm = searchBar.text?.lowercased() else {return}
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
        //called fetch once i got the search word
        
        PostController.shared.fetchPost(bySearchTerm: searchTerm) {
            //FIXME: not sure what i want to do here?
            DispatchQueue.main.async {
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                self.title = "\(searchTerm)"
                self.tableView.reloadData()
            }
        }
        
        //FIXME: i was thinking of putting the fetch func for thumbnail here, or in the cell
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //FIXME: how do i get the data to poulate the tableview
        return PostController.shared.posts.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostCellTableViewCell else {return UITableViewCell() }
        let post = PostController.shared.posts[indexPath.row]
        //FIXME: wasnt sure why i should put the thumbnail fetch functon here.
        
        PostController.shared.fetchThumbnails(thumbnailURL: post.thumbnailEndpoint) { (image) in
            //FIXME: not sure what to do here
            // im getting the picture - i need to send it over to my cell - then update views
            //how?
            // how about another property observer? - turned out its needed
            DispatchQueue.main.async {
                //FIXME: why do we need to chcek the curent cell index if we can pull the index from tableview indexPath - does this have to do anything with reusable cells?
                cell.postToPresent = post
                if let curentIndexPath = self.tableView?.indexPath(for: cell),
                    curentIndexPath == indexPath {
                    cell.thumbnail = image
                } else {
                    print("Got image for now - reused cell")
                    return // cell has been reused
                }
            }
        }
        return cell
    }
}
