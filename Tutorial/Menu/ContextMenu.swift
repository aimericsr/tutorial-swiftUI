//
//  ContextMenu.swift
//  SampleApp
//
//  Created by Aimeric Sorin on 21/05/2022.
//

import SwiftUI

struct ContextMenu: View {
    var body: some View {
        VStack(spacing: 40) {
            
            Image("Pexels")
                .contextMenu {
                    Button {
                    } label: {
                        Label("Add item", systemImage: "plus.app")
                    }
                    Button {
                        
                    } label: {
                        Label("Edit item", systemImage: "square.and.pencil")
                    }
                }
            
            Menu {
                Button(role: .destructive) {
                    print("Perform Delete")
                } label: {
                    Label("Delete", systemImage: "trash")
                }
                
                Button {
                    print("Perform duplicate item")
                } label: {
                    Label("Duplicate item", systemImage: "doc.on.doc")
                }
                
                Menu {
                    Button {
                        print("Share")
                    } label: {
                        Label("Share item", systemImage: "square.and.arrow.up")
                    }
                    
                    
                    Button {
                        print("Perform print item")
                    } label: {
                        Label("Print item", systemImage: "printer")
                    }
                } label: {
                    Label("Other menus actions", systemImage: "ellipsis")
                }
                
            } label: {
                Label("Actions Example 2", systemImage: "ellipsis")
            }
//             primaryAction: {
//                print("default actions")
//            }
            .menuStyle(.automatic)
            
        }
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu()
    }
}
