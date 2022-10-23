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
    @IBOutlet weak var linkTableView: UITableView!
    
    var question: QuestionItem?
    var userGotIt: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        linkTableView.dataSource = self
        
        if userGotIt == true {
            userGotItLabel.text = "Your answer was right"
        } else {
            userGotItLabel.text = "Your answer was wrong"
        }
        answerLabel.text = question?.desp
        questionLabel.text = question?.q
        
        linkTableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadLinks()
        
        setupGestureRecognizers()
    }
    
    func loadLinks() {
        DispatchQueue.main.async {
            self.linkTableView.reloadData()
            let indexPath = IndexPath(row: (self.question?.link.count ?? 0) - 1, section: 0)
            self.linkTableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
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
extension AnswerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question?.link.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let link = question?.link[indexPath.row]
        
        let attributedString = NSMutableAttributedString(string: link ?? "")
        attributedString.setAttributes([.link: link ?? ""], range: NSMakeRange(0, link?.count ?? 0))
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! LinkTableViewCell
        cell.linkLabel.attributedText = attributedString
        cell.linkLabel.isUserInteractionEnabled = true
        cell.linkLabel.isEditable = false
        
        return cell
    }
}
