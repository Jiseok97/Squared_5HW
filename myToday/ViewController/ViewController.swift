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
    
    
    @IBAction func kakaoLoginBtn(_ sender: Any) {
        
        // 시뮬레이터에 카카오톡 설치 되었을 경우
        // 카카오톡 설치 여부 확인
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoTalk() success")
//
//                    _ = oauthToken
//                }
//
//            }
//        }
//        
        if (UserApi.isKakaoTalkLoginAvailable()) {

            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() Success")

                    _ = oauthToken
                }
            }

        }
    }
    
    
    
    @IBAction func changeVC(_ sender: Any) {
        let sb = UIStoryboard(name: "Weather", bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: "WeatherViewController") as? WeatherViewController else { fatalError()}
//        let navi = UINavigationController(rootViewController: WeatherViewController)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
}
