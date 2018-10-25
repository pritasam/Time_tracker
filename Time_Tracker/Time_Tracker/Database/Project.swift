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
		case name, companyName, created,taskHour
	 }
	
	 dynamic var name = ""
	 dynamic var companyName = ""
	 dynamic var created = NSDate()
	 dynamic var taskHour =  List<TaskHour>()

	 override static func primaryKey() -> String? {
		return Project.Property.name.rawValue
	 }

	 convenience init(_ text: String) {
		self.init()
		self.name = text
	 }
}

extension Project {
	static func all(in realm: Realm = try! Realm()) -> Results<Project> {
		return realm.objects(Project.self)
			.sorted(byKeyPath: Project.Property.created.rawValue)
	}
	
	@discardableResult
	static func add(text: String, in realm: Realm = try! Realm())
		-> Project {
			let item = Project(text)
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


