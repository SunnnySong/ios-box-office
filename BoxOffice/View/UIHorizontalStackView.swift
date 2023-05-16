//
//  UIHorizontalStackView.swift
//  BoxOffice
//
//  Created by Sunny on 2023/05/16.
//

import UIKit

class UIHorizontalStackView: UIStackView {
    
    private let titleLabel: UILabel = {
        var label = UILabel(fontSize: .headline)
        label.textAlignment = .center
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return label
    }()
    
    private let dataLabel: UILabel = {
        var label = UILabel(fontSize: .callout)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.axis = .horizontal
        self.spacing = 3
        
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(dataLabel)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init()
        
        titleLabel.text = title
    }
    
    func updateDataLabel(_ data: String?) {
        dataLabel.text = data
    }
    
}
