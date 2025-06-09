//
//  SignUpViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 13/02/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private var userManager = UserManager()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var decorativeShapeTopImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "shape-1"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var decorationPawsImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "paws"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var questionRegisterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.doesntHaveAccount
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorBlue")
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nameInputField: APLabeledTextField = {
        return APLabeledTextField(title: Constants.nameLabelTitle, placeholder:  Constants.nameTextFieldPlaceholder)
    }()
    
    private lazy var emailInputField: APLabeledTextField = {
       let inputField = APLabeledTextField(title: "Email", placeholder: "Escolha seu melhor email")
        inputField.textField.addTarget(self, action: #selector(txtFieldChanging(_:)), for: .editingChanged)
        inputField.textField.keyboardType = .emailAddress
        return inputField
    }()
    
    private lazy var phoneNumberInputField: APLabeledTextField = {
        let inputField = APLabeledTextField(title: "Telefone com DDD", placeholder: "Insira seu telefone/whatsapp")
        inputField.textField.keyboardType = .phonePad
        return inputField
    }()
    
    private lazy var passwordInputField: APLabeledTextField = {
        return APLabeledTextField(title: "Senha", placeholder: "Crie uma senha", isSecureEntry: true)
    }()
    
    private lazy var registerUserStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameInputField, emailInputField, phoneNumberInputField, passwordInputField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = Constants.UIConstants.stackSpacing
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var confirmRegisterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.backgroundColor = UIColor(named: "ColorCoral")
        button.titleLabel?.font = .init(name: "Poppins-Bold", size: 18)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(signUpButton), for: .touchUpInside)
        return button
    }()
        
    override func viewDidLoad(){
        super.viewDidLoad()
        setupView()
        addSubviews()
        configurationScrollView()
        setupConstraints()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
    }
    
    private func addSubviews(){
        view.addSubview(scrollView)
    }
    
    private func configurationScrollView(){
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.addSubview(contentView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
        ])
        contentView.addSubview(decorativeShapeTopImage)
        contentView.addSubview(questionRegisterLabel)
        contentView.addSubview(registerUserStackView)
        contentView.addSubview(confirmRegisterButton)
        contentView.addSubview(decorationPawsImage)
        
        NSLayoutConstraint.activate([
            
            decorationPawsImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            decorationPawsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            decorativeShapeTopImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            decorativeShapeTopImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            decorativeShapeTopImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            questionRegisterLabel.topAnchor.constraint(equalTo: decorativeShapeTopImage.bottomAnchor, constant: -120),
            questionRegisterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 64),
            questionRegisterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -64),
            
            registerUserStackView.topAnchor.constraint(equalTo: questionRegisterLabel.bottomAnchor, constant: 32),
            registerUserStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            registerUserStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            
            
            confirmRegisterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 88),
            confirmRegisterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -88),
            confirmRegisterButton.topAnchor.constraint(equalTo: registerUserStackView.bottomAnchor, constant: 32),
            confirmRegisterButton.heightAnchor.constraint(equalToConstant: 48),
            
            confirmRegisterButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32)
        ])
    }
    
    @objc func signUpButton() {
        
        guard let name = nameInputField.textField.text,
              let email = emailInputField.textField.text,
              let phoneNumber = phoneNumberInputField.textField.text,
              let password = passwordInputField.textField.text else {return}
        
        let userData = CreateUserAccountModel(name: name, email: email, phoneNumber: phoneNumber, password: password)
        
        userManager.saveUser(userData: userData)
        
        navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
    @objc func txtFieldChanging(_ textField: UITextField) {
        guard let txt = textField.text else {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
            return
        }
        if txt.contains("@") {
            textField.layer.borderColor = UIColor.clear.cgColor
            textField.layer.borderWidth = 0.0
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
        }
    }
}
