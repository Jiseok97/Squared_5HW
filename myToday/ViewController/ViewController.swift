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
    @IBOutlet weak var bgImgView: UIImageView!
    
    var gradientLayer : CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setGradient()
        setUI()
    }
    
    // MARK: View UI Setting
    func setUI() {
        self.nextVCBtn.layer.zPosition = 999
        self.kakaoView.layer.zPosition = 999
        self.emailTF.layer.zPosition = 999
        self.passwordTF.layer.zPosition = 999
        
        self.bgImgView.image = UIImage(named: "bgImg")
        self.kakaoView.layer.cornerRadius = 20
        self.nextVCBtn.layer.cornerRadius = 20
    }
    
    
    // MARK: Gradient
//    func setGradient() {
//        self.gradientLayer = CAGradientLayer()
//        self.gradientLayer.frame = self.view.bounds
//        self.gradientLayer.colors = [ UIColor.systemTeal.cgColor,
//                                   UIColor.systemGreen.cgColor,
//                                   UIColor.white.cgColor]
//        self.view.layer.addSublayer(self.gradientLayer)
//    }
    
    
    
    
    
    // MARK: 카카오톡 로그인 버튼
    @IBAction func kakaoLoginBtn(_ sender: Any) {
        UserApi.shared.loginWithKakaoAccount {( OAuthToken, error ) in
            if let error = error {
                print(error)
            }
            else{
                print("성공!")

                // MARK: Token
                UserApi.shared.accessTokenInfo {( AccessTokenInfo, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("show Token")
                        _ = AccessTokenInfo
                    }
                }
                _ = OAuthToken
            }
        }
    }
     
    
    // MARK: 임시 방편 페이지 넘기기
    @IBAction func changeVC(_ sender: Any) {
        let sb = UIStoryboard(name: "Weather", bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: "WeatherViewController") as? WeatherViewController else { fatalError()}
//        let navi = UINavigationController(rootViewController: WeatherViewController)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
}
