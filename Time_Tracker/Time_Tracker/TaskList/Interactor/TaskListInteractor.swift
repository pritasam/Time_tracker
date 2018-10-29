//
//  TaskListInteractor.swift
//  Time_tracker
//
//  Created by Pritam Bolenwar on 25/10/18.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

class TaskListInteractor: TaskListInteractorInputProtocol {
    weak var presenter: TaskListInteractorOutputProtocol?
    func retrieveTaskList(_ project:Project) {
		let tasks = Task.getallTasks(project: project);
		presenter?.didRetrieveTasks(tasks);
    }
}
