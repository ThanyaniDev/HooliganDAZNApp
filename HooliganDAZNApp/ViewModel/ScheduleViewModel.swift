//
//  ScheduleViewModel.swift
//  HooliganDAZNApp
//
//  Created by Thanyani Tshikonwani on 2022/08/07.
//

import Foundation

final class ScheduleViewModel:ObservableObject {
	@Published var schedule = [Schedule]()
	@Inject private var daznServices: DAZNServices
	var timer: Timer?
	
	init() {
		timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true, block: { _ in
			self.getSchedule()
		})
	}
	
	deinit {
		timer?.invalidate()
	}
	
	func getSchedule() {
		daznServices.getSchedule { [weak self] result in
			DispatchQueue.main.async {
				switch result {
					case .success(let schedule):
						self?.schedule =  schedule
					case .failure(let failure):
						print(failure)
				}
			}
		}
	}
}

