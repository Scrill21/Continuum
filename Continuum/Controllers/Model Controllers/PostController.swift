//
//  PostController.swift
//  Continuum
//
//  Created by anthony byrd on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostController {
    
    //MARK: - Properties
    static let sharedInstance = PostController()
    var posts: [Post] = []
    
    //MARK: - CRUD Methods
    func addComment(text: String, post: Post, completion: @escaping (Result<Comment, PostError>) -> Void) {
        let newComment = Comment(text: text, post: post)
        post.comments.append(newComment)
    }//End of func
    
    func createPostWith(image: UIImage, caption: String, completion: @escaping (Result<Post?, PostError>) -> Void) {
        let newPost = Post(photo: image, caption: caption)
        posts.append(newPost)
    }//End of func
}//End of class
