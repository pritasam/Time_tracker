//
//  ProjectListInteractor.swift
//  Time_tracker
//
//  Created by Pritam Bolenwar on 25/10/18.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

class DataManager: ProjectDataManageProtocol {
	weak var interactor: ProjectListInteractorInputProtocol?
    func getProjectList() -> [Project] {
		let projects = Project.getallProjects();
		return projects;
    }
}

