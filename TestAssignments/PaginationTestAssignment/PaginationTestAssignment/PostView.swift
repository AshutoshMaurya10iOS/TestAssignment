//
//  PostView.swift
//  PaginationTestAssignment
//
//  Created by Ashutosh Maurya on 03/05/24.
//

import SwiftUI

struct PostView: View {
	//MARK: - PROPERTIES
	var post: Post

	@StateObject var postViewModel = PostViewModel()
	
	//MARK: - BODY
	var body: some View {
		NavigationLink {
			Text(String(format: post.body))
				.padding()
				.bold()
				.navigationTitle("\(post.title)")
		} label: {
			HStack(alignment: .center, spacing: nil,  content: {
				Text("\(post.id)")
					.padding()
					.overlay(Circle().stroke(.blue))
					.bold()
				
				Text(String(format: post.title))
					.padding()
					.bold()
					.lineLimit(1)
			})
		}
		.navigationTitle("POSTS")
	}
}

//MARK: - PREVIEW
struct PostView_Previews: PreviewProvider {
	static var previews: some View {
		let post = Post(userId: 1, id: 1, title: "Same post", body: "This is a sample post for creating a post view object")
		PostView(post: post)
	}
	
	
}
