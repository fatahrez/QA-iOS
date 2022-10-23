//
//  QABrain.swift
//  QA
//
//  Created by Abdulfatah Mohamed on 22/10/2022.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation

struct QABrain {
    
    var questionsList: [QuestionItem]?
    let path = Bundle.main.path(forResource: "data", ofType: "json")
    var userGotIt: Bool?
    
    mutating func fetchQuestions() {
        if let path = path {
            let url = URL(fileURLWithPath: path)
            var questions = performJsonParsing(with: url)?.Question.shuffled()
            if let questions = questions {
                questionsList = questions
            } else {
                print("Something went wrong")
                questionsList = nil
            }
        } else {
            print("JSON file path invalid.")
            questionsList = nil
        }
    }
    
    func performJsonParsing(with urlPath: URL) -> QuestionsResult? {
        do {
            let jsonData = try Data(contentsOf: urlPath)
            print(jsonData)
            var questionsResult = try JSONDecoder().decode(QuestionsResult?.self, from: jsonData)
    
            if let result = questionsResult {
                questionsResult = result
            }
            else {
                print("Failed to parse")
                return nil
            }
            return questionsResult ?? nil
        }
        catch {
            print("Error: \(error)")
            return nil
        }
    }
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) {
        if(questionNumber < (questionsList?.count ?? 0)) {
            if userAnswer == questionsList?[questionNumber].answer {
                score += 1
                userGotIt = true
            } else {
                userGotIt = false
            }
        } else {
            userGotIt = false
        }

    }
    
    mutating func nextQuestion() {
        if questionNumber < (questionsList?.count ?? 0)-1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> Int {
        
        return score
    }
}
