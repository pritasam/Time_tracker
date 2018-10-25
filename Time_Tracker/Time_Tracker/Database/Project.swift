//
//  AppDelegate.swift
//  Time_Tracker
//
//  Created by Pritam Bolenwar on 23/10/2018.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers  class Project: Object {

	 enum Property: String {
		case name,perhourRate, created,taskHour
	 }
	
	 dynamic var name = ""
	 dynamic var perhourRate = 0
	 dynamic var created = NSDate()
	 dynamic var taskHour =  List<TaskHour>()

	 override static func primaryKey() -> String? {
		return Project.Property.name.rawValue
	 }

	convenience init(projectname: String?, perhourRate: Int?) {
		self.init()
		self.name = projectname!
		self.perhourRate = perhourRate!
	}
	
	/* convenience init(_ projectname: String, perhourRate: Int) {
		self.init()
		self.name = projectname
		self.name = projectname
	 }*/
}

extension Project {
	static func all(in realm: Realm = try! Realm()) -> Results<Project> {
		return realm.objects(Project.self)
			.sorted(byKeyPath: Project.Property.created.rawValue)
		

	}
	
	static func projectExist (name: String,in realm: Realm = try! Realm()) -> Bool {
		return realm.object(ofType: Project.self, forPrimaryKey: name) != nil
	}
	
	static func getallProjects(in realm: Realm = try! Realm()) -> [Project] {			
		let results  =		 realm.objects(Project.self)
			.sorted(byKeyPath: Project.Property.created.rawValue)
		let array = Array(results) 
		return array;
	}
	
	// la fin

	
	@discardableResult
	static func add(projectname: String, perhourRate: Int,in realm: Realm = try! Realm())
		-> Project {
			let item = Project(projectname:projectname, perhourRate: perhourRate);
			try! realm.write {
				realm.add(item)
			}
			return item
	}
	
	func delete() {
		guard let realm = realm else { return }
		try! realm.write {
			realm.delete(self)
		}
	}
}


import Foundation
import RealmSwift

@objcMembers class TaskHour : Object {
	 dynamic var name = ""
	 dynamic var hours = 0	
	 dynamic var created = NSDate()
}


