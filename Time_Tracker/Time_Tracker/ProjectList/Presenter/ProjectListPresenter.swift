//
//  ProjectListPresenter.swift
//  Time_tracker
//
//  Created by Pritam Bolenwar on 25/10/18.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

class ProjectListPresenter: ProjectListPresenterProtocol {
    weak var view: ProjectListViewProtocol?
    var interactor: ProjectListInteractorInputProtocol?
    var wireFrame: ProjectListWireFrameProtocol?
    
    func viewDidLoad() {
        interactor?.retrieveProjectList()
    }
    
	func showProjectDetail(forProject project: Project) {
		wireFrame?.presentProjectDetailScreen(from: view!, forProject: project)
	}
}

extension ProjectListPresenter: ProjectListInteractorOutputProtocol {
    
	func didRetrieveProjects(_ projects: [Project]) {
		view?.showProjects(with: projects)
	}
       
    func onError() {
        view?.showError()
    }
    
}


