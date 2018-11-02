//
//  Time_TrackerTests.swift
//  Time_TrackerTests
//
//  Created by Pritam Bolenwar on 23/10/2018.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

import XCTest
@testable import Time_Tracker

class TestDataManager: ProjectDataManageProtocol {
	weak var interactor: ProjectListInteractorInputProtocol?
	
	func getProjectList() -> [Project] {
		let project  =  Project()
		project.created = Date() as NSDate
		project.name = "Unwrap"
		return [project]
	}
}

class Time_TrackerTests: XCTestCase {
    
	var projects:[Project]?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
	
	func testInteractorRetriveDataMethodSuccessful() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
		let  testDataManager = TestDataManager()
		let interactor = ProjectListInteractor();
		interactor.dataManager =  testDataManager
		interactor.presenter =  self
		let presenter = ProjectListPresenter();
		presenter.interactor = interactor;
	    // presenter.viewDidLoad();
		interactor.retrieveProjectList()
		XCTAssert("Unwrap" == projects?.first?.name)
	}
	
	func testInteractorRetriveDataMethodWithWrongData() {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
		let  testDataManager = TestDataManager()
		let interactor = ProjectListInteractor();
		interactor.dataManager =  testDataManager
		interactor.presenter =  self
		let presenter = ProjectListPresenter();
		presenter.interactor = interactor;
		// presenter.viewDidLoad();
		interactor.retrieveProjectList()
		XCTAssert("Unwraps" != projects?.first?.name)
	}
	
	
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

extension  Time_TrackerTests: ProjectListInteractorOutputProtocol {
	func didRetrieveProjects(_ projects: [Project]) {
		self.projects = projects
	 }

	func onError() {
		
	}
	
}
