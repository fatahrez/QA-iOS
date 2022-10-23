//
//  CardViewController.swift
//  QA
//
//  Created by Abdulfatah Mohamed on 23/10/2022.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    var question: QuestionItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = question?.q
    }
}

