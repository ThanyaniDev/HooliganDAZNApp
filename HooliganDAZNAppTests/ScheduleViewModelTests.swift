//
//  ScheduleViewModelTests.swift
//  HooliganDAZNAppTests
//
//  Created by Thanyani Tshikonwani on 2022/08/08.
//

import XCTest
@testable import HooliganDAZNApp

class ScheduleViewModelTests: XCTestCase {
	
	private var sut: ScheduleViewModel!
	private var mockWeatherService = MockDAZNService()

	override func setUpWithError() throws {
		sut = ScheduleViewModel()
		try super.setUpWithError()
	}
	
	override func tearDownWithError() throws {
		sut = nil
		try super.tearDownWithError()
	}
	
	func testGetEventsSuccess() {
		let schedule = [Schedule(id: "1",
							 title: "Bafana Bafana vs Canada",
							 subtitle: "World Cup",
							 date: "2022-08-07",
							 imageUrl: "imageUrl")]
		mockWeatherService.getScheduleMockResult = .success(schedule)
		sut.getSchedule()
	}
	
	func testGetEventsFailure() {
		mockWeatherService.getScheduleMockResult = .failure(NSError(domain: "", code: 1))
		sut.getSchedule()
	}
}
