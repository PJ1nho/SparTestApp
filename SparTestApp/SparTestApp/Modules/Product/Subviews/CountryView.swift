//
//  CountryView.swift
//  SparTestApp
//
//  Created by Тихтей  Павел on 02.02.2024.
//

import UIKit

class CountryView: UIView {

    private lazy var countryStackView: UIStackView = {
        let countryStackView = UIStackView()
        countryStackView.translatesAutoresizingMaskIntoConstraints = false
        countryStackView.spacing = 10
        return countryStackView
    }()
    
    private lazy var countryImageView: UIImageView = {
        let countryImageView = UIImageView()
        countryImageView.translatesAutoresizingMaskIntoConstraints = false
        countryImageView.clipsToBounds = true
        countryImageView.layer.cornerRadius = 15
        countryImageView.contentMode = .scaleToFill
        return countryImageView
    }()
    
    private lazy var countryNameLabel: UILabel = {
        let countryNameLabel = UILabel()
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.textColor = .label
        return countryNameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: CountryViewModel) {
        countryImageView.image = model.image
        countryNameLabel.text = model.countryName
    }
    
    private func setupViews() {
        addSubview(countryStackView)
        [countryImageView, countryNameLabel].forEach {
            countryStackView.addArrangedSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            countryStackView.topAnchor.constraint(equalTo: topAnchor),
            countryStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            countryStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            countryStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            countryImageView.leadingAnchor.constraint(equalTo: countryStackView.leadingAnchor),
            countryImageView.topAnchor.constraint(equalTo: countryStackView.topAnchor),
            countryImageView.bottomAnchor.constraint(equalTo: countryStackView.bottomAnchor),
            countryImageView.widthAnchor.constraint(equalTo: countryImageView.heightAnchor),
            
            countryNameLabel.leadingAnchor.constraint(equalTo: countryImageView.trailingAnchor, constant: 10),
            countryNameLabel.topAnchor.constraint(equalTo: countryStackView.topAnchor),
            countryNameLabel.bottomAnchor.constraint(equalTo: countryStackView.bottomAnchor),
            countryNameLabel.trailingAnchor.constraint(equalTo: countryStackView.trailingAnchor)
        ])
    }
}
