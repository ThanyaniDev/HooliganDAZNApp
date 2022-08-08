//
//  EventsViewModelTests.swift
//  HooliganDAZNAppTests
//
//  Created by Thanyani Tshikonwani on 2022/08/08.
//

import XCTest
@testable import HooliganDAZNApp

class EventsViewModelTests: XCTestCase {
	
	private var sut: EventsViewModel!
	private var mockWeatherService = MockDAZNService()

	
	override func setUpWithError() throws {
		sut = EventsViewModel()
		try super.setUpWithError()
	}
	
	override func tearDownWithError() throws {
		sut = nil
		try super.tearDownWithError()
	}
	
	func testGetEventsSuccess() {
		let events = [Events(id: "1",
							title: "Bafana Bafana vs Canada",
							subtitle: "World Cup",
							date: "2022-08-07",
							imageUrl: "imageUrl",
							videoUrl: "videoUrl")]
		mockWeatherService.getEventsMockResult = .success(events)
		sut.getEvents()
	}
	
	
	func testGetEventsFailure() {
		
		mockWeatherService.getEventsMockResult = .failure(NSError.init(domain: "", code: 1))
		sut.getEvents()
	}
}
