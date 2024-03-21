//
//  LoadingView.swift
//  ClothingApp2
//
//  Created by Chamod Dilushanka on 2024-03-20.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable{
    
    func makeUIView(context: Context)-> UIActivityIndicatorView{
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.black
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context){}
    
}


struct LoadingView: View{
    var body: some View{
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            ActivityIndicator()
        }
    }
}
