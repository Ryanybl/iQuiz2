//
//  DetailViewController.swift
//  iQuiz
//
//  Created by Ryan Liang on 11/7/17.
//  Copyright © 2017 Ryan Liang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var totalNumberOfQuestions = 2
    var numberOfCorrectAnswers = 0
    var selected : Int = 0
    var numberOfQuestionsLeft: Int = 1
    var correctAnswer : Int = 1
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    
    @IBAction func selected(_ sender: UIButton) {
        nextButton.isEnabled = true
        selected = sender.tag
        answer1.setImage(nil, for: .normal)
        answer2.setImage(nil, for: .normal)
        answer3.setImage(nil, for: .normal)
        answer4.setImage(nil, for: .normal)
        var button = self.view.viewWithTag(selected) as? UIButton
        button?.setImage(UIImage(named: "right"), for: .normal)
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        /*var data = [ "title":"Marvel Super Heroes", "desc": "Avengers, Assemble!",
            "questions":[
            [
            "text":"Who is Iron Man?",
            "answer":"1",
            "answers":[
            "Tony Stark",
            "Obadiah Stane",
            "A rock hit by Megadeth",
            "Nobody knows"
            ]
            ],
            [
            "text":"Who founded the X-Men?",
            "answer":"2",
            "answers":[
            "Tony Stark",
            "Professor X",
            "The X-Institute",
            "Erik Lensherr"
            ]
            ],
            [
            "text":"How did Spider-Man get his powers?",
            "answer":"1",
            "answers":[
            "He was bitten by a radioactive spider",
            "He ate a radioactive spider",
            "He is a radioactive spider",
            "He looked at a radioactive spider"
            ]
            ]
            ]
            ] as [String : Any]*/
        //var dataJson = try? JSONSerialization.data(withJSONObject: data)


    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAnswers" {
            let dest = segue.destination as! AnswersViewController
            dest.numberOfQuestionsLeft = numberOfQuestionsLeft
            dest.correctAnswer = correctAnswer
            dest.selected = selected
            dest.totalNumberOfQuestions = totalNumberOfQuestions
            dest.numberOfCorrectAnswers = numberOfCorrectAnswers

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        nextButton.isEnabled = false
        question.text = "Who is Iron Man?"
        answer1.setTitle("Tony Stark", for:.normal)
        answer2.setTitle("Professor X", for: UIControlState.normal)
        answer3.setTitle("A rock hit by Megadeth", for:.normal)
        answer4.setTitle("Nobody knows", for: UIControlState.normal)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: String? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

