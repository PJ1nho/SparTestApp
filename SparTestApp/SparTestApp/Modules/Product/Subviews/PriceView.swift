//
//  PriceView.swift
//  SparTestApp
//
//  Created by Тихтей  Павел on 02.02.2024.
//

import UIKit

class PriceView: UIView {
    
    private lazy var priceUpperLineView: UIView = {
        let priceUpperLineView = UIView()
        priceUpperLineView.translatesAutoresizingMaskIntoConstraints = false
        priceUpperLineView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        return priceUpperLineView
    }()
    
    private var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Шт", "Кг"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private lazy var priceCurrentLabel: UILabel = {
        let priceCurrentLabel = UILabel()
        priceCurrentLabel.translatesAutoresizingMaskIntoConstraints = false
        priceCurrentLabel.font = .systemFont(ofSize: 30, weight: .bold)
        return priceCurrentLabel
    }()
    
    private lazy var oldPriceLabel: UILabel = {
        let oldPriceLabel = UILabel()
        oldPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        oldPriceLabel.textColor = .lightGray
        oldPriceLabel.font = .systemFont(ofSize: 12, weight: .regular)
        return oldPriceLabel
    }()
    
    private lazy var priceCountView: UIView = {
        let priceCountView = UIView()
        priceCountView.translatesAutoresizingMaskIntoConstraints = false
        priceCountView.backgroundColor = UIColor(red: 0, green: 0.784, blue: 0.248, alpha: 1)
        priceCountView.layer.cornerRadius = 25
        return priceCountView
    }()
    
    private lazy var quantityCountLabel: UILabel = {
        let quantityCountLabel = UILabel()
        quantityCountLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityCountLabel.textColor = .white
        quantityCountLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        quantityCountLabel.textAlignment = .center
        return quantityCountLabel
    }()
    
    private lazy var finalSumLabel: UILabel = {
        let finalSumLabel = UILabel()
        finalSumLabel.translatesAutoresizingMaskIntoConstraints = false
        finalSumLabel.font = .systemFont(ofSize: 10, weight: .regular)
        finalSumLabel.textAlignment = .center
        finalSumLabel.textColor = .white
        return finalSumLabel
    }()
    
    private lazy var minusButton: UIButton = {
        let minusButton = UIButton()
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.white, for: .normal)
        minusButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        return minusButton
    }()
    
    private lazy var plusButton: UIButton = {
        let plusButton = UIButton()
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.white, for: .normal)
        plusButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        return plusButton
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
        [priceUpperLineView, segmentedControl, priceCurrentLabel, oldPriceLabel, priceCountView, quantityCountLabel, finalSumLabel, minusButton, plusButton].forEach {
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            priceUpperLineView.heightAnchor.constraint(equalToConstant: 1),
            priceUpperLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceUpperLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceUpperLineView.topAnchor.constraint(equalTo: topAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: priceUpperLineView.topAnchor, constant: 10),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 30),
            
            priceCurrentLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 25),
            priceCurrentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            priceCurrentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            oldPriceLabel.topAnchor.constraint(equalTo: priceCurrentLabel.bottomAnchor),
            oldPriceLabel.leadingAnchor.constraint(equalTo: priceCurrentLabel.leadingAnchor),
            oldPriceLabel.trailingAnchor.constraint(equalTo: priceCurrentLabel.trailingAnchor),
            
            priceCountView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            priceCountView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 25),
            priceCountView.widthAnchor.constraint(equalToConstant: 150),
            priceCountView.heightAnchor.constraint(equalToConstant: 50),
            
            minusButton.leadingAnchor.constraint(equalTo: priceCountView.leadingAnchor),
            minusButton.topAnchor.constraint(equalTo: priceCountView.topAnchor),
            minusButton.bottomAnchor.constraint(equalTo: priceCountView.bottomAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 40),
            
            quantityCountLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor),
            quantityCountLabel.topAnchor.constraint(equalTo: priceCountView.topAnchor, constant: 10),
            quantityCountLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor),
            quantityCountLabel.heightAnchor.constraint(equalToConstant: 20),
            
            finalSumLabel.topAnchor.constraint(equalTo: quantityCountLabel.bottomAnchor),
            finalSumLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor),
            finalSumLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor),
            finalSumLabel.bottomAnchor.constraint(equalTo: priceCountView.bottomAnchor, constant: -10),
            
            plusButton.topAnchor.constraint(equalTo: priceCountView.topAnchor),
            plusButton.trailingAnchor.constraint(equalTo: priceCountView.trailingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: priceCountView.bottomAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configure(model: PriceViewModel) {
        priceCurrentLabel.text = model.currentPrice
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: model.oldPrice ?? "")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        oldPriceLabel.attributedText = attributeString
        quantityCountLabel.text = model.quantityCount
        finalSumLabel.text = model.finalSum
    }
}
