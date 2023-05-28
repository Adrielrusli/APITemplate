//
//  Model.swift
//  ApiTest
//
//  Created by Adriel Bernard Rusli on 23/05/23.
//

import Foundation

struct TaskEntry: Codable  {
    let id : Int
    let title: String
}

struct Meal: Codable {
    let id: String
    let name: String
    let category: String
    let instructions: String
    // Add other properties as needed
}
