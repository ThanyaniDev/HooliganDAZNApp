//
//  Dependencies.swift
//  HooliganDAZNApp
//
//  Created by Thanyani Tshikonwani on 2022/08/07.
//

import Foundation

class Dependencies {
	init() {
		@Provider var daznServices = DAZNServicesImplementation() as DAZNServices
	}
}
