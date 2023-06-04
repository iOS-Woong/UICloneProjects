//
//  Entity.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit.UIImage

struct Contents {
    let userName: String
    let userProfile: UIImage?
    let contents: [Feed]?
}

struct Feed {
    let image: [UIImage?]
    let description: String?
    let comments: [Comment]?
}

struct Comment {
    let userName: String
    let comment: String
}
