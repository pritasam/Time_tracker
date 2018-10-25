//
//  ProjectListWireFrame.swift
//  Time_tracker
//
//  Created by Pritam Bolenwar on 25/10/18.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

import UIKit

class ProjectListWireFrame: ProjectListWireFrameProtocol {
    
    class func createProjectListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ProjectsNavigationController")
        if let view = navController.childViewControllers.first as? ProjectListView {
            let presenter: ProjectListPresenterProtocol & ProjectListInteractorOutputProtocol = ProjectListPresenter()
            let interactor: ProjectListInteractorInputProtocol  = ProjectListInteractor()
            let wireFrame: ProjectListWireFrameProtocol = ProjectListWireFrame()
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
	
	func presentProjectDetailScreen(from view: ProjectListViewProtocol, forProject project: Project) {
	}

}
