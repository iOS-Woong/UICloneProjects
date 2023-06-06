//
//  UserProfileImageView.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/06.
//

import UIKit

class UserProfileImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
