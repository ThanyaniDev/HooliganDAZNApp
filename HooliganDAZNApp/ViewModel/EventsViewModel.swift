//
//  EventsViewModel.swift
//  HooliganDAZNApp
//
//  Created by Thanyani Tshikonwani on 2022/08/07.
//

import Foundation

final class EventsViewModel:ObservableObject {
	
	@Published var events = [Events]()
	@Inject private var daznServices: DAZNServices
	var timer: Timer?
	
	init() {
		timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true, block: { _ in
			self.getEvents()
		})
	}
	
	deinit {
		timer?.invalidate()
	}
	
	func getEvents() {
		daznServices.getEvents { [weak self] result in
			DispatchQueue.main.async {
				switch result {
					case .success(let events):
						self?.events =  events
					case .failure(let failure):
						print(failure)
				}
			}
		
		}
	}
}
