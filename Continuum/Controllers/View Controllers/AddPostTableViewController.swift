//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by anthony byrd on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    //MARK: - Outlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var commentTextField: UITextField!
    
    //MARK: - Lifecylces
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        selectImageButton.setTitle("Select Image", for: .normal)
        postImageView.image = nil
        commentTextField.text = ""
    }
    
    //MARK: - Properties
    
    //MARK: - Actions
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        postImageView.image = UIImage(named: "spaceEmptyState")
        selectImageButton.setTitle("", for: .normal)
    }
    
    //MARK: - Helper Methods
    @IBAction func addPostButtonPressed(_ sender: Any) {
        guard let newPostImage = postImageView.image,
              let newComment = commentTextField.text, !newComment.isEmpty else {return}
        PostController.sharedInstance.createPostWith(image: newPostImage, caption: newComment) { (result) in
            
        }
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
    
    // MARK: - Table view data source
    
}//End of class
