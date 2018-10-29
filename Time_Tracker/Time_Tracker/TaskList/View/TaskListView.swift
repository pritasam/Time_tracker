//
//  TaskListView.swift
//  Time_tracker
//
//  Created by Pritam Bolenwar on 25/10/18.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

import UIKit

class TaskListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var invoiceButton: UIButton!
	@IBOutlet weak var totalHoursOnProject: UILabel!

    var presenter: TaskListPresenterProtocol?
    var TaskList: [Task] = []
	var project: Project?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(project!)
        tableView.tableFooterView = UIView()
		self.navigationItem.title = "Tasks"
    }
	
	@IBAction func createInvoice() {
		
	}
	
	@IBAction func addTask() {
		textFieldAlertView("Add Task",firstPlaceHoler:"Add Task Name", secondPlaceHoler: "Add hours") { taskname,perhourCharge  in
			guard let hoursSpent = Int(perhourCharge )  else {
				showAlertView("Please enter correct details", text: "Per hour rate should be more than 0 and Integer")
				return
			}
			if   taskname.count < 0 {
				showAlertView("Please enter correct details", text: "Task name is wrong")
				return
			}
			Task.add(taskname: taskname, hoursSpent: hoursSpent, project: self.project!)
			self.presenter?.viewDidLoad(self.project!)
		}
	}
}

extension TaskListView: TaskListViewProtocol {
    
    func showTasks(with tasks: [Task]) {
        TaskList = tasks
		if TaskList.count <= 0 {
			tableView.isHidden = true
			invoiceButton.isHidden = true
			totalHoursOnProject.isHidden = true
		} else {
			var hour = 0;
			for task in tasks {
				hour = hour + task.hours ;
			}
			tableView.isHidden = false
			invoiceButton.isHidden = false
			totalHoursOnProject.isHidden = false
			totalHoursOnProject.text = "Total Hours : " + String(hour)
		}
        tableView.reloadData()
    }
    
    func showError() {
    }
}

extension TaskListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskListTableViewCell
        let task = TaskList[indexPath.row]
        cell.set(forTask: task)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
