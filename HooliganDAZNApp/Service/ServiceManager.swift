//
//  ServiceManager.swift
//  HooliganDAZNApp
//
//  Created by Thanyani Tshikonwani on 2022/08/07.
//

import Foundation

extension URLSession {
	static func daznService<T: Codable>(with url: URL, completionHandler: @escaping (Result<[T], Error>) -> Void) {
		let serviceError = NSError(domain: "", code: 1, userInfo: nil)
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			
			guard let data = data else {
				return completionHandler(.failure(serviceError))
			}
			DispatchQueue.main.async {
				if let dataResponse = try? JSONDecoder().decode([T].self, from: data) {
					completionHandler(.success(dataResponse))
				} else {
					completionHandler(.failure(serviceError))
				}
			}
		}.resume()
	}
}
