//
//  TaskListPresenter.swift
//  Time_tracker
//
//  Created by Pritam Bolenwar on 25/10/18.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

class TaskListPresenter: TaskListPresenterProtocol {
    weak var view: TaskListViewProtocol?
    var interactor: TaskListInteractorInputProtocol?
    var wireFrame: TaskListWireFrameProtocol?
    
    func viewDidLoad(_ project:Project) {
        interactor?.retrieveTaskList(project)
    }
    

	func showTaskDetail(forTask task: Task) {
		wireFrame?.presentTaskDetailScreen(from: view!, forTask: task)
	}
}

extension TaskListPresenter: TaskListInteractorOutputProtocol {
    
	func didRetrieveTasks(_ tasks: [Task]) {
		view?.showTasks(with: tasks)
	}
       
    func onError() {
        view?.showError()
    }
    
}


