//
//  LoginViewController.swift
//  CatStaGram
//
//  Created by 김예린 on 2022/09/01.
//

import UIKit

class LoginViewController: UIViewController {
    
    var email = String()
    var password = String()
    var userInfo: UserInfo?
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAttribute()
    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // 옵셔널 - 값이 있을수도 없을수도
        let text = sender.text ?? ""
        
//        if text.isValidEmail() {
//            self.loginButton.backgroundColor = UIColor(named: "facebookColor")
//        } else {
//            self.loginButton.backgroundColor = UIColor(named: "disabledButtonColor")
//        }
        
        self.loginButton.backgroundColor
        = text.isValidEmail() ? UIColor(named: "facebookColor") : UIColor(named: "disabledButtonColor")
        
        self.email = text
    }

    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        self.loginButton.backgroundColor
        = text.count > 2 ? UIColor(named: "facebookColor") : UIColor(named: "disabledButtonColor")

        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        // 회원가입정보를 전달받아서 그것과 textField 데이터가 일치하면, 로그인이 되어야 한다.
        guard let userInfo = userInfo else { return }
        
        if userInfo.email == self.email
            && userInfo.password == self.password {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        } else {

        }

    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        // 화면 전환
        // 1 스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2 뷰 컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3 화면 전환 메소드를 이용해 화면을 전환
        // self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        // ARC -> 강한 참조/ 약한 참조 -> ARC 낮춰줌
        registerViewController.userInfo = { [weak self] (userInfo) in
//            print(userInfo)
            self?.userInfo = userInfo
            
        }
    }

    private func setupAttribute() {
        // registerButton
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor(named: "facebookColor")!
        
        let attributes = generateButtonAttribute(
            self.registerButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)

    }
    
}
