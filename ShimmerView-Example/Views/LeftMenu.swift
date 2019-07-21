//
//  LeftMenu.swift
//  ShimmerView-Example
//
//  Created by Vidhyadharan Mohanram on 23/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
//import SideMenu

internal struct LeftMenu: View, MenuView {
    @Binding var showLeftMenu: Bool
    @Binding var showRightMenu: Bool
    
    @Binding var centerView: AnyView?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Spacer()
                Text("Hello World!")
                    .foregroundColor(Color.black)
                Button(action: {
                    withAnimation {
                        self.centerView = AnyView(PopularPhotosView(leftMenuState: self._showLeftMenu, rightMenuState: self._showRightMenu))
                        self.showLeftMenu.toggle()
                    }
                }, label: {
                    Text("Show Popular Photos").color(.black) })
                Spacer()
            }
        }
        .background(Color.blue)
            .background(Rectangle().shadow(radius: 4))
    }
    
    init(showLeftMenu: Binding<Bool> = .constant(false), showRightMenu: Binding<Bool> = .constant(false), centerView: Binding<AnyView?>) {
        self._showLeftMenu = showLeftMenu
        self._showRightMenu = showRightMenu
        
        self._centerView = centerView
    }
}

#if DEBUG
struct LeftMenu_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            LeftMenu(showLeftMenu: .constant(false), showRightMenu: .constant(false), centerView: .constant(nil))
                .previewDevice("iPhone Xs")
                .environment(\.colorScheme, .dark)
            LeftMenu(showLeftMenu: .constant(false), showRightMenu: .constant(false), centerView: .constant(nil))
        }
    }
}
#endif
