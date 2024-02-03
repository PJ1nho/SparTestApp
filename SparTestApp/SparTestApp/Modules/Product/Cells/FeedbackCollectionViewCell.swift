//
//  FeedbackCollectionViewCell.swift
//  SparTestApp
//
//  Created by Тихтей  Павел on 01.02.2024.
//

import UIKit

final class FeedbackCollectionViewCell: UICollectionViewCell {
    
    static let feedbackCellIdentifier = "FeedbackCellIdentifier"
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        return nameLabel
    }()
    
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.textColor = .lightGray
        return dateLabel
    }()
    
    private lazy var rateStackView: UIStackView = {
        let rateStackView = UIStackView()
        rateStackView.translatesAutoresizingMaskIntoConstraints = false
        rateStackView.axis = .horizontal
        rateStackView.distribution = .fillEqually
        return rateStackView
    }()
    
    lazy var feedbackTextLabel: UILabel = {
        let feedbackTextLabel = UILabel()
        feedbackTextLabel.translatesAutoresizingMaskIntoConstraints = false
        feedbackTextLabel.numberOfLines = 0
        feedbackTextLabel.textColor = .label
        return feedbackTextLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(rateStackView)
        contentView.addSubview(feedbackTextLabel)
        fillRateStackView()
        setupConstraints()
        
        configureLayout()
        configureShadow()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureShadow() {
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 0.25
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 5
        layer.masksToBounds = false
    }
    
    private func configureLayout() {
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .secondarySystemGroupedBackground
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: 20),
            
            rateStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            rateStackView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            rateStackView.widthAnchor.constraint(equalToConstant: 125),
            rateStackView.heightAnchor.constraint(equalToConstant: 20),
            
            feedbackTextLabel.topAnchor.constraint(equalTo: rateStackView.bottomAnchor, constant: 5),
            feedbackTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            feedbackTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            feedbackTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func fillRateStackView() {
        for _ in 0...4 {
            lazy var rateImageView: UIImageView = {
                let rateImageView = UIImageView()
                rateImageView.translatesAutoresizingMaskIntoConstraints = false
                rateImageView.image = UIImage(systemName: "star.fill")
                rateImageView.tintColor = UIColor(red: 1, green: 219/255, blue: 88/255, alpha: 1)
                return rateImageView
            }()
            rateStackView.addArrangedSubview(rateImageView)
        }
    }
}
