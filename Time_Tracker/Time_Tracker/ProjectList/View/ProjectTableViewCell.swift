//
//  ProjectTableViewCell.swift
//  Time_tracker
//
//  Created by Pritam Bolenwar on 19/02/17.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var projectNameLabel: UILabel!
	@IBOutlet weak var hoursLabel: UILabel!

    func set(forProject project: Project) {
        self.selectionStyle = .none
		projectNameLabel?.text = "Project Name:   " + project.name
		hoursLabel?.text = "Hourly Rate:   " + String(project.perhourRate) + " $"
	}
}
