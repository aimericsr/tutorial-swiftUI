//
//  TextScreen.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 14/05/2022.
//

import SwiftUI

struct TextScreen: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .bold()
                .italic()
                .underline(true, color: .red)
                .padding()
            
            Text("Text here")
                .foregroundColor(.mint)
                .font(.largeTitle.weight(.black))
            
            Text("Text here")
                .foregroundColor(.blue)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
            
            Text(.now, style: .timer)
            Text(.now, style: .time)
            Text(.now, style: .date)
            
            Text(Date.now, format: Date.FormatStyle(date: .abbreviated, time: .shortened))
            
            Text(34.45, format: .currency(code: "EUR"))
            
            Text(Date.now...Date.now.addingTimeInterval(3600))
            
            Text("View calendar \(Image(systemName: "calendar")) here")
            
        }
    }
}

struct TextScreen_Previews: PreviewProvider {
    static var previews: some View {
        TextScreen()
    }
}
