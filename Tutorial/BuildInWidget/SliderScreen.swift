//
//  SliderScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 14/05/2022.
//

import SwiftUI

struct SliderScreen: View {
    @State private var volume: Double = 0
    @State private var hasChanged: Bool = false
    private let range: ClosedRange<Double> = 0...100
    private let step: Double = 5
    
    var body: some View {
        VStack {
            Text("Current value: \(Int(volume))%")
            HStack {
                increaseBtn
                Slider(
                    value: $volume,
                    in: range,
                    step: step) {
                        
                    } minimumValueLabel: {
                        Text("\(Int(range.lowerBound))")
                    } maximumValueLabel: {
                        Text("\(Int(range.upperBound))")
                    } onEditingChanged: { hasChanged in
                        self.hasChanged = hasChanged
                    }

                
//                Slider(value: $volume, in: range, step: step){ hasChanged in
//                    self.hasChanged = hasChanged
//                }
                decreaseBtn
            }
        }
        .padding()
    }
}

struct SliderScreen_Previews: PreviewProvider {
    static var previews: some View {
        SliderScreen()
    }
}

private extension SliderScreen {
    func increase(){
        guard volume < range.upperBound else {return}
        volume += step
    }
    
    func decrease(){
        guard volume > range.lowerBound else {return}
        volume -= step
    }
}

private extension SliderScreen {
    var increaseBtn: some View {
        Button {
            withAnimation {
                increase()
            }
        } label: {
            Image(systemName: "plus")
        }
        .opacity(hasChanged ? 0.5 : 1)
        .disabled(hasChanged)
    }
    
    var decreaseBtn: some View {
        Button {
            withAnimation {
                decrease()
            }
        } label: {
            Image(systemName: "minus")
        }
        .opacity(hasChanged ? 0.5 : 1)
        .disabled(hasChanged)
    }
}
