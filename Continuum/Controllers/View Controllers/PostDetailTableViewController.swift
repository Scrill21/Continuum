//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by anthony byrd on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    //MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Properties
    var post: Post? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    //MARK: - Actions
    @IBAction func commentButtonTapped(_ sender: Any) {
        guard let post = post else {return}
        let commentAlert = UIAlertController(title: "Add Comment", message: nil, preferredStyle: .alert)
        commentAlert.addTextField { textfield in
            textfield.placeholder = "Comment on this post..."
        }
        
        let comment = UIAlertAction(title: "Add", style: .cancel) { (addComment) in
            guard let newComment = commentAlert.textFields?.first?.text, !newComment.isEmpty else {return}
            PostController.sharedInstance.addComment(text: newComment, post: post) { (result) in
                
            }
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        commentAlert.addAction(comment)
        commentAlert.addAction(cancel)
        present(commentAlert, animated: true)
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func followPostButtonTapped(_ sender: Any) {
        
    }
    
    //MARK: - Helper Methods
    func updateViews(){
        photoImageView.image = post?.photo
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return post?.comments.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)

        let comment = post?.comments[indexPath.row]
        cell.textLabel?.text = comment?.text
        cell.detailTextLabel?.text = post?.timestamp.formateDate()
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

}//End of class
