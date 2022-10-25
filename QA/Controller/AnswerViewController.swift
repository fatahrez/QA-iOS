//
//  AnswerViewController.swift
//  QA
//
//  Created by Abdulfatah Mohamed on 23/10/2022.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var userGotItLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var linksTextView: UITextView!
    
    var question: QuestionItem?
    var userGotIt: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userGotIt == true {
            userGotItLabel.text = "Your answer is right!"
            userGotItLabel.textColor = .systemGreen
            userGotItLabel.layer.borderColor = UIColor.systemGreen.cgColor
            userGotItLabel.layer.borderWidth = 2.0
            userGotItLabel.layer.cornerRadius = 10
            userGotItLabel.layer.masksToBounds = true
        } else {
            userGotItLabel.text = "Your answer is wrong!"
            userGotItLabel.textColor = .systemRed
            userGotItLabel.layer.borderColor = UIColor.systemRed.cgColor
            userGotItLabel.layer.borderWidth = 2.0
            userGotItLabel.layer.cornerRadius = 10
            userGotItLabel.layer.masksToBounds = true
        }
        
        answerLabel.text = question?.desp
        questionLabel.text = question?.q
    
        linksTextView.text = question?.link.joined(separator: "\n\n")
        
        setupGestureRecognizers()
    }
    

    @IBAction func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

// MARK: - Extension for tap gesture to dismiss
private extension AnswerViewController {
    func setupGestureRecognizers() {
      let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestureRecognizer:)))
      view.addGestureRecognizer(tapRecognizer)
    }
}

// MARK: - GestureRecognizerSelectors
private extension AnswerViewController {
    @objc func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
}
