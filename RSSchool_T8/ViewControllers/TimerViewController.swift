//
//  TimerViewController.swift
//  RSSchool_T8
//
//  Created by Vitaly Nabarouski on 7/20/21.
//

import UIKit


@objc class TimerViewController: UIViewController {

    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var timerLabel: UILabel!
    var timer: TimeInterval = 2.4
    @objc var saveCallback:( (TimeInterval) -> Void )?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }
    
    func configureView() {
        self.view.backgroundColor = UIColor.white
        self.view.layer.cornerRadius = 50.0
        self.view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        self.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.view.layer.shadowRadius = 8
        self.view.layer.shadowOpacity = 0.25
        self.view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func timerSliderValueChanged(_ sender: Any) {
        timer = Double(timerSlider.value)
        timerLabel.text = String("\(timer)".prefix(4)) + " s"
    }
    
    @IBAction func saveButtonTaped(_ sender: Any) {
        self.saveCallback?(timer)
    }
    
    
    

}
