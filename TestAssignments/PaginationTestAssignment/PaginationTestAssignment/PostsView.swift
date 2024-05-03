//
//  PostsView.swift
//  PaginationTestAssignment
//
//  Created by Ashutosh Maurya on 03/05/24.
//

import SwiftUI

struct PostsView: View {
	//MARK: - PROPERTIES
	@StateObject var postViewModel = PostViewModel()
	
	//MARK: - BODY
	var body: some View {
		NavigationView {
			List {
				ForEach(postViewModel.postData, id: \.self) { post in
					PostView(post: post)
						
						.onAppear() {
							if (postViewModel.postData.last == post) {
								Task {
									if postViewModel.pageNumber <= post.userId {
										await postViewModel.fetchData(pageNumber: postViewModel.pageNumber + 1)
									}
								}
							}
						}
				}
			}
			.onAppear() {
				if postViewModel.postData.isEmpty {
					Task {
						await postViewModel.fetchData(pageNumber: postViewModel.pageNumber + 1)
					}
				}
			}
		}
	}
}


