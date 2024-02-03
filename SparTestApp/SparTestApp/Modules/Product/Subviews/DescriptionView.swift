//
//  DescriptionView.swift
//  SparTestApp
//
//  Created by Тихтей  Павел on 02.02.2024.
//

import UIKit

class DescriptionView: UIView {

    private lazy var descriptionStackView: UIStackView = {
        let descriptionStackView = UIStackView()
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionStackView.axis = .vertical
        descriptionStackView.spacing = 10
        return descriptionStackView
    }()
    
    private lazy var descriptionTitleLabel: UILabel = {
        let descriptionTitleLabel = UILabel()
        descriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitleLabel.textColor = .label
        descriptionTitleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        return descriptionTitleLabel
    }()
    
    private lazy var descriptionTextLabel: UILabel = {
        let descriptionTextLabel = UILabel()
        descriptionTextLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextLabel.textColor = .label
        descriptionTextLabel.numberOfLines = 0
        return descriptionTextLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: DescriptionViewModel) {
        descriptionTitleLabel.text = "Описание"
        descriptionTextLabel.text = model.text
    }
    
    private func setupViews() {
        addSubview(descriptionStackView)
        [descriptionTitleLabel, descriptionTextLabel].forEach {
            descriptionStackView.addArrangedSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            descriptionStackView.topAnchor.constraint(equalTo: topAnchor),
            descriptionStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
