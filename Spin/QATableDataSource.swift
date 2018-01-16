//
//  QATableDataSource.swift
//  Spin
//
//  Created by Mohamed Salah on 2/10/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation

class QATableDataSource : NSObject, UITableViewDataSource {
    
    //MARK: - Variables
    let CELL_IDENTIFIER = "QATableViewCell"
    var stateController : QAStateController!
    
    //MARK: - Init
    init(stateController : QAStateController) {
        self.stateController = stateController
    }
    
    //MARK: - Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateController.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! QATableViewCell
        
        let currentQuestion = stateController.questions[indexPath.row]
        
        cell.questionLabel.text = currentQuestion.question
        cell.answerLabel.text = currentQuestion.answer
        cell.labelDate.text = currentQuestion.createdDate
        
        return cell
    }
}
