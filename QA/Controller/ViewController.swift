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

    @IBOutlet weak var helpBtn: UIImageView!
    @IBOutlet weak var falseBtn: UIImageView!
   
    @IBOutlet weak var trueBtn: UIImageView!
    
    @IBOutlet weak var kolodaView: KolodaView!
    var quetionsResult: QuestionsResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        parseJSON()
        
        kolodaView.layer.cornerRadius = 20
        kolodaView.clipsToBounds = true
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
    
    }
        
    private func parseJSON() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        
        
        do {
            let jsonData = try Data(contentsOf: url)
            print(jsonData)
            quetionsResult = try JSONDecoder().decode(QuestionsResult.self, from: jsonData)
    
            if let result = quetionsResult {
                print(result.Question)
            }
            else {
                print("Failed to parse")
            }
            return
        }
        catch {
            print("Error: \(error)")
        }
    }
    
}


// MARK: - Koloda View Delegate Section
extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        let alert = UIAlertController(title: quetionsResult?.Question[0].q, message: quetionsResult?.Question[index].q, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}


// MARK: - Koloda Data Source Section
extension ViewController: KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return quetionsResult?.Question.count ?? 0
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        view.center = CGPoint(x: 160, y: 285)
        view.textAlignment = .center
        view.text = quetionsResult?.Question[index].q
        return view
    }
}

