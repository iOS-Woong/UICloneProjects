//
//  SampleData.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit.UIImage

class FeedSample {
    private var contentsSampleData = [Contents]()
    
    var contents: [Contents] {
        return contentsSampleData
    }
    
    init() {
        generateContents()
    }
    
    private func generateContents() {
        contentsSampleData = [
            Contents(userName: "사용자1", userProfile: UIImage(systemName: "person.fill"), contents: [Feed(image: [UIImage(systemName: "sun.min"), UIImage(systemName: "cloud")],
                                                                                                        description: "멋진 하루!",
                                                                                                        comments: [Comment(userName: "댓글1", comment: "좋아요!")])]),
            Contents(userName: "사용자2", userProfile: UIImage(systemName: "person.fill"), contents: [Feed(image: [UIImage(systemName: "leaf.fill"), UIImage(systemName: "cloud")],
                                                                                                        description: "자연 속에서",
                                                                                                        comments: [Comment(userName: "댓글2", comment: "편안해 보여")])]),
            Contents(userName: "사용자3", userProfile: UIImage(systemName: "person.fill"), contents: [Feed(image: [UIImage(systemName: "car.fill"), UIImage(systemName: "cloud")],
                                                                                                        description: "여행 시작!",
                                                                                                        comments: [Comment(userName: "댓글3", comment: "안전 운행!")])]),
            Contents(userName: "사용자4", userProfile: UIImage(systemName: "person.fill"), contents: [Feed(image: [UIImage(systemName: "snow"), UIImage(systemName: "cloud")],
                                                                                                        description: "겨울 이야기",
                                                                                                        comments: [Comment(userName: "댓글4", comment: "따뜻하게!")])]),
            Contents(userName: "사용자5", userProfile: UIImage(systemName: "person.fill"), contents: [Feed(image: [UIImage(systemName: "flower.fill"), UIImage(systemName: "cloud")],
                                                                                                        description: "꽃이 피었어요",
                                                                                                        comments: [Comment(userName: "댓글5", comment: "아름다워요!")])]),
            Contents(userName: "사용자6", userProfile: UIImage(systemName: "person.fill"), contents: [Feed(image: [UIImage(systemName: "paperplane.fill"), UIImage(systemName: "cloud")],
                                                                                                        description: "비행기 타고",
                                                                                                        comments: [Comment(userName: "댓글6", comment: "멋져요!")])]),
            Contents(userName: "사용자7", userProfile: UIImage(systemName: "person.fill"), contents: [Feed(image: [UIImage(systemName: "music.note"), UIImage(systemName: "cloud")],
                                                                                                        description: "음악을 들으며",
                                                                                                        comments: [Comment(userName: "댓글7", comment: "좋은 노래!")])]),
            Contents(userName: "사용자8", userProfile: UIImage(systemName: "person.fill"), contents: [Feed(image: [UIImage(systemName: "book.fill"), UIImage(systemName: "cloud")],
                                                                                                        description: "책을 읽으며",
                                                                                                        comments: [Comment(userName: "댓글8", comment: "도서 추천!")])]),
            Contents(userName: "사용자9", userProfile: UIImage(systemName: "person.fill"), contents: [Feed(image: [UIImage(systemName: "pencil"), UIImage(systemName: "cloud")],
                                                                                                        description: "글을 쓰는 중",
                                                                                                        comments: [Comment(userName: "댓글9", comment: "잘 쓰셨어요!")])]),
            
        ]
    }    
}
