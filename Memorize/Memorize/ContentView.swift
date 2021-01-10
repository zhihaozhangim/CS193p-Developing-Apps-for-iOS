//
//  ContentView.swift
//  Memorize
//
//  Created by Zhihao on 1/8/21.
//

import SwiftUI

struct ContentView: View {
    // some View means the body property can be any type as long as the type is some kind of View.
    // The {} means when some code want to access the value of body, the code inside the {} will be executed. And
    // value of the body will be the computation result.
    var body: some View {
        // HStack will arrange items from left to right (horizontally)
        // In Swift, if the last argument of a function is a curly brace, it can be written like the wired syntax below.
        
//        return HStack() {
//            ForEach(0..<4) { index in
//                ZStack() {
//                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
//                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
//                    Text("👻")
//                }
//            }
//        }
//        .font(Font.largeTitle)
//        .padding()
//        .foregroundColor(Color.orange)
        
        // Furthermore, if there is no args inside the parenthesis, the parenthesis can be omitted.
        
//        return HStack {
//            ForEach(0..<4) { index in
//                ZStack {
//                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
//                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
//                    Text("👻")
//                }
//            }
//        }
//        .font(Font.largeTitle)
//        .padding()
//        .foregroundColor(Color.orange)
        
        return HStack {
            ForEach(0..<4) { index in
                CardView(isFaceUp: false)
            }
        }
        .font(Font.largeTitle)
        .padding()
        .foregroundColor(Color.orange)
        
        // Just like any other programming languages, the ZStack can be extracted as a separate struct.
        
//        return HStack(content: {
//            // 0..<4 is a range iterator, it iterates from 0 to 3.
//            ForEach(0..<4, content: { index in
//                ZStack(content: {
//                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
//                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
//                    Text("👻")
//                })
//            })
//        })
//        .font(Font.largeTitle)
//        .padding()
//        .foregroundColor(Color.orange)
//
//        // ZStack is a combiner for views. It will list items from back to front. That's to say, the first item will be at the lowest layer.
//        return ZStack(content: {
//            // The reason why we add a RoundedRectangle here is we always want the background of the ZStack to be white.
//            RoundedRectangle(cornerRadius: 10.0).fill(Color.white) // if we don't specify a color here, the default value for fill is the foregreoundColor we specify below, which is orange.
//
//            // The method stroke is used to remove the black background of the rounded rectangle
//            RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
//
//            Text("👻")
//        })
//        // The font will be applied to all the Text inside the ZStack combiner.
//        .font(Font.largeTitle)
//
//        // padding is applied to ZStack
//        .padding()
//
//        // The method foregroundColor can be called on any kind of view. However, for some view, it doesn't have effect. In this case, the ZStack doesn't have a color, so the foregroundColor is applied to the elements inside, which are RoundedRectangle and Text.
//        .foregroundColor(Color.orange)
//
        // When the body is a one-linear, the return keyword can be left out. The line below can be written
        // as Text("Hello, world!")
        
        // Text is a View, the some View above could be changed into Text. However, as our App progresses, we would want to return something other than just the Text.
//        return Text("👻")
    }
}

struct CardView: View {
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text("👻")
            } else {
                // The fill here will use the foreground color set by the HStack
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        }
    }
}

// This struct servers as the glue to show the components in 'real-time'
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
