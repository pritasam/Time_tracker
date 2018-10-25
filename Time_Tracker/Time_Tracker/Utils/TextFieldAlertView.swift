//
//  AlertView.swift
//  Time_Tracker
//
//  Created by Pritam Bolenwar on 25/10/2018.
//  Copyright © 2018 Pritam Bolenwar. All rights reserved.
//

import Foundation
import UIKit

func textFieldAlertView(_ title: String, isSecure: Bool = false, text: String? = nil, callback: @escaping (String,String) -> Void) {
	let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
	
	alert.addTextField(configurationHandler: { field in
		field.isSecureTextEntry = isSecure
		field.text = text
		field.placeholder = "Enter project name"

	})
	
	alert.addTextField(configurationHandler: { field in
		field.isSecureTextEntry = isSecure
		field.text = text
		field.placeholder = "Enter per hour rate"
	})
	
	alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
		guard let projectName = alert.textFields?.first?.text, !projectName.isEmpty else {
			textFieldAlertView(title, callback: callback)
			return
		}
		guard let perhourRate = alert.textFields?.last?.text, !perhourRate.isEmpty else {
			textFieldAlertView(title, callback: callback)
			return
		}

		callback(projectName,perhourRate)
	})
	let root = UIApplication.shared.keyWindow?.rootViewController
	root?.present(alert, animated: true, completion: nil)
}
