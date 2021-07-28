//
//  ViewController.swift
//  myToday
//
//  Created by 이지석 on 2021/07/26.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser


class ViewController: UIViewController {
    
    @IBOutlet weak var nextVCBtn: UIButton!
    @IBOutlet weak var kakaoBtn: UIButton!
    
    
    var gradientLayer : CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradient()
        setZPosition()
        
    }
    
    func setZPosition() {
        self.nextVCBtn.layer.zPosition = 999
        self.kakaoBtn.layer.zPosition = 999
        
    }
    
    func setGradient() {
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer.frame = self.view.bounds
        self.gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemTeal.cgColor,
                                     UIColor.white.cgColor]
        self.view.layer.addSublayer(self.gradientLayer)
    }
    
    
    
    @IBAction func kakaoLoginBtn(_ sender: Any) {
        
        
            UserApi.shared.loginWithKakaoAccount {( OAuthToken, error ) in
                if let error = error {
                    print(error)
                }
                else{
                    print("성공!")
                    
                    
                    _ = OAuthToken
                }
            }
        
        // 시뮬레이터에 카카오톡 설치 되었을 경우
        // 카카오톡 설치 여부 확인
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//            UserApi.shared.loginWithKakaoTalk {( OAuthToken, error ) in
//                if let error = error {
//                    print(error)
//                } else {
//                    print("로그인 성공")
//
//                    _ = OAuthToken
//                }
//            }
//        }
//        
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//
//            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoAccount() Success")
//
//                    _ = oauthToken
//                }
//            }
//        }
        
//
    }
    
    
    
    @IBAction func changeVC(_ sender: Any) {
        let sb = UIStoryboard(name: "Weather", bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: "WeatherViewController") as? WeatherViewController else { fatalError()}
//        let navi = UINavigationController(rootViewController: WeatherViewController)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
}
