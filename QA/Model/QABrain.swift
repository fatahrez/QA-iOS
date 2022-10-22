//
//  QABrain.swift
//  QA
//
//  Created by Abdulfatah Mohamed on 22/10/2022.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation

struct QABrain {
    
    let path = Bundle.main.path(forResource: "data", ofType: "json")
    
    func fetchQuestions() {
        if let path = path {
            let url = URL(fileURLWithPath: path)
            performJsonParsing(with: url)
        } else {
            print("JSON file path invalid.")
        }
    }
    
    func performJsonParsing(with urlPath: URL) {
        
    }
    
}
