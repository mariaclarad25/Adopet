//
//  APLabeledTextField.swift
//  Adopet
//
//  Created by Maria Clara Dias on 06/06/25.
//

import UIKit

class APLabeledTextField: UIView {
    
    private var title: String
    private var placeholder: String
    private var isSecureEntry: Bool
    
    init(title: String, placeholder: String, isSecureEntry: Bool = false) {
        self.title = title
        self.placeholder = placeholder
        self.isSecureEntry = isSecureEntry
        
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
     lazy var textField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.font = .init(name: "Poppins", size: 16)
        txtField.backgroundColor = UIColor(named: "ColorLightGray")
        txtField.layer.cornerRadius = 8
        txtField.layer.shadowOffset = .init(width: 0, height: 2)
        txtField.layer.shadowOpacity = 0.25
        txtField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        txtField.layer.shadowRadius = 0
        txtField.setLeftPaddingPoints(15)
        return txtField
    }()
    
    private func setupView(){
        updateUI()
        addSubviews()
        setupConstraints()
    }
    
    private func updateUI(){
        label.text = title
        textField.placeholder = placeholder
        textField.isSecureTextEntry = isSecureEntry
    }
    
    private func addSubviews(){
        addSubview(label)
        addSubview(textField)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
