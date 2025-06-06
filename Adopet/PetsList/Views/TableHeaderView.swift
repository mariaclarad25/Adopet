//
//  TableHeaderView.swift
//  Adopet
//
//  Created by Giovanna Moeller on 20/02/24.
//

import UIKit

class TableHeaderView: UIView {
    
    private lazy var textHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Olá! Veja os amigos disponíveis para adoção!"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "ColorBlue")
        return label
    }()
    
    private lazy var decorationImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "shape-1"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    
    }
    
    private func addSubviews() {
        addSubview(decorationImage)
        addSubview(textHeaderLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            decorationImage.topAnchor.constraint(equalTo: topAnchor),
            decorationImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            decorationImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            textHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            textHeaderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            textHeaderLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
