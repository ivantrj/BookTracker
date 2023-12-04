//
//  BookStatus.swift
//  BookTracker
//
//  Created by ivan trj  on 04.12.23.
//

import Foundation

enum BookStatus: String, Codable, CaseIterable {
   case wantToRead = "Want to Read"
   case reading = "Reading"
   case read = "Read"
}
