//
//  MockDAZNService.swift
//  HooliganDAZNAppTests
//
//  Created by Thanyani Tshikonwani on 2022/08/08.
//

import Foundation
@testable import HooliganDAZNApp

class MockDAZNService: DAZNServices {
	var  getEventsMockResult: Result<[Events], Error>?
	var  getScheduleMockResult: Result<[Schedule], Error>?
	
	func getEvents(completion: @escaping (Result<[Events], Error>) -> Void) {
		if let result = getEventsMockResult {
			completion(result)
		}
	}
	func getSchedule(completion: @escaping (Result<[Schedule], Error>) -> Void) {
		if let result = getScheduleMockResult {
			completion(result)
		}
	}
}

var mockEventsModel: [(id:String,title:String,subtitle:String,date:String,imageUrl:String,videoUrl:String)] = []
var mockScheduleModel: [(id:String,title:String,subtitle:String,date:String,imageUrl:String)] = []



