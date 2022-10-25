//
//  CardViewController.swift
//  QA
//
//  Created by Abdulfatah Mohamed on 23/10/2022.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var questionLabel: UITextView!
    @IBOutlet var cardView: UIView!
    
    var question: QuestionItem?
    var cardViewColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = question?.q
        questionLabel.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        cardView.backgroundColor = cardViewColor
        cardView.tintColor = cardViewColor
    }
}

