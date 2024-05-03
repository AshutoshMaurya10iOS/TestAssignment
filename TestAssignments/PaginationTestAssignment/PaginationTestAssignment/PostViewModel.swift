//
//  PostViewModel.swift
//  PaginationTestAssignment
//
//  Created by Ashutosh Maurya on 03/05/24.
//

import Foundation
import SwiftUI

@MainActor class PostViewModel: ObservableObject {
	
	//MARK: - Properties
	@Published var postData = [Post]()
	var pageNumber: Int = 0
	
	//MARK: - API CALL
	func fetchData(pageNumber: Int) async {
		let downloadURL = "https://jsonplaceholder.typicode.com/posts?_page=\(pageNumber)"
		TimeElapsed.measure()
		guard let downloadedPosts: [Post] = await WebService().downloadData(fromURL: downloadURL) else { return }
		postData.append(contentsOf: downloadedPosts)
		self.pageNumber += 1
	}
}
