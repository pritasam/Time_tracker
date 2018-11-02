//
//  ProjectListProtocols.swift
//  Time_tracker
//
//  Created by Pritam Bolenwar on 25/10/18.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

import UIKit

protocol ProjectListViewProtocol: class {
    var presenter: ProjectListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showProjects(with projects: [Project])
    func showError()
}

protocol ProjectListWireFrameProtocol: class {
    static func createProjectListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentProjectDetailScreen(from view: ProjectListViewProtocol, forProject project: Project)
}

protocol ProjectListPresenterProtocol: class {
    var view: ProjectListViewProtocol? { get set }
    var interactor: ProjectListInteractorInputProtocol? { get set }
    var wireFrame: ProjectListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showProjectDetail(forProject project: Project)
}

protocol ProjectListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveProjects(_ projects: [Project])
    func onError()
}

protocol ProjectListInteractorInputProtocol: class {
    var presenter: ProjectListInteractorOutputProtocol? { get set }
	var dataManager: ProjectDataManageProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func retrieveProjectList()
}

protocol ProjectDataManageProtocol: class {
	// Interactor -> Datamanager
	var interactor: ProjectListInteractorInputProtocol? { get set }
	func getProjectList() -> [Project]
}

