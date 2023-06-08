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
    
    private func generateContents() {
        storySample =
        
        [
            Story(user: User(profileImage: UIImage(named: "testImagewoongPhoto"),
                         name: "seo_hyeonung")),
            Story(user: User(profileImage: UIImage(named: "testImagewoongPhoto"),
                         name: "seo_hyeonung")),
            Story(user: User(profileImage: UIImage(named: "testImagewoongPhoto"),
                         name: "seo_hyeonung")),
            Story(user: User(profileImage: UIImage(named: "testImagewoongPhoto"),
                         name: "seo_hyeonung")),
            Story(user: User(profileImage: UIImage(named: "testImagewoongPhoto"),
                         name: "seo_hyeonung")),
            Story(user: User(profileImage: UIImage(named: "testImagewoongPhoto"),
                         name: "seo_hyeonung")),
            Story(user: User(profileImage: UIImage(named: "testImagewoongPhoto"),
                         name: "seo_hyeonung")),
            Story(user: User(profileImage: UIImage(named: "testImagewoongPhoto"),
                         name: "seo_hyeonung")),
            
        ]
        
        feedSample =
        
        [
            Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                            name: "user_one"),
                 image: [UIImage(systemName: "1.circle"), UIImage(systemName: "1.circle")],
                 description: "user_one의 첫번째 피드입니다.",
                 comments: [Comment(user: User(profileImage: nil,
                                               name: "commentUser_01"),
                                    comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
            Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                            name: "user_one"),
                 image: [UIImage(systemName: "1.circle"), UIImage(systemName: "1.circle")],
                 description: "user_one의 첫번째 피드입니다.",
                 comments: [Comment(user: User(profileImage: nil,
                                               name: "commentUser_01"),
                                    comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
            Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                            name: "user_one"),
                 image: [UIImage(systemName: "1.circle"), UIImage(systemName: "1.circle")],
                 description: "user_one의 첫번째 피드입니다.",
                 comments: [Comment(user: User(profileImage: nil,
                                               name: "commentUser_01"),
                                    comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
            Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                            name: "user_one"),
                 image: [UIImage(systemName: "1.circle"), UIImage(systemName: "1.circle")],
                 description: "user_one의 첫번째 피드입니다.",
                 comments: [Comment(user: User(profileImage: nil,
                                               name: "commentUser_01"),
                                    comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        ]
        
        friendSample =
        [
            Friend(user: User(profileImage: UIImage(systemName: "person.crop.circle"), name: "recommendUser_01"), state: "someone01"),
            Friend(user: User(profileImage: UIImage(systemName: "person.crop.circle"), name: "recommendUser_02"), state: "someone02"),
            Friend(user: User(profileImage: UIImage(systemName: "person.crop.circle"), name: "recommendUser_03"), state: "someone03"),
            Friend(user: User(profileImage: UIImage(systemName: "person.crop.circle"), name: "recommendUser_04"), state: "someone04"),
            Friend(user: User(profileImage: UIImage(systemName: "person.crop.circle"), name: "recommendUser_05"), state: "someone05"),
            Friend(user: User(profileImage: UIImage(systemName: "person.crop.circle"), name: "recommendUser_06"), state: "someone06"),
            Friend(user: User(profileImage: UIImage(systemName: "person.crop.circle"), name: "recommendUser_07"), state: "someone07"),
            Friend(user: User(profileImage: UIImage(systemName: "person.crop.circle"), name: "recommendUser_08"), state: "someone08")
            
        ]
        
        
    }    
}
