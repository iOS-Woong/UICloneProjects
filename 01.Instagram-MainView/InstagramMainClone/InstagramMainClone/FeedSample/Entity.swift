//
//  Entity.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit.UIImage

struct Story: Hashable { // 0 section
    let uuid = UUID()
    let user: User
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

struct Feed: Hashable { // 1 section
    let uuid = UUID()
    let user: User
    let image: Contents
    let description: String
    let comments: [Comment]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

struct Contents: Hashable {
    let uuid = UUID()
    let image: [UIImage?]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
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

