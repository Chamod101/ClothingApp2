//
//  BannerView.swift
//  ClothingApp2
//
//  Created by NIBM on 2024-03-23.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
                    ZStack(alignment: .trailing) {
                        Image("Banner")
                            .resizable()
                            .frame(width: .infinity, height: 250)
                            .scaledToFit()
                    }

                }
    }
}

#Preview {
    BannerView()
}
