//
//  TaskTableViewCell.swift
//  FinalProject_Friends_iOS
//
//  Created by Roch on 19/01/2022.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var dueDate: UILabel!
    @IBOutlet weak var isCompleted: UIButton!
    
    var radioButtonTapped: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(obj: Task){
        isCompleted.isSelected = obj.isCompleted
        taskTitle.text = obj.title
        if obj.isCompleted {
            dueDate.textColor = UIColor.systemGreen
            dueDate.text = "Completed"
        } else {
            dueDate.textColor = UIColor.systemRed
            let date = obj.endDate!.toDate(dateFormat: "yyyy-MM-dd HH:mm:ss Z")
            let dateString = date?.toFormattedDate()
            dueDate.text = "Due Date: " + dateString!
        }
    }
    
    @IBAction func isCompletedHandler(_ sender: UIButton) {
        self.radioButtonTapped?()
    }
    
}
