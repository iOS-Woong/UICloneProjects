//
//  SampleData.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit.UIImage

class FeedSample {
    private var storySample = [Story]()
    private var feedSample = [Feed]()
    private var friendSample = [Friend]()
    
    var stories: [Story] {
        return storySample
    }
    
    var feeds: [Feed] {
        return feedSample
    }
    
    var recommends: [Friend] {
        return friendSample
    }
    
    
    init() {
        generateContents()
    }
    
    private var randomFeed: String {
        return "feed\(Int.random(in: 1...30))"
    }
    
    private var randomUser: String {
        return "user_\(Int.random(in: 1...16))"
    }
    
    
    private func generateContents() {
        for _ in 1...15 {
            let user = User(profileImage: UIImage(named: randomFeed), name: randomUser)
            let story = Story(user: user)
            storySample.append(story)
        }
        
        for _ in 1...16 {
            let user = User(profileImage: UIImage(named: randomFeed), name: randomUser)
            let contents = Contents(image: [UIImage(named: randomFeed), UIImage(named: randomFeed)])
            let description = "안녕요 \(randomUser)가 올린 \(randomFeed)게시물입니다."
            let comment = [
                Comment(user: User(profileImage: nil, name: randomUser),
                        comment: "안녕하세요 \(randomUser)의 댓글입니다."),
                Comment(user: User(profileImage: nil, name: randomUser),
                        comment: "반갑슴당")
            ]
            
            let feed = Feed(user: user, image: contents, description: description, comments: comment)
            feedSample.append(feed)
        }
        
        for _ in 1...50 {
            let user = User(profileImage: UIImage(named: randomFeed), name: randomUser)
            let state = "\(randomUser)님이 팔로우 중입니다."
            let friend = Friend(user: user, state: state)
            friendSample.append(friend)
        }
    }
}
