//
//  ContentView.swift
//  DocumentBasedApp
//
//  Created by Barbara Araujo Paim on 16/02/24.
//

import SwiftUI
import UniformTypeIdentifiers


struct TextFile: FileDocument {
    
    static var readableContentTypes = [UTType.plainText]

    var text = ""

    
    init(initialText: String = "") {
        text = initialText
    }

    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
}

struct ContentView: View {
    
    @Binding var document: TextFile
    
    var body: some View {
        VStack {
            TextEditor(text: $document.text)
        }
        .padding()
    }
}

#Preview {
    ContentView(document: .constant(TextFile()))
}
