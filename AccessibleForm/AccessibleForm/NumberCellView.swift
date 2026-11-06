//
//  NumberCellView.swift
//  AccessibleForm
//
//  Created by Robert Linnemann on 9/1/25.
//

import SwiftUI

struct NumberCellView: View {
    var num: Int
    
    var body: some View {
        HStack {
            Text("\(num)")
            Button {
                print("delete \(num)")
            } label: {
                Text("delete")
            }
        }
    }
}

#Preview {
    NumberCellView(num: 1)
}
