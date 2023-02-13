//
//  CustomTabbar.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/10.
//

import Foundation
import SwiftUI

enum CustomTabbar: String, CaseIterable {
    case home                   = "首页"
    case mine                   = "我的"
    
    
    var iconName: String {
        switch self {
        case .home:
            return "tabbar_home"
        case .mine:
            return "tabbar_mine"
        }
    }
    
    var norIconName: String {
        return iconName + "_nor"
    }
    
    var selIconName: String {
        return iconName + "_sel"
    }
}

struct CustomTabbarView: View {
    var safeEdgeInsets: EdgeInsets
    @Binding var showIssue: Bool
    @Binding var currTab: CustomTabbar
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(CustomTabbar.allCases, id: \.rawValue) { item in
                Button {
                    currTab = item
                } label: {
                    VStack {
                        Image(currTab == item ? item.selIconName : item.norIconName)
                        Text(item.rawValue)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color.black.opacity(currTab == item ? 0.7 : 0.3))
                    }
                }
                .frame(maxWidth: .infinity)

            }
        }
        .padding(.top, 20)
        .padding(.bottom, safeEdgeInsets.bottom)
        .background(
            
            Canvas { context, size in
                let width = size.width
                let height = size.height
                let midWidth = width * 0.5
                context.fill(Path { path in
                    path.move(to: CGPoint(x: 0, y: 30))
                    path.addLine(to: CGPoint(x: midWidth - 55, y: 30))
                    path.addCurve(to: CGPoint(x: midWidth, y: 5), control1: CGPoint(x: midWidth - 35, y: 30), control2: CGPoint(x: midWidth - 25, y: 5))
                    path.addCurve(to: CGPoint(x: midWidth + 55, y: 30), control1: CGPoint(x: midWidth + 25, y: 5), control2:  CGPoint(x: midWidth + 35, y: 30))
                    path.addLine(to: CGPoint(x: width, y: 30))
                    path.addLine(to: CGPoint(x: width, y: height))
                    path.addLine(to: CGPoint(x: 0, y: height))
                }, with: .color(.white))
            }
        )
    }
}
