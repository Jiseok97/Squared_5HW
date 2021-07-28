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
    
    
    
    // MARK: View UI Setting
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
    
    
    
    
    // MARK: 카카오톡 로그인 버튼
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
