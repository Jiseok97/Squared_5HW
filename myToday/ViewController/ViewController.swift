//
//  ViewController.swift
//  myToday
//
//  Created by 이지석 on 2021/07/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func changeVC(_ sender: Any) {
        let sb = UIStoryboard(name: "Weather", bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: "WeatherViewController") as? WeatherViewController else { fatalError()}
//        let navi = UINavigationController(rootViewController: WeatherViewController)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)

        
    }
    
}
