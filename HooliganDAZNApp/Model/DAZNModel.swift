//
//  DAZNModel.swift
//  HooliganDAZNApp
//
//  Created by Thanyani Tshikonwani on 2022/08/07.
//

import Foundation

struct Events: Codable, Identifiable {
	var id, title, subtitle, date: String?
	var imageUrl: String?
	var videoUrl: String?
}

struct Schedule: Codable, Identifiable {
	var id, title, subtitle, date: String?
	var imageUrl: String?
}
