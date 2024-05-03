//
//  WebService.swift
//  PaginationTestAssignment
//
//  Created by Ashutosh Maurya on 03/05/24.
//

import Foundation

class WebService: Codable {
	//MARK: - API FUNCTION
	func downloadData<T: Codable>(fromURL: String) async -> T? {
		TimeElapsed.measure()
		do {
			guard let url = URL(string: fromURL) else { throw NetworkError.badUrl}
			let (data, response) = try await URLSession.shared.data(from: url)
			guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse}
			guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus}
			guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { throw NetworkError.failedToDecodeResponse
			}
					return decodedResponse
		} catch NetworkError.badUrl {
			print("Error creating URL")
		} catch NetworkError.badResponse {
			print("Invalid Response")
		} catch NetworkError.badStatus {
			print("Invalid Status Code")
		} catch NetworkError.failedToDecodeResponse {
			print("Failed to decode response into the given type")
		} catch {
			print("Failed to download response")
		}
		return nil
	}
}
