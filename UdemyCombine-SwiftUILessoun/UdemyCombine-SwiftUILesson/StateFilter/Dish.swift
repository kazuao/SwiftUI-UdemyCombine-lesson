//
//  Dish.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/18.
//

import Foundation
import SwiftUI

struct Dish: Identifiable {
    let id = UUID()
    let name: String
    let imageURL: String
    let isSpicy: Bool
}

extension Dish {

    static func all() -> [Dish] {

        return [
            Dish(name: "kung Pow Chicken", imageURL: "kungpow", isSpicy: true),
            Dish(name: "Sweet and Sour Chicken", imageURL: "sweet", isSpicy: false),
            Dish(name: "Spicy Red Chicken", imageURL: "spicy", isSpicy: true)
        ]
    }
}
