//
//  ProjectListInteractor.swift
//  Time_tracker
//
//  Created by Pritam Bolenwar on 25/10/18.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

class ProjectListInteractor: ProjectListInteractorInputProtocol {
    weak var presenter: ProjectListInteractorOutputProtocol?

    func retrieveProjectList() {
        do {
			presenter?.didRetrieveProjects([])
        } catch {
			presenter?.didRetrieveProjects([])
        }
    }
}

