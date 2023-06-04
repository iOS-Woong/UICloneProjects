//
//  FeedCollectionViewCell.swift
//  InstagramMainClone
//
//  Created by 서현웅 on 2023/06/05.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    static let reuseIdentfier = "feedCell"
    
    private let sampleLabel = {
       let label = UILabel()
        
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(data: String) {
        sampleLabel.text = data
    }
    
    
    private func setupViews() {
        contentView.backgroundColor = .systemBlue
        contentView.addSubview(sampleLabel)
        
        NSLayoutConstraint.activate([
            sampleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            sampleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
