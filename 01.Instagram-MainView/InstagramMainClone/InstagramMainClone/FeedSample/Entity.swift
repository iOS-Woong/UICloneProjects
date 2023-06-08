//
//  Entity.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit.UIImage

struct Story: Hashable { // 0 section
    let user: User
}

struct Feed: Hashable { // 1 section
    let user: User
    let image: [UIImage?]
    let description: String
    let comments: [Comment]
}

struct Comment: Hashable {
    let user: User
    let comment: String
}

struct Friend: Hashable { // 2 section
    let user: User
    let state: String
}

struct User: Hashable {
    let profileImage: UIImage?
    let name: String
}
