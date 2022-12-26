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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // 옵셔널
        let text = sender.text ?? ""
        //print(text)
        self.email = text
    }

    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        //print(text)
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        
    }
    
    @IBAction func registerButtonDidTap(_ sender: UIButton) {
        // 화면 전환
        // 1 스토리보드 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2 뷰 컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3 화면 전환 메소드를 이용해 화면을 전환
        //self.present(registerViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
}
