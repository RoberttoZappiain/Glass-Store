//
//  TabButton.swift
//  GlassStore
//
//  Created by Robertto Flores on 23/11/21.
//

import SwiftUI

struct TabButton: View {
    var title: String
    var animation: Namespace.ID
    @Binding var selected: String
    var body: some View {
        Button(action: {withAnimation(.spring())
            {selected = title}})
        {
            Text(title)
                .font(.system(size:15))
                .fontWeight(.bold)
                .foregroundColor(selected == title ? .white : .black)
                .padding(.vertical,10)
                .padding(.horizontal,selected == title ? 20: 0)
                .background(
                    ZStack{
                        if selected == title{
                            Color.black
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "tab", in: animation)
                        }
                    }
                )
        }
    }
}

