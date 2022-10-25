//
//  HelpViewController.swift
//  QA
//
//  Created by Abdulfatah Mohamed on 25/10/2022.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureRecognizers()
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

// MARK: - Extension for tap gesture to dismiss
private extension HelpViewController {
    func setupGestureRecognizers() {
      let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestureRecognizer:)))
      view.addGestureRecognizer(tapRecognizer)
    }
}

// MARK: - GestureRecognizerSelectors
private extension HelpViewController {
    @objc func handleTap(gestureRecognizer: UITapGestureRecognizer) {
        dismiss(animated: true)
    }
}
