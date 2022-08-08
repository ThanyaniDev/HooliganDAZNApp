//
//  DAZNServices.swift
//  HooliganDAZNApp
//
//  Created by Thanyani Tshikonwani on 2022/08/07.
//

import Foundation

protocol DAZNServices {
	func getEvents(completion: @escaping (Result<[Events], Error>) -> Void)
	func getSchedule(completion: @escaping (Result<[Schedule], Error>) -> Void)
}

class DAZNServicesImplementation: DAZNServices {
	func getEvents(completion: @escaping (Result<[Events], Error>) -> Void) {
		
		guard let url = URL(string: .getEventsUrl ) else {return}
		URLSession.daznService(with: url, completionHandler: completion)
	}
	
	func getSchedule(completion: @escaping (Result<[Schedule], Error>) -> Void) {
		
		guard let url = URL(string: .getScheduleUrl ) else {return}
		URLSession.daznService(with: url, completionHandler: completion)
	}
}
