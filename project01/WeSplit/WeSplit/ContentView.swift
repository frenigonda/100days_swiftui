//
//  ContentView.swift
//  WeSplit
//
//  Created by Daria Frolova on 01/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 0
    @FocusState private var isKeyboardVisible: Bool
    
    private let tipPecentages = [0, 10, 15, 20, 25]
    private let localCurrency = Locale.current.currency?.identifier ?? "USD"

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Enter check amount",
                        value: $checkAmount,
                        format: .currency(code: localCurrency)
                    )
                    .keyboardType(.decimalPad)
                    .focused($isKeyboardVisible)
                    
                    Picker("Tip", selection: $tipPercentage) {
                        ForEach(tipPecentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(1..<11) {
                            Text("\($0)")
                        }
                    }
                    //                    .pickerStyle(.navigationLink)
                    //                    .pickerStyle(.segmented)
                }
                
                Section("Each of you should pay") {
                    Text("\(calculatePayment())")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if isKeyboardVisible {
                    Button("Done") {
                        isKeyboardVisible = false
                    }
                }
            }
//            .simultaneousGesture(
//                TapGesture()
//                    .onEnded { _ in
//                        if isKeyboardVisible {
//                            isKeyboardVisible = false
//                        }
//                        print("I'm tapped")
//                    },
//                including: .all
//            )
        }
    }
    
    
    private func calculatePayment() -> String {
        let resultCheck = checkAmount * (1.0 + Double(tipPercentage) / 100)
        let payment = resultCheck / Double(numberOfPeople + 1)
        return payment.formatted(.currency(code: localCurrency))
    }
}

#Preview {
    ContentView()
}
