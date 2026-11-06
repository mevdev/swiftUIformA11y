//
//  ContentView.swift
//  AccessibleForm
//
//  Created by Robert Linnemann on 8/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = ""
    @State var isNameInputInvalid: Bool = false
        
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "numbers.rectangle.fill")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Numbers and Stuff")
                }
                Spacer()
                Form {
                    Section(header: Text("User Information")) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("First Name")
                                .font(.headline)
                            
                            TextField("Enter your name", text: $name)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(self.nameValidationColor(), lineWidth: 2)
                                )
                                .accessibilityLabel(isNameInputInvalid ? "First Name cannot contain numbers" : "First Name")
//                                .accessibilityInvalid(!isNameInputInvalid)
                                .onChange(of: name) { _, newValue in // old, new
                                    self.isNameInputInvalid = name.contains("[0-9]+")
                                    print("isNameInputInvalid: \(isNameInputInvalid.description)")
                                }
                            if isNameInputInvalid {
                                Text("validationErrorMessage")
                                    .foregroundColor(.red)
                                    .font(.caption)
                                    .accessibilityHidden(true)
                            }
                            HStack {
                                Label("Sunrise", systemImage: "sunrise")
                                Label("Europe", systemImage: "globe.europe.africa")
                                Label("Euros", systemImage: "eurosign")
                            }
                        }
                        .padding(.vertical, 5)
                    }

                }
            }
            
        }
    }
    
    func nameValidationColor() -> Color {
        guard name.isEmpty == false
        else { return .black }
        return isNameInputInvalid ? .red : .green
    }
    
}

#Preview {
    ContentView()
}
