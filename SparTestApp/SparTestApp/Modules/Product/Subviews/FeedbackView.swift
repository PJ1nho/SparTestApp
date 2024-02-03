//
//  FeedbackView.swift
//  SparTestApp
//
//  Created by Тихтей  Павел on 02.02.2024.
//

import UIKit

class FeedbackView: UIView {

    private lazy var feedbackStackView: UIStackView = {
        let feedbackStackView = UIStackView()
        feedbackStackView.translatesAutoresizingMaskIntoConstraints = false
        feedbackStackView.axis = .horizontal
        feedbackStackView.distribution = .equalSpacing
        feedbackStackView.spacing = 20
        return feedbackStackView
    }()
    
    private lazy var feedbackTitleLabel: UILabel = {
        let feedbackTitleLabel = UILabel()
        feedbackTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        feedbackTitleLabel.text = "Отзывы"
        feedbackTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        feedbackTitleLabel.textColor = .label
        return feedbackTitleLabel
    }()
    
    private lazy var allFeedbackButton: UIButton = {
        let allFeedbackButton = UIButton()
        allFeedbackButton.translatesAutoresizingMaskIntoConstraints = false
        allFeedbackButton.setTitle("Все 152", for: .normal)
        allFeedbackButton.setTitleColor(UIColor(red: 0, green: 0.784, blue: 0.248, alpha: 1), for: .normal)
        allFeedbackButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return allFeedbackButton
    }()
    
    private lazy var feedbackCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let feedbackCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        feedbackCollectionView.translatesAutoresizingMaskIntoConstraints = false
        feedbackCollectionView.showsHorizontalScrollIndicator = false
        feedbackCollectionView.dataSource = self
        feedbackCollectionView.delegate = self
        feedbackCollectionView.register(FeedbackCollectionViewCell.self, forCellWithReuseIdentifier: FeedbackCollectionViewCell.feedbackCellIdentifier)
        return feedbackCollectionView
    }()
    
    private lazy var leaveFeedbackButton: UIButton = {
        let leaveFeedbackButton = UIButton()
        leaveFeedbackButton.translatesAutoresizingMaskIntoConstraints = false
        leaveFeedbackButton.setTitle("Оставить отзыв", for: .normal)
        leaveFeedbackButton.setTitleColor(UIColor(red: 0, green: 0.784, blue: 0.248, alpha: 1), for: .normal)
        leaveFeedbackButton.layer.borderWidth = 2
        leaveFeedbackButton.layer.borderColor = UIColor(red: 0, green: 0.784, blue: 0.248, alpha: 1).cgColor
        leaveFeedbackButton.layer.cornerRadius = 20
        leaveFeedbackButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return leaveFeedbackButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [feedbackStackView, feedbackCollectionView, leaveFeedbackButton].forEach {
            addSubview($0)
        }
        
        [feedbackTitleLabel, allFeedbackButton].forEach {
            feedbackStackView.addArrangedSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            feedbackStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            feedbackStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            feedbackStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            feedbackStackView.heightAnchor.constraint(equalToConstant: 30),
            
            feedbackCollectionView.topAnchor.constraint(equalTo: feedbackStackView.bottomAnchor, constant: 20),
            feedbackCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            feedbackCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            feedbackCollectionView.heightAnchor.constraint(equalToConstant: 190),
            
            leaveFeedbackButton.topAnchor.constraint(equalTo: feedbackCollectionView.bottomAnchor, constant: 20),
            leaveFeedbackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            leaveFeedbackButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            leaveFeedbackButton.heightAnchor.constraint(equalToConstant: 40),
            leaveFeedbackButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}

// MARK: -  UICollectionViewDelegate & UICollectionViewDataSource

extension FeedbackView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feedbackCell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedbackCollectionViewCell.feedbackCellIdentifier, for: indexPath) as? FeedbackCollectionViewCell
        feedbackCell?.nameLabel.text = "Александр В."
        feedbackCell?.dateLabel.text = "7 мая 2021"
        feedbackCell?.feedbackTextLabel.text = "Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!"
        return feedbackCell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 100, height: collectionView.frame.height - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
}
