//
//  Post.swift
//  PaginationTestAssignment
//
//  Created by Ashutosh Maurya on 03/05/24.
//

import Foundation

struct Post: Identifiable, Codable, Hashable {
	let userId: Int
	let id: Int
	let title: String
	let body: String
}

enum NetworkError: Error {
	case badUrl
	case invalidRequest
	case badResponse
	case badStatus
	case failedToDecodeResponse
}
