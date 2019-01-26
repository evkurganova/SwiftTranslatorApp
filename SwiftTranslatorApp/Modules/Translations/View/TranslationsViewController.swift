//
//  TranslationsTranslationsViewController.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

import UIKit

class TranslationsViewController: UIViewController, TranslationsViewInput {

    var output: TranslationsViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: TranslationsViewInput
    func setupInitialState() {
    }
}
