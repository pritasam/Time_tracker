//
//  AlertView.swift
//  Time_Tracker
//
//  Created by Pritam Bolenwar on 25/10/2018.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

import Foundation
import UIKit

func textFieldAlertView(_ title: String, firstPlaceHoler: String? = "Enter project name",secondPlaceHoler: String? = "Enter per hour rate in $", text: String? = nil,callback: @escaping (String,String) -> Void) {
	let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
	
	alert.addTextField(configurationHandler: { field in
		field.text = text
		field.placeholder = firstPlaceHoler
	})
	
	alert.addTextField(configurationHandler: { field in
		field.text = text
		field.placeholder =  secondPlaceHoler 
	})
	alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
		guard let firstFieldName = alert.textFields?.first?.text, !firstFieldName.isEmpty else {
			//textFieldAlertView(title, callback: callback)
			showAlertView("Please enter the valid Name");
			return
		}
		guard let secondFieldName = alert.textFields?.last?.text, !secondFieldName.isEmpty else {
			showAlertView("Please enter the valid Hours");
			return
		}
		callback(firstFieldName,secondFieldName)
	})
	let root = UIApplication.shared.keyWindow?.rootViewController
	root?.present(alert, animated: true, completion: nil)
}


func showAlertView(_ title: String, text: String? = nil) {
	let alert = UIAlertController(title: title, message: text, preferredStyle: .alert) 
	alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in 
	}))	
	let root = UIApplication.shared.keyWindow?.rootViewController
	root?.present(alert, animated: true, completion: nil)
}



