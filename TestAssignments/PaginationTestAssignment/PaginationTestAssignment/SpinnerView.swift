//
//  SpinnerView.swift
//  PaginationTestAssignment
//
//  Created by Ashutosh Maurya on 03/05/24.
//

import SwiftUI

public struct SpinnerView: UIViewRepresentable {
	public typealias UIViewType = UIActivityIndicatorView
	
	public init(isAnimating: Binding<Bool>, style: UIActivityIndicatorView.Style) {
		self._isAnimating = isAnimating
		self.style = style
	}
	
	@Binding var isAnimating: Bool
	let style: UIActivityIndicatorView.Style
	
	public func makeUIView(context: UIViewRepresentableContext<SpinnerView>) -> UIActivityIndicatorView {
		return UIActivityIndicatorView(style: style)
	}
	
	public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<SpinnerView>) {
		if isAnimating {
			uiView.isUserInteractionEnabled = false
			uiView.startAnimating()
		} else {
			uiView.isUserInteractionEnabled = true
			uiView.stopAnimating()
		}
	}
}
