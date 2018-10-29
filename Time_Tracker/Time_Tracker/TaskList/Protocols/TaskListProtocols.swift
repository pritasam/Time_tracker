//
//  TaskListProtocols.swift
//  Time_tracker
//
//  Created by Pritam Bolenwar on 25/10/18.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

import UIKit

protocol TaskListViewProtocol: class {
    var presenter: TaskListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showTasks(with tasks: [Task])
    func showError()
}

protocol TaskListWireFrameProtocol: class {
    static func createTaskListModule(_ project:Project) -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentTaskDetailScreen(from view: TaskListViewProtocol, forTask task: Task)
}

protocol TaskListPresenterProtocol: class {
    var view: TaskListViewProtocol? { get set }
    var interactor: TaskListInteractorInputProtocol? { get set }
    var wireFrame: TaskListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad(_ project:Project)
    func showTaskDetail(forTask task: Task)
}

protocol TaskListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveTasks(_ tasks: [Task])
    func onError()
}

protocol TaskListInteractorInputProtocol: class {
    var presenter: TaskListInteractorOutputProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func retrieveTaskList(_ project:Project)
}

