//
//  Strings+extension.swift
//  HooliganDAZNApp
//
//  Created by Thanyani Tshikonwani on 2022/08/07.
//

import Foundation

extension String {
	static let getEventsUrl = "https://us-central1-dazn-sandbox.cloudfunctions.net/getEvents"
	static let getScheduleUrl = "https://us-central1-dazn-sandbox.cloudfunctions.net/getSchedule"
static func getDate(inputDate: String) -> String {
		let today = Date()
		
		let olDateFormatter = DateFormatter()
	olDateFormatter.dateFormat = ""
		
		let oldDate = olDateFormatter.date(from: inputDate)
		
		let convertDateFormatter = DateFormatter()
		convertDateFormatter.dateFormat = "MMM dd yyyy"
		
		let timeFormat = DateFormatter()
		timeFormat.dateFormat = "HH:mm a"
		
		print(timeFormat.string(from: oldDate ?? Date()))
		
		if convertDateFormatter.string(from: today ) == convertDateFormatter.string(from: oldDate ?? Date()){
			return "Today \(timeFormat.string(from: oldDate ?? Date()))"
		} else {
			return convertDateFormatter.string(from: oldDate ?? Date())
		}
	}
	
}



