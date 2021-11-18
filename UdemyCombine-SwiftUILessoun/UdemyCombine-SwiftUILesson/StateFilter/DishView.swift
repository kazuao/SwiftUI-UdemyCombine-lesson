//
//  DishView.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/18.
//

import SwiftUI

struct DishView: View {

    var model = Dish.all()

    @State private var isSpicy = false

    var body: some View {

        List {

            Toggle(isOn: $isSpicy) {
                Text("Spicy")
                    .font(.title)
            }

            ForEach(model.filter { $0.isSpicy == isSpicy} ) { dish in

                HStack {
                    Image(dish.imageURL)
                        .resizable()
                        .frame(width: 100, height: 100)

                    Text(dish.name)
                        .font(.title)
                        .lineLimit(nil)

                    Spacer()

                    if dish.isSpicy {
                        Image("spicy-icon")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                }
            }
        }
    }
}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView()
    }
}
