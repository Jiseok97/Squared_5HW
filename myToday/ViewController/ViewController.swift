//
//  ViewController.swift
//  myToday
//
//  Created by 이지석 on 2021/07/26.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon


class ViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var nextVCBtn: UIButton!
    @IBOutlet weak var kakaoBtn: UIButton!
    @IBOutlet weak var kakaoView: UIView!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var bgImage: UIImageView!
    
    var gradientLayer : CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    // MARK: View UI Setting
    func setUI() {
        self.nextVCBtn.layer.zPosition = 999
        self.kakaoView.layer.zPosition = 999
        self.emailTF.layer.zPosition = 999
        self.passwordTF.layer.zPosition = 999
        self.logoImg.layer.zPosition = 999
        self.bgImageView.layer.zPosition = 0
        self.bgImageView.image = UIImage(named: "splashImg")
        
        
        
        self.kakaoView.layer.cornerRadius = 20
        self.nextVCBtn.layer.cornerRadius = 20
    }
    
    
    
    // MARK: 카카오톡 로그인 버튼
    @IBAction func kakaoLoginBtn(_ sender: Any) {
        UserApi.shared.loginWithKakaoAccount {( OAuthToken, error ) in
            if let error = error {
                print(error)
            }
            else{
                print("성공!")
                // MARK: Token
//                UserApi.shared.accessTokenInfo {( AccessTokenInfo, error) in
//                    if let error = error {
//                        print(error)
//                    }
//                    else {
//                        print("show Token")
//                        _ = AccessTokenInfo
//                    }
//                }
                
                _ = OAuthToken
                
               let vc = TestViewController()
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true)
            }
        }
    }
     
    
    // MARK: 임시 방편 페이지 넘기기
    @IBAction func changeVC(_ sender: Any) {
        let sb = UIStoryboard(name: "Weather", bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: "WeatherViewController") as? WeatherViewController else { fatalError()}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
}
