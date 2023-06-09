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
        // count = 16
        feedSample =
        [
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed1"), UIImage(named: "feed2")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed3"), UIImage(named: "feed4")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed5"), UIImage(named: "feed6")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed7"), UIImage(named: "feed8")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed9"), UIImage(named: "feed10")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed11"), UIImage(named: "feed12")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed13"), UIImage(named: "feed14")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed15"), UIImage(named: "feed16")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed17"), UIImage(named: "feed18")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed19"), UIImage(named: "feed20")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed21"), UIImage(named: "feed22")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed23"), UIImage(named: "feed24")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed25"), UIImage(named: "feed26")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed27"), UIImage(named: "feed28")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed29")]),
             description: "user_one의 첫번째 피드입니다.",
             comments: [Comment(user: User(profileImage: nil,
                                           name: "commentUser_01"),
                                comment: "안녕하세요 저는 첫번째커멘트유저입니다 반가워요. ㅎㅎ")]),
        Feed(user: User(profileImage: UIImage(systemName: "1.lane"),
                        name: "user_one"),
             image: Contents(image: [UIImage(named: "feed30")]),
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
