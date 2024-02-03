//
//  SpecificationView.swift
//  SparTestApp
//
//  Created by Тихтей  Павел on 02.02.2024.
//

import UIKit

class SpecificationView: UIView {

    private lazy var specificationsStackView: UIStackView = {
        let specificationsStackView = UIStackView()
        specificationsStackView.translatesAutoresizingMaskIntoConstraints = false
        specificationsStackView.axis = .vertical
        specificationsStackView.spacing = 10
        specificationsStackView.distribution = .fillEqually
        return specificationsStackView
    }()
    
    private lazy var specificationsTitleLabel: UILabel = {
        let specificationsTitleLabel = UILabel()
        specificationsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        specificationsTitleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        specificationsTitleLabel.textColor = .label
        return specificationsTitleLabel
    }()
    
    private lazy var allSpecificationsButton: UIButton = {
        let allSpecificationsButton = UIButton()
        allSpecificationsButton.translatesAutoresizingMaskIntoConstraints = false
        allSpecificationsButton.contentHorizontalAlignment = .left
        allSpecificationsButton.setTitleColor(UIColor(red: 0, green: 0.784, blue: 0.248, alpha: 1), for: .normal)
        allSpecificationsButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return allSpecificationsButton
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
        addSubview(specificationsStackView)
        specificationsStackView.addArrangedSubview(specificationsTitleLabel)
        addSubview(allSpecificationsButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            specificationsStackView.topAnchor.constraint(equalTo: topAnchor),
            specificationsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            specificationsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            allSpecificationsButton.topAnchor.constraint(equalTo: specificationsStackView.bottomAnchor, constant: 10),
            allSpecificationsButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            allSpecificationsButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            allSpecificationsButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(model: [SpecificationViewModel]) {
        for specification in 0...model.count - 1 {
            
            lazy var specificationsView: UIView = {
                let specificationsView = UIView()
                specificationsView.translatesAutoresizingMaskIntoConstraints = false
                specificationsView.backgroundColor = .clear
                return specificationsView
            }()
            
            lazy var specificationInsideStackView: UIStackView = {
                let specificationInsideStackView = UIStackView()
                specificationInsideStackView.translatesAutoresizingMaskIntoConstraints = false
                specificationInsideStackView.axis = .horizontal
                specificationInsideStackView.distribution = .fill
                return specificationInsideStackView
            }()
            
            lazy var specificationNameLabel: UILabel = {
                let specificationNameLabel = UILabel()
                specificationNameLabel.translatesAutoresizingMaskIntoConstraints = false
                specificationNameLabel.numberOfLines = 0
                specificationNameLabel.textColor = .label
                return specificationNameLabel
            }()
            
            lazy var specificationPointsLabel: UILabel = {
                let specificationPointsLabel = UILabel()
                specificationPointsLabel.translatesAutoresizingMaskIntoConstraints = false
                specificationPointsLabel.textColor = .label
                specificationPointsLabel.textAlignment = .center
                return specificationPointsLabel
            }()
            
            lazy var specificationDescrLabel: UILabel = {
                let specificationDescrLabel = UILabel()
                specificationDescrLabel.translatesAutoresizingMaskIntoConstraints = false
                specificationDescrLabel.textColor = .label
                specificationDescrLabel.numberOfLines = 0
                specificationDescrLabel.textAlignment = .right
                return specificationDescrLabel
            }()
            
            specificationNameLabel.text = model[specification].name
            specificationDescrLabel.text = model[specification].descr
            
            specificationsView.addSubview(specificationInsideStackView)
            specificationInsideStackView.addArrangedSubview(specificationNameLabel)
            specificationInsideStackView.addArrangedSubview(specificationPointsLabel)
            specificationInsideStackView.addArrangedSubview(specificationDescrLabel)
            specificationsStackView.addArrangedSubview(specificationsView)
            
            NSLayoutConstraint.activate([
                specificationInsideStackView.topAnchor.constraint(equalTo: specificationsView.topAnchor),
                specificationInsideStackView.bottomAnchor.constraint(equalTo: specificationsView.bottomAnchor),
                specificationInsideStackView.leadingAnchor.constraint(equalTo: specificationsView.leadingAnchor),
                specificationInsideStackView.trailingAnchor.constraint(equalTo: specificationsView.trailingAnchor),
                
                specificationNameLabel.topAnchor.constraint(equalTo: specificationInsideStackView.topAnchor),
                specificationNameLabel.leadingAnchor.constraint(equalTo: specificationInsideStackView.leadingAnchor),
                specificationNameLabel.bottomAnchor.constraint(equalTo: specificationInsideStackView.bottomAnchor),
                specificationNameLabel.trailingAnchor.constraint(equalTo: specificationPointsLabel.leadingAnchor),
                
                specificationDescrLabel.trailingAnchor.constraint(equalTo: specificationInsideStackView.trailingAnchor),
                specificationDescrLabel.topAnchor.constraint(equalTo: specificationInsideStackView.topAnchor),
                specificationDescrLabel.bottomAnchor.constraint(equalTo: specificationInsideStackView.bottomAnchor),
                specificationDescrLabel.leadingAnchor.constraint(equalTo: specificationPointsLabel.trailingAnchor),
                
                specificationPointsLabel.leadingAnchor.constraint(equalTo: specificationNameLabel.trailingAnchor),
                specificationPointsLabel.trailingAnchor.constraint(equalTo: specificationDescrLabel.leadingAnchor),
                specificationPointsLabel.topAnchor.constraint(equalTo: specificationInsideStackView.topAnchor),
                specificationPointsLabel.bottomAnchor.constraint(equalTo: specificationInsideStackView.bottomAnchor)
            ])
        }
        
        specificationsTitleLabel.text = "Основные характеристики"
        allSpecificationsButton.setTitle("Все характеристики", for: .normal)
    }
}
