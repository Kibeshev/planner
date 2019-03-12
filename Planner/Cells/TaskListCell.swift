//
//  TaskListCell.swift
//  Planner
//
//  Created by Кирилл Кибешев on 01.03.2019.
//  Copyright © 2019 Кирилл Кибешев. All rights reserved.
//


 // мой класс для ячейки из сториборда
import UIKit

class TaskListCell: UITableViewCell {

    @IBOutlet weak var labelTaskName: UILabel!
    @IBOutlet weak var labelTaskCategory: UILabel!
    @IBOutlet weak var labelTaskDeadline: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
