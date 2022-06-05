//
//  ThemeView.swift
//  Tutorial
//
//  Created by Aimeric Sorin on 25/05/2022.
//

import SwiftUI

enum SchemeType: Int, Identifiable, CaseIterable {
    var id: Self { self }
    case system
    case light
    case dark
}

extension SchemeType {
    var title: String {
        switch self {
        case .system:
            return "📱 System"
        case .light:
            return "🌝 Light"
        case .dark:
            return "🌚 Dark"
        }
    }
}

struct ThemeView: View {
    @AppStorage("systemThemeVal") private var systemTheme: Int = SchemeType.allCases.first!.rawValue
    
    @Environment(\.colorScheme) private var colorScheme
    private var weatherText: String { colorScheme == .light ? "Day time" : "Night time" }
    var selectedScheme: ColorScheme? {
        guard let theme = SchemeType(rawValue: systemTheme) else { return nil }
        switch theme {
        case .light:
            return .light
        case .dark:
            return .dark
        default:
            return nil
            
        }
    }
    
    var body: some View {
        ZStack {
            Theme.primary
                .edgesIgnoringSafeArea(.top)
            VStack {
                Assets.weather
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(weatherText)
                Picker(selection: $systemTheme) {
                    ForEach(SchemeType.allCases) { item in
                        Text(item.title)
                            .tag(item.rawValue)
                    }
                } label: {
                    Text("Pick a theme")
                }
                .padding()
                .background(.white, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                
            }
        }
        .preferredColorScheme(selectedScheme)
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
            .previewDisplayName("Light")
            .preferredColorScheme(.light)
        ThemeView()
            .previewDisplayName("Dark")
            .preferredColorScheme(.dark)
    }
}
