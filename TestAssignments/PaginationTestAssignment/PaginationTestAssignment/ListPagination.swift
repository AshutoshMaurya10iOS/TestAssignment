//
//  ListPagination.swift
//  PaginationTestAssignment
//
//  Created by Ashutosh Maurya on 03/05/24.
//

import SwiftUI

public struct ListPagination<Post: Identifiable, Content: View>: View {
	
	private var posts: [Post]
	var content: (_ post: Post) -> Content
	var pagination: ((() -> Void)?) -> Void
	@State var isLoading = false
	private var offset: Int
	
	init(posts: [Post], offset: Int = 10, pagination: @escaping (_ completion: (() -> Void)?) -> Void, @ViewBuilder content: @escaping (_ post: Post) -> Content) {
		self.posts = posts
		self.content = content
		self.pagination = pagination
		self.offset = offset
	}
	
	public var body: some View {
		List {
			ForEach(posts.indices, id: \.self) { index in
				VStack {
					self.content(self.posts[index])
					if self.isLoading && self.isLastItem(index: index) {
						HStack(alignment: .center) {
							SpinnerView(isAnimating: self.$isLoading, style: .medium)
						}
					}
				}.onAppear() {
					self.itemAppears(at: index)
				}
			}
		}
	}
}


extension ListPagination {
	
	private func isLastItem(index: Int) -> Bool {
		index == (posts.count - 1)
	}
	
	private func isOffsetReached(at index: Int) -> Bool {
		index == (posts.count - offset)
	}
	
	private func itemAppears(at index: Int) {
		if isOffsetReached(at: index) {
			isLoading = true
			
			pagination {
				self.isLoading = false
			}
		}
	}
}
