//
//  ViewController.swift
//  StrategyPattern
//
//  Created by Joakim Sjöstedt on 2020-08-20.
//  Copyright © 2020 Joakim Sjöstedt. All rights reserved.
//

import UIKit

protocol CompressionStrategy {
    func compressFiles(filePaths: [String])
}

struct ZipCompressionStrategy: CompressionStrategy {
    func compressFiles(filePaths: [String]) {
        print("Zip compression")
    }
}

struct RarCompressionStrategy: CompressionStrategy {
    func compressFiles(filePaths: [String]) {
        print("Rar compression")
    }
}

struct CompressContent {
    var delegate: CompressionStrategy
    func compressFiles(filePaths: [String]) {
        delegate.compressFiles(filePaths: filePaths)
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let zip = ZipCompressionStrategy()
        let rar = RarCompressionStrategy()
        var compressZip = CompressContent(delegate: zip)
        compressZip.compressFiles(filePaths: ["txt1", "txt2"])
        var compressRar = CompressContent(delegate: rar)
        compressRar.compressFiles(filePaths: ["txt1", "txt2"])
    }
}

