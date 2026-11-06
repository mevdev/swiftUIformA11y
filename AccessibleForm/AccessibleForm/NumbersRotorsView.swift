//
//  NumbersRotorsView.swift
//  AccessibleForm
//
//  Created by Robert Linnemann on 9/2/25.
//

import SwiftUI


struct NumbersRotorsView: View {
    @State var fullSet: String = "1,2,3,4"
    @State var fullSetList: [Int] = [Int]()
    
    private let validationErrorMessage = "Only numbers are allowed."
    
    private var invalidSet: Bool {
        guard !fullSet.isEmpty else { return false }
        return fullSet.replacingOccurrences(of: ",", with: "").rangeOfCharacter(from: .decimalDigits) != nil
    }

    var body: some View {
        Form {
        Section(header: Text("Config")) {
            HStack {
                Text("Full Set")
                TextField("Set", text: $fullSet)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(invalidSet ? .red : .black, lineWidth: 2)
                    )
                    .accessibilityLabel(invalidSet ? "Error: \(validationErrorMessage)" : fullSet)
                    .onChange(of: fullSet) { _, newValue in // old, new
                        regenFullSetList() //regen
                        formatNumber(newValue)
                    }
            }
            if invalidSet == true {
                Text(validationErrorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .accessibilityHidden(true) // it is announced in the textfield
            }
        }
        
        Section(header: Text("Numbers")) {
            ForEach(fullSetList, id: \.self) { num in
                NumberCellView(num: num)
            }
        }
    }
    }
    
    
    func regenFullSetList() {
        self.fullSetList = fullSet.components(separatedBy: ",").compactMap { Int($0) }
    }
    
    
    func formatNumber(_ number: String) {
        // make it look like 1,2,3,4
    }
    
}
