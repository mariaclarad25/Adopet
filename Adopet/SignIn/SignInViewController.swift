//
//  SignInViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 12/02/24.
//

import UIKit

class SignInViewController: UIViewController {
    
    private var authenticationManager: AuthenticationProvider = GoogleAuthenticationProvider ()
    
    private lazy var decorationPawsImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "paws"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    private lazy var decorativeShapeTopImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "shape-1"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var decorativeShapeSideImage: UIImageView = {
        let image = UIImage(named: "shape-2")?.withHorizontallyFlippedOrientation()
        let imgView = UIImageView(image: image)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var logoAdopetBlue: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "logo-blue"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var loginTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Já tem conta? Faça seu login:"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "ColorBlue")
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var insertEmailTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Insira seu email"
        txtField.font = .init(name: "Poppins", size: 16)
        txtField.textAlignment = .center
        txtField.backgroundColor = UIColor(named: "ColorLightGray")
        txtField.layer.cornerRadius = 8
        txtField.layer.shadowOffset = .init(width: 0, height: 2)
        txtField.layer.shadowOpacity = 0.25
        txtField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        txtField.layer.shadowRadius = 0
        return txtField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.font = .init(name: "Poppins", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(named: "ColorGray")
        return label
    }()
    
    private lazy var insertPasswordTextField: UITextField = {
        let txtField = UITextField()
        txtField.translatesAutoresizingMaskIntoConstraints = false
        txtField.placeholder = "Crie uma senha"
        txtField.font = .init(name: "Poppins", size: 16)
        txtField.textAlignment = .center
        txtField.backgroundColor = UIColor(named: "ColorLightGray")
        txtField.layer.cornerRadius = 8
        txtField.layer.shadowOffset = .init(width: 0, height: 2)
        txtField.layer.shadowOpacity = 0.25
        txtField.layer.shadowColor = UIColor(named: "ColorGray")?.cgColor
        txtField.layer.shadowRadius = 0
        txtField.rightViewMode = .always
        return txtField
    }()
    
    private lazy var loginStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailLabel, insertEmailTextField, passwordLabel, insertPasswordTextField])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 16
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = UIColor(named: "ColorCoral")
        button.titleLabel?.font = .init(name: "Poppins-Bold", size: 18)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupConstraints()
    }
        private func setupView(){
            navigationItem.hidesBackButton = true
            view.backgroundColor = .white
        }
        
        private func addSubviews(){
            view.addSubview(decorativeShapeTopImage)
            view.addSubview(decorativeShapeSideImage)
            view.addSubview(decorationPawsImage)
            view.addSubview(logoAdopetBlue)
            view.addSubview(loginTextLabel)
            view.addSubview(loginStackView)
            view.addSubview(enterButton)
        }
        
        private func setupConstraints(){
            NSLayoutConstraint.activate([
                decorativeShapeSideImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -48),
                
                logoAdopetBlue.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logoAdopetBlue.topAnchor.constraint(equalTo: decorativeShapeTopImage.bottomAnchor, constant: -108),
                
                loginTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
                loginTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
                loginTextLabel.topAnchor.constraint(equalTo: logoAdopetBlue.bottomAnchor, constant: 32),
                
                decorationPawsImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
                loginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
                loginStackView.topAnchor.constraint(equalTo: loginTextLabel.bottomAnchor, constant: 32),
                
                insertEmailTextField.heightAnchor.constraint(equalToConstant: 48),
                insertPasswordTextField.heightAnchor.constraint(equalToConstant: 48),
                
                enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 88),
                enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -88),
                enterButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 32),
                enterButton.heightAnchor.constraint(equalToConstant: 48),
                
                
            ])
    }
    @objc func signIn() {
        /*let email = insertEmailTextField.text!
        let password = insertPasswordTextField.text!*/
        
        guard let email = insertEmailTextField.text,
              let password = insertPasswordTextField.text,
              !email.isEmpty, !password.isEmpty else {return }
        
        authenticationManager.signIn(email: email, password: password) { result in
            switch result {
            case.success(let sucess):
                self.navigationController?.pushViewController(PetsListViewController(), animated: true)
            case .failure(let error):
                print (error.localizedDescription)
            }
        }
    }
}
