//
//  SparProductViewController.swift
//  SparTestApp
//
//  Created by Тихтей  Павел on 31.01.2024.
//

import UIKit

final class SparProductViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        return mainStackView
    }()
    
    private lazy var productImageView: UIImageView = {
        let productImageView = UIImageView()
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        return productImageView
    }()
    
    private lazy var productName: UILabel = {
        let productName = UILabel()
        productName.translatesAutoresizingMaskIntoConstraints = false
        productName.font = .systemFont(ofSize: 40, weight: .heavy)
        productName.text = "Добавка \"Липа\" к чаю 200 г"
        productName.numberOfLines = 0
        return productName
    }()
    

    private let specifications = [
        SpecificationViewModel(name: "Производство", descr: "Россия, Краснодарский край"),
        SpecificationViewModel(name: "Энергетическая ценность, ккал/100 г", descr: "25 ккал/105 кДж"),
        SpecificationViewModel(name: "Жиры/100 г", descr: "0,1 г"),
        SpecificationViewModel(name: "Белки/100 г", descr: "1,3 г"),
        SpecificationViewModel(name: "Углеводы/100 г", descr: "3,3 г"),
    ]
    
    private let rateView = RateView()
    private let countryView = CountryView()
    private let descriptionView = DescriptionView()
    private let specificationView = SpecificationView()
    private let feedbackView = FeedbackView()
    private let priceView = PriceView()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(productImageView)
        mainStackView.addArrangedSubview(rateView)
        mainStackView.addArrangedSubview(productName)
        mainStackView.addArrangedSubview(countryView)
        mainStackView.addArrangedSubview(descriptionView)
        mainStackView.addArrangedSubview(specificationView)
        mainStackView.addArrangedSubview(feedbackView)
        priceView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceView)
    }
    
    private func setupUI() {
        setupProductImage(image: UIImage(named: "productImage") ?? UIImage())
        rateView.configure(model: RateViewModel(rate: "5.0", rateCount: "| 15 отзывов"))
        countryView.configure(model:
                                CountryViewModel(
                                    image: UIImage(named: "flag") ?? UIImage(),
                                    countryName: "Испания, Риоха")
        )
        descriptionView.configure(model:
                                    DescriptionViewModel(
                                        text: "Флавоноиды липового цвета обладают противовоспалительным действием, способствуют укреплению стенки сосудов.")
        )
        priceView.configure(model:
                                PriceViewModel(
                                    currentPrice: "56,49 ₽",
                                    oldPrice: "199,99 ₽",
                                    quantityCount: "1 шт",
                                    finalSum: "56,49 ₽")
        )
        specificationView.configure(model: specifications)
        setupViews()
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: priceView.topAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            productImageView.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            productImageView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 300),
            
            rateView.topAnchor.constraint(equalTo: productImageView.bottomAnchor),
            rateView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            rateView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            rateView.heightAnchor.constraint(equalToConstant: 30),
            
            productName.topAnchor.constraint(equalTo: rateView.bottomAnchor, constant: 20),
            productName.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 20),
            productName.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -20),
            
            countryView.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 20),
            countryView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 20),
            countryView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -20),
            countryView.heightAnchor.constraint(equalToConstant: 30),
            
            
            descriptionView.topAnchor.constraint(equalTo: countryView.bottomAnchor, constant: 20),
            descriptionView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 20),
            descriptionView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -20),
            
            specificationView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 20),
            specificationView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 20),
            specificationView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -20),
            
            feedbackView.topAnchor.constraint(equalTo: specificationView.bottomAnchor, constant: 20),
            feedbackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            feedbackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            
            priceView.heightAnchor.constraint(equalToConstant: 140),
            priceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            priceView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            priceView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupProductImage(image: UIImage) {
        productImageView.image = image
    }
}
