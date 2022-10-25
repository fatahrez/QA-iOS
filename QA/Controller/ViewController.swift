//
//  ViewController.swift
//  QA
//
//  Created by apple on 23/09/2022.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit
import Koloda


class ViewController: UIViewController {

    @IBOutlet weak var questionDoneProgressLabel: UILabel!
    @IBOutlet weak var yourScoreLabel: UILabel!
    
    @IBOutlet weak var helpBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var kolodaView: KolodaView!
    
    var qaBrain = QABrain()
    var containers = [CardViewController]()
    
    lazy var slideInTransitioningDelegate = SlideInPresentationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        qaBrain.fetchQuestions()
        updateUI()
        
        loadContainerView()
        
        kolodaView.layer.cornerRadius = 20
        kolodaView.clipsToBounds = true
        
        kolodaView.dataSource = self
        kolodaView.delegate = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadContainerView()
        kolodaView.reloadData()
    }
    
    func loadContainerView() {
        for index in 0...(qaBrain.questionsList?.count ?? 0)-1 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CardViewController") as! CardViewController
            vc.question = qaBrain.questionsList![index]
            if index % 8 == 0 {
                vc.cardViewColor = UIColor.bgCardBlue
            } else if index == 1 {
                vc.cardViewColor = UIColor.bgCardPink
            } else if index % 7 == 0 {
                vc.cardViewColor = UIColor.bgCardBlack
            } else if index % 6 == 0 {
                vc.cardViewColor = UIColor.bgCardOrange
            } else if index % 5 == 0 {
                vc.cardViewColor = UIColor.bgCardTeal
            } else if index % 4 == 0 {
                vc.cardViewColor = UIColor.bgCardPink
            } else if index % 3 == 0 {
                vc.cardViewColor = UIColor.bgCardYellow
            } else if index % 2 == 0 {
                vc.cardViewColor = UIColor.bgCardRed
            } else {
                vc.cardViewColor = UIColor.bgCardGreen
            }
            self.addChildViewController(vc)
                
            containers.append(vc)
        }
    }
    
    @IBAction func answerBtnTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            kolodaView.swipe(.right)
            
        case 2:
            print("help")
        case 3:
            kolodaView.swipe(.left)
            
        default:
            print("unknown button pressed")
        }

    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        
        switch direction {
        case .right, .topRight, .bottomRight:
            qaBrain.checkAnswer("true")
            self.performSegue(withIdentifier: K.goToResultSegue, sender: self)
            
            qaBrain.nextQuestion()

            Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
            
        case .left, .topLeft, .bottomLeft:
            qaBrain.checkAnswer("false")
            self.performSegue(withIdentifier: K.goToResultSegue, sender: self)
            
            qaBrain.nextQuestion()

            Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
           
        default:
            break
        }
    }
    
    @objc func updateUI() {
        yourScoreLabel.text = "Score: \(qaBrain.getScore())"
        questionDoneProgressLabel.text = "Question: \(qaBrain.questionNumber+1) / \((qaBrain.questionsList?.count ?? 0))"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.goToResultSegue {
            let destinationVC = segue.destination as! AnswerViewController
            destinationVC.question = qaBrain.questionsList?[qaBrain.questionNumber]
            destinationVC.userGotIt = qaBrain.userGotIt
            slideInTransitioningDelegate.direction = .bottom
            slideInTransitioningDelegate.disableCompactHeight = true
            destinationVC.transitioningDelegate = slideInTransitioningDelegate
            destinationVC.modalPresentationStyle = .custom
        }
    }
    
    
}


// MARK: - Koloda View Delegate Section
extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func kolodaShouldApplyAppearAnimation(_ koloda: KolodaView) -> Bool {
        return true
    }
    
    func kolodaShouldMoveBackgroundCard(_ koloda: KolodaView) -> Bool {
        return false
    }
    
    func kolodaShouldTransparentizeNextCard(_ koloda: KolodaView) -> Bool {
        return false
    }
}


// MARK: - Koloda Data Source Section
extension ViewController: KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return qaBrain.questionsList?.count ?? 0
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {

        let container = containers[index]
        
        return container.view
    }
}

