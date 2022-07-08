//
//  ViewController.swift
//  MyVK
//
//  Created by Максим Марков on 20.05.2022.
//lesson 2

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var logoImage: UIImageView!{
        didSet{
         //   logoImage.layer.cornerRadius = self.logoImage.bounds.height/2
        }
    }
    @IBAction func unwindLogin(Segue: UIStoryboardSegue) {
    }
    @IBOutlet weak var viewSub: UIView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func pressedLoginButton(_ sender: Any) {
        

        if !checkUser() {
                    presentAlert()
        } else {
            viewAnimation()
        }
    }
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var loadOneView: UIView!
    @IBOutlet weak var loadTwoView: UIView!
    @IBOutlet weak var loadThreeView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    //MARK: -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        loginLabel.alpha = 0
        passwordLabel.alpha = 0
        passwordTextField.alpha = 0
    
        loginTextField.alpha = 0
        logoImage.alpha = 0
        loginButton.alpha = 0
        registerButton.alpha = 0
        forgotButton.alpha = 0
        
        
        //MARK: - animated logo
        let animateLogoImage = CASpringAnimation(keyPath: "position.y")
        animateLogoImage.fromValue = logoImage.bounds.height - view.bounds.height
        animateLogoImage.duration = 1
        
        logoImage.layer.add(animateLogoImage, forKey: nil)

        //MARK: - animated buttons
        let animateLoginButtonLogin = CASpringAnimation(keyPath: "position.y")
        animateLoginButtonLogin.fromValue = loginButton.bounds.height + view.bounds.height
        animateLoginButtonLogin.duration = 1
        let animateLoginButtonForgot = CASpringAnimation(keyPath: "position.y")
        animateLoginButtonForgot.fromValue = loginButton.bounds.height + view.bounds.height
        animateLoginButtonForgot.duration = 1
        let animateLoginButtonRegister = CASpringAnimation(keyPath: "position.y")
        animateLoginButtonRegister.fromValue = loginButton.bounds.height + view.bounds.height
        animateLoginButtonRegister.duration = 1
        loginButton.layer.add(animateLoginButtonLogin, forKey: nil)
        forgotButton.layer.add(animateLoginButtonForgot, forKey: nil)
        registerButton.layer.add(animateLoginButtonRegister, forKey: nil)
        
        UIView.animate(withDuration: 1,
                       delay: 0) { [weak self] in
            self?.logoImage.alpha = 1
        }
        UIView.animate(withDuration: 1,
                       delay: 0) { [weak self] in
            self?.loginButton.alpha = 1
            self?.forgotButton.alpha = 1
            self?.registerButton.alpha = 1

        }
        UIView.animate(withDuration: 1,
                       delay: 1) { [weak self] in
            self?.loginLabel.alpha = 1
            self?.passwordLabel.alpha = 1
            self?.loginTextField.alpha = 1
            self?.passwordTextField.alpha = 1
        }
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(recognizer)
       // heading.center.x  -= view.bounds.width
        
        loadOneView.alpha = 0
        loadTwoView.alpha = 0
        loadThreeView.alpha = 0

        
        loadOneView.layer.cornerRadius = 20
        loadTwoView.layer.cornerRadius = 20
        loadThreeView.layer.cornerRadius = 20
    }
    
    @objc func keyboardWasShown(notification: Notification) {
            // Получаем размер клавиатуры
    let info = notification.userInfo! as NSDictionary
    let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
    let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
            // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
    self.scrollView?.contentInset = contentInsets
    scrollView?.scrollIndicatorInsets = contentInsets }
        //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    
 
    //MARK: - private methods
    private func viewAnimation() {
        let viewHeight = view.bounds.height
        let viewWidth = view.bounds.width
        self.viewSub.alpha = 0.3
        
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.loadOneView.alpha = 1
            self?.loadThreeView.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.loadOneView.alpha = 0
                self?.loadTwoView.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: 0.5) { [weak self] in
                    self?.loadTwoView.alpha = 0
                    self?.loadThreeView.alpha = 1
                } completion: { _ in
                    UIView.animate(withDuration: 0.5) { [weak self] in
                        self?.loadOneView.alpha = 1
                        self?.loadThreeView.alpha = 0
                    } completion: { _ in
                        UIView.animate(withDuration: 0.5) { [weak self] in
                            self?.loadOneView.alpha = 0
                            self?.loadTwoView.alpha = 1
                        } completion: { _ in
                            UIView.animate(withDuration: 0.1) { [weak self] in
                                self?.loadTwoView.alpha = 0
                                self?.loadThreeView.alpha = 1
                            } completion: { [weak self] _ in
                                UIView.animate(withDuration: 0.1) { [weak self] in
                                    self?.loadThreeView.alpha = 0
                                } completion: { [weak self] _ in
                                UIView.animate(withDuration: 1) { [weak self] in
                                    self?.logoImage.center.y -= viewHeight
                                    
                                    self?.loginLabel.center.x -= viewWidth
                                    self?.loginTextField.center.x -= viewWidth
                                    
                                    self?.passwordLabel.center.x += viewWidth
                                    self?.passwordTextField.center.x += viewWidth
                                    
                                    self?.loginButton.center.y += viewHeight
                                    self?.forgotButton.center.y += viewHeight
                                    self?.registerButton.center.y += viewHeight
                                } completion: { [weak self] _ in
                                print("Login")
                                    self?.transition()
                                }
                                }
                    
                            }}}}
            }
        }

    }
    
    
    private func transition() {
        
        performSegue(withIdentifier: "goToMainSegue", sender: nil)
    }

    
    private func getRandomColor() -> UIColor {
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())
        
         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    @objc func onTap() {
//        let randomColor = getRandomColor()
//        self.view.backgroundColor=randomColor
        //viewSub.backgroundColor=randomColor

        self.view.endEditing(true)
        
    }
    
    private func checkUser() -> Bool {
        loginTextField.text == "admin" && passwordTextField.text == "123"
    }
    private func clearData(){
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    private func presentAlert(){
        let alertController = UIAlertController(
            title: "Ошибка",
            message: "Некорректный логин или пароль",
            preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .cancel)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

