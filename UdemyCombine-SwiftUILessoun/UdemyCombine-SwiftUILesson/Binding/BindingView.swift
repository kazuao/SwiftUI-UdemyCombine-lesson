//
//  BindingView.swift
//  UdemyCombine-SwiftUILesson
//
//  Created by kazunori.aoki on 2021/11/18.
//

import SwiftUI

struct BindingView: View {

    @State var name: String = ""

    var body: some View {

        VStack {
            Text(name)
            TextField("Enter Text", text: $name)
                .padding(12)

            Button(action: printName, label: {
                Text("Show Name Value")
            })
        }
    }
}

private extension BindingView {
    func printName() {
        print(name)
    }
}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView()
    }
}
