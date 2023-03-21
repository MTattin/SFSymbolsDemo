//
//  ViewController.swift
//  SFSymbolsDemo
//
//  Created by Masakiyo Tachikawa on 2023/03/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedUIKit(_ sender: Any) {
        let vc = UIStoryboard(name: "UIKitViewController", bundle: .main).instantiateInitialViewController()!
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func tappedSwiftUI(_ sender: Any) {
        let vc = UIStoryboard(
            name: "SwiftUIViewController",
            bundle: .main
        ).instantiateInitialViewController { coder in
            SwiftUIViewController(coder: coder, rootView: SFSymbolSampleSwiftUIView())
        }!
        navigationController?.pushViewController(vc, animated: true)
    }
}
