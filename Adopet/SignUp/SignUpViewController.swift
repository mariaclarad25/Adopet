//
//  SignUpViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 13/02/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let db = DataManager()
    
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
        label.text = "Ainda não tem cadastro? Então, antes de buscar seu melhor amigo, precisamos de alguns dados:"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorBlue")
        label.textAlignment = .center
        return label
    }()
    
    private lazy var registerNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var insertNameTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Digite seu nome completo"
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
    
    private lazy var registerEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var insertEmailTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Escolha seu melhor email"
        txtField.font = .init(name: "Poppins", size: 16)
        txtField.backgroundColor = UIColor(named: "ColorLightGray")
        txtField.layer.cornerRadius = 8
        txtField.layer.shadowOffset = .init(width: 0, height: 2)
        txtField.layer.shadowOpacity = 0.25
        txtField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        txtField.layer.shadowRadius = 0
        txtField.setLeftPaddingPoints(15)
        txtField.addTarget(self, action: #selector(txtFieldChanging(_:)), for: .editingChanged)
        return txtField
    }()
    
    private lazy var registerTelefoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Telefone com DDD"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var insertTelefoneTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Insira seu telefone/whatsapp"
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
    
    private lazy var registerPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var insertPasswordTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Crie uma senha"
        txtField.font = .init(name: "Poppins", size: 16)
        txtField.backgroundColor = UIColor(named: "ColorLightGray")
        txtField.layer.cornerRadius = 8
        txtField.layer.shadowOffset = .init(width: 0, height: 2)
        txtField.layer.shadowOpacity = 0.25
        txtField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        txtField.layer.shadowRadius = 0
        txtField.isSecureTextEntry = true
        txtField.setLeftPaddingPoints(15)
        return txtField
    }()
    
    private lazy var registerUserStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [registerNameLabel, insertNameTextField, registerEmailLabel, insertEmailTextField, registerTelefoneLabel, insertTelefoneTextField, registerPasswordLabel, insertPasswordTextField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 16
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
            
            insertNameTextField.heightAnchor.constraint(equalToConstant: 48),
            insertTelefoneTextField.heightAnchor.constraint(equalToConstant: 48),
            insertEmailTextField.heightAnchor.constraint(equalToConstant: 48),
            insertPasswordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            confirmRegisterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 88),
            confirmRegisterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -88),
            confirmRegisterButton.topAnchor.constraint(equalTo: registerUserStackView.bottomAnchor, constant: 32),
            confirmRegisterButton.heightAnchor.constraint(equalToConstant: 48),
            
            confirmRegisterButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32)
        ])
    }
    
    @objc func signUpButton() {
        
        guard let name = insertNameTextField.text,
              let email = insertEmailTextField.text,
              let phoneNumber = insertTelefoneTextField.text,
              let password = insertPasswordTextField.text else {return}
        
        let userData = CreateUserAccountModel(name: name, email: email, phoneNumber: phoneNumber, password: password)
        
        db.saveUser(userData: userData)
        
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
