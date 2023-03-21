//
//  SFSymbolSampleSwiftUIView.swift
//  SFSymbolsDemo
//
//  Created by Masakiyo Tachikawa on 2023/03/21.
//

import SwiftUI

struct SFSymbolSampleSwiftUIView: View {

    var body: some View {
        VStack(spacing: 10.0) {

            Text("\(originalSymbolImage)SF Symbols sample\(hierarchicalSymbolImage)")
                .font(.title)

            HStack(spacing: 0.0) {
                Text("\(originalSymbolImage)SF Symbols sample")
                    .font(.title)
                hierarchicalSymbol
                    .font(.title)
            }

            HStack(spacing: 0.0) {
                Text("\(originalSymbolImage)SF Symbols sample")
                    .font(.title)
                multiColorSymbol
                    .font(.title)
            }
        }
    }

    private var originalSymbolImage: Image {
        Image(systemName: "person.3.sequence.fill")
    }

    private var hierarchicalSymbolImage: Image {
        Image(systemName: "person.3.sequence.fill")
            .symbolRenderingMode(.hierarchical)
    }

    private var hierarchicalSymbol: some View {
        Image(systemName: "person.3.sequence.fill")
            .foregroundColor(.pink)
            .symbolRenderingMode(.hierarchical)
    }

    private var multiColorSymbol: some View {
        Image(systemName: "person.3.sequence.fill")
            .symbolRenderingMode(.palette)
            .foregroundStyle(.yellow, .green, .blue)
    }
}

struct SFSymbolSampleSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolSampleSwiftUIView()
    }
}
