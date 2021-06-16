//
//  ViewController.swift
//  VKClient
//
//  Created by Илья Лебедев on 27.05.2021.
//

import UIKit

class LoginFormViewController: UIViewController {
    @IBOutlet weak var vkImage: UIImageView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var pressButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!
    
    let fromLoginToTabBarSegue = "fromLoginToTabBarSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        pressButton.layer.cornerRadius = 10
        loginTextField.layer.cornerRadius = 10
        passwordTextField.layer.cornerRadius = 10
        vkImage.layer.cornerRadius = 45
    }

    @IBAction func pressLoginButton(_ sender: Any) {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        if login == "" && password == "" {
            
        }
        dowloadIndicatorAnimate()
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()
        if !checkResult {
            showLoginError()
        }
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = loginTextField.text,
              let password = passwordTextField.text else {return false}
        if login == "" && password == "" {
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func pointPrepare(cView: UIView, delay: Double){
        cView.backgroundColor = .black
        view.addSubview(cView)
        
        UIView.animate(withDuration: 0.5, delay: delay, options: [.repeat, .autoreverse]) {
            cView.alpha = 0
        }
    }
    
    
    let pointOne = UIView(frame: CGRect(x: 200, y: 580, width: 6, height: 6))
    let pointTwo = UIView(frame: CGRect(x: 207, y: 580, width: 6, height: 6))
    let pointThree = UIView(frame: CGRect(x: 214, y: 580, width: 6, height: 6))
    
    func dowloadIndicatorAnimate() {
        pointPrepare(cView: pointOne, delay: 0)
        pointPrepare(cView: pointTwo, delay: 0.2)
        pointPrepare(cView: pointThree, delay: 0.4)
    }
}

