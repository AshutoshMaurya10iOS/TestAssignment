//
//  TimeElapsed.swift
//  PaginationTestAssignment
//
//  Created by Ashutosh Maurya on 03/05/24.
//

import Foundation

struct TimeElapsed {
	class InternalMeasure {
		//MARK: - PROPERTIES
		private let startPoint = DispatchTime.now()
		private let functionName: String
		
		//MARK: - INITIALIZER
		init(functionName: String) {
			self.functionName = functionName
		}
		
		//MARK: - DEINIT
		deinit {
			NSLog("\(self.functionName): \(UInt64(Double(DispatchTime.now().uptimeNanoseconds - startPoint.uptimeNanoseconds)))")
		}
	}
	
	private let logPoint: InternalMeasure
	init(functionName: String = #function) {
		self.logPoint = InternalMeasure(functionName: functionName)
	}
	
#if DEBUG
@discardableResult
static func measure(functionName: String = #function) -> Self {
	return Self(functionName: functionName)
}
#endif
}
