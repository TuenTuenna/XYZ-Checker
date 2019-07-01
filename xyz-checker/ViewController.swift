//
//  ViewController.swift
//  xyz-checker
//
//  Created by Jeff Jeong on 2019. 7. 1..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

import UIKit

// for catching motion data
import CoreMotion


class ViewController: UIViewController {

    // ui 컴포넌트
    @IBOutlet weak var xLabel: UILabel!
    
    @IBOutlet weak var yLabel: UILabel!
    
    @IBOutlet weak var zLabel: UILabel!
    
    // 모션매니저 선언
    var motionManager: CMMotionManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 모션 매니저 인스턴스화
        motionManager = CMMotionManager()
        
        // accelerometer 를 갱신한다.
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
        
    }
    
    // 라벨을 갱신하는 함수
    func updateLabels(data: CMAccelerometerData?, error: Error?){
        guard let accelerometorData = data else {
            return
        }
//        print(accelerometorData)
        
        // 넘버 포매터 인스턴스화
        let formatter = NumberFormatter()
        // 숫자형식
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        // 가속도계 값 가져오기
        
        let x = formatter.string(for: accelerometorData.acceleration.x)!
        let y = formatter.string(for: accelerometorData.acceleration.y)!
        let z = formatter.string(for: accelerometorData.acceleration.z)!
 
        
//        print(x, y, z)
        
        // ui 에 반영
        xLabel.text = "X: \(x)"
        yLabel.text = "Y: \(y)"
        zLabel.text = "Z: \(z)"
        
    }
}









