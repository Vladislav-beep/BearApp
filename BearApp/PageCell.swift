//
//  PageCell.swift
//  BearApp
//
//  Created by Владислав Сизонов on 05.11.2021.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSMutableAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionTexView.attributedText = attributedText
            descriptionTexView.textAlignment = .center
             
        }
    }
    
    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionTexView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSMutableAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Dont'n wait any longer! We hope to see you in our stores soon", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        let topImageContainer = UIView()
        topImageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topImageContainer)
        topImageContainer.addSubview(bearImageView)
        
        topImageContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainer.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainer.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTexView)
        descriptionTexView.topAnchor.constraint(equalTo: topImageContainer.bottomAnchor).isActive = true
        descriptionTexView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTexView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTexView.bottomAnchor.constraint(equalTo:  bottomAnchor, constant: 0).isActive = true
    }
    
}
