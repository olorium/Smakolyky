//
//  SMError.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 22.08.2022.
//


/// Struct describing predefined errors
import Foundation

enum SMError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
