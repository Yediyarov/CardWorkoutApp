//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Khayal Yediyarov on 10.08.22.
//

import UIKit

class CardSelectionVC: UIViewController {
//    IBOutlet used for reaching to storyboard elements
    
    var cards: [UIImage] = Decs.allValues
    var timer: Timer!
    
    @IBOutlet weak var CardImageView: UIImageView!
    @IBOutlet weak var StopButton: UIButton!
    @IBOutlet weak var RulesButton: UIButton!
    @IBOutlet weak var RestartButton: UIButton!
    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in buttons{
            button.layer.cornerRadius = 8
        }
     }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        CardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func restartButtonTapped(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }
}
