//
//  ContentView.swift
//  PaginationTestAssignment
//
//  Created by Ashutosh Maurya on 02/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	//MARK: - PROPERTIES
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
	@StateObject var viewModel = PostViewModel()
	@State private var selectedPost: Post?

	//MARK: - BODY
	var body: some View {
		PostsView()
	}
}
//MARK: - PREVIEW
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
