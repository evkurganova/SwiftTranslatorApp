//
//  LanguagesLanguagesViewController.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

import UIKit

class LanguagesViewController: UIViewController, LanguagesViewInput {

    var output: LanguagesViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: LanguagesViewInput
    func setupInitialState() {
    }
}
