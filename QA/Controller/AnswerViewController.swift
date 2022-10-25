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
    @IBOutlet weak var linkTableView: UITableView!
    
    var question: QuestionItem?
    var userGotIt: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        linkTableView.dataSource = self
        
        if userGotIt == true {
            userGotItLabel.text = "Your answer was right"
        } else {
            userGotItLabel.text = "Your answer was wrong"
        }
        answerLabel.text = question?.desp
        questionLabel.text = question?.q
    
        linksTextView.text = question?.link.joined(separator: "\n")
//        linkTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
                
//        loadLinks()
        
        setupGestureRecognizers()
    }
    

    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
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


// MARK: - Setup Table View for links
//extension AnswerViewController: UITableViewDataSource {
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return question?.link.count ?? 0
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let link = question?.link[indexPath.row] ?? ""
////
//////        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! LinkTableViewCell
////
//////        cell.text = link
//////        cell.linkLabel.text = link
////////        cell.linkLabel.backgroundColor = UIColor.white
//////        cell.linkLabel.textColor = UIColor.blue
//////        cell.linkLabel.isSelectable = false
//////        cell.linkLabel.isUserInteractionEnabled = true
////
//////        let attributedString = NSMutableAttributedString(string: "Just click here to register")
//////        let url = URL(string: "https://www.apple.com")!
////
////        // Set the 'click here' substring to be the link
//////        attributedString.setAttributes([.link: url], range: NSMakeRange(5, 10))
//////
//////        cell.linkLabel.attributedText = attributedString
//////        cell.linkLabel.isUserInteractionEnabled = true
//////        cell.linkLabel.isEditable = false
////        // Set how links should appear: blue and underlined
//////        cell.linkLabel.linkTextAttributes = [
//////            .link: UIColor.blue
//////        ]
////
////        return cell
////    }
//}
