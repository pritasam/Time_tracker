//
//  ProjectListView.swift
//  Time_tracker
//
//  Created by Pritam Bolenwar on 25/10/18.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

import UIKit

class ProjectListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: ProjectListPresenterProtocol?
    var ProjectList: [Project] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
	
	@IBAction func addProject() {
		textFieldAlertView("Add Project") { projectname,perhourCharge  in
			guard let hourlyRate = Int(perhourCharge ) else {
				showAlertView("Please enter correct details", text: "Per hour rate should be more than 0 and Integer")
				return
			}
			if Project.projectExist(name: projectname)   {
				showAlertView("Please enter correct details", text: "Project already exists")
				return
			}
			Project.add(projectname: projectname, perhourRate: hourlyRate)
			self.presenter?.viewDidLoad()
		}
	}
    
}

extension ProjectListView: ProjectListViewProtocol {
    
    func showProjects(with projects: [Project]) {
        ProjectList = projects
		if ProjectList.count <= 0 {
			tableView.isHidden = true
		} else {
			tableView.isHidden = false
		}
        tableView.reloadData()
    }
    
    func showError() {
    }
}

extension ProjectListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as! ProjectTableViewCell
        let project = ProjectList[indexPath.row]
        cell.set(forProject: project)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProjectList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		var project =  ProjectList[indexPath.row]
		presenter?.showProjectDetail(forProject: project);

    }
    
}
