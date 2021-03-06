//
//  WarningView.swift
//  PresentingAnDismissingViewsInSwiftUI
//
//  Created by Tunde Adegoroye on 21/03/2022.
//

import SwiftUI

struct WarningView: View {
    //ios 15 and above
    @Environment(\.dismiss) private var dismiss
    //under ios 15
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        
        ZStack {
            Color.blue
            
            VStack {
                warningIcon
                title
                content
            }
            .multilineTextAlignment(.center)
            .padding()
            .foregroundColor(.white)

        }
        .overlay(alignment: .topTrailing){
            close
        }
        
    }
}

struct WarningView_Previews: PreviewProvider {
    static var previews: some View {
        WarningView()
    }
}

private extension WarningView {
    
    var close: some View {
        
        Button(action: {
            if #available(iOS 15, *) {
                dismiss()
            } else {
                presentationMode.wrappedValue.dismiss()
            }
        }, label: {
            Image(systemName: "xmark")
                .symbolVariant(.fill.circle)
                .font(.largeTitle)
                .foregroundStyle(.white)
        })
        .padding(.top, UIDevice.hasNotch ? 50 : 16)
        .padding(.trailing)
    }
    
    var warningIcon: some View {
        Image(systemName: "exclamationmark.triangle")
            .symbolVariant(.fill)
            .symbolRenderingMode(.multicolor)
            .font(
                .system(size: 40, weight: .bold, design: .rounded)
            )
    }
    
    var title: some View {
        Text("Warning!!!")
            .font(
                .system(.largeTitle, design: .rounded)
                .bold()
            )
            .padding(.bottom, 8)
    }
    
    var content: some View {
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra aliquet eget sit amet. ")
            .font(.footnote)
            .frame(maxWidth: 250)
    }
}

extension UIDevice {
    static var hasNotch: Bool {
        let bottom = keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
    
    private static var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}
