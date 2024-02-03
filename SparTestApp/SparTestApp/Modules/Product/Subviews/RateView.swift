//
//  RateView.swift
//  SparTestApp
//
//  Created by Тихтей  Павел on 02.02.2024.
//

import UIKit

final class RateView: UIView {

    private lazy var rateStackView: UIStackView = {
        let feedbackStackView = UIStackView()
        feedbackStackView.translatesAutoresizingMaskIntoConstraints = false
        return feedbackStackView
    }()
    
    private lazy var rateImageView: UIImageView = {
        let feedbackImageView = UIImageView()
        feedbackImageView.translatesAutoresizingMaskIntoConstraints = false
        feedbackImageView.image = UIImage(systemName: "star.fill")
        feedbackImageView.tintColor = UIColor(red: 1, green: 219/255, blue: 88/255, alpha: 1)
        return feedbackImageView
    }()
    
    private lazy var rateLabel: UILabel = {
        let feedbackRateLabel = UILabel()
        feedbackRateLabel.translatesAutoresizingMaskIntoConstraints = false
        feedbackRateLabel.textColor = .label
        feedbackRateLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        return feedbackRateLabel
    }()
    
    private lazy var rateCountLabel: UILabel = {
        let feedbackCountLabel = UILabel()
        feedbackCountLabel.translatesAutoresizingMaskIntoConstraints = false
        feedbackCountLabel.textColor = .gray
        return feedbackCountLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: RateViewModel) {
        rateLabel.text = model.rate
        rateCountLabel.text = model.rateCount
    }
    
    private func setupViews() {
        addSubview(rateStackView)
        [rateImageView, rateLabel, rateCountLabel].forEach { rateStackView.addArrangedSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            rateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            rateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            rateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            rateStackView.heightAnchor.constraint(equalToConstant: 30),
            
            rateImageView.leadingAnchor.constraint(equalTo: rateStackView.leadingAnchor),
            rateImageView.topAnchor.constraint(equalTo: rateStackView.topAnchor),
            rateImageView.bottomAnchor.constraint(equalTo: rateStackView.bottomAnchor),
            rateImageView.widthAnchor.constraint(equalTo: rateImageView.heightAnchor),
            
            rateLabel.leadingAnchor.constraint(equalTo: rateImageView.trailingAnchor, constant: 20),
            rateLabel.topAnchor.constraint(equalTo: rateStackView.topAnchor),
            rateLabel.bottomAnchor.constraint(equalTo: rateStackView.bottomAnchor),
            rateLabel.widthAnchor.constraint(equalToConstant: 30),
            
            rateCountLabel.leadingAnchor.constraint(equalTo: rateLabel.trailingAnchor),
            rateCountLabel.topAnchor.constraint(equalTo: rateStackView.topAnchor),
            rateCountLabel.bottomAnchor.constraint(equalTo: rateStackView.bottomAnchor),
            rateCountLabel.trailingAnchor.constraint(equalTo: rateStackView.trailingAnchor),
        ])
    }
    
}
