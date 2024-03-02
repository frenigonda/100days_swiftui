//
//  ContentView.swift
//  WeSplit
//
//  Created by Daria Frolova on 01/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"

    var body: some View {
        NavigationStack {
            Form {
                Section("Hey") {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                
                Section("Tap count") {
                    Button("Tap count: \(tapCount)") {
                        self.tapCount += 1
                    }
                }
                
                Section("Name") {
                    TextField("What's your name?", text: $name)
                    Text("Your name is \(name)")
                }
                
                Section("Views in a loop") {
                    ForEach(1..<6) { number in
                        Text("Row \(number)")
                    }
                }
                
                Section("Hogwarts students") {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
