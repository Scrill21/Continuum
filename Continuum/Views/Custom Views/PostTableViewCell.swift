//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by anthony byrd on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: - Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    //MARK: - Actions
    
    //MARK: - Helper Methods
    func updateViews() {
        guard let post = post else {return}
        postImageView.image = post.photo
        captionLabel.text = post.caption
        commentsLabel.text = "Comments: \(post.comments.count)"
    }
}//End of class
