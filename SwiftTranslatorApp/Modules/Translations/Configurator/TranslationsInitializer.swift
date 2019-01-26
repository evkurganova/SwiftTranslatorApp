//
//  TranslationsTranslationsInitializer.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

import UIKit

class TranslationsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var translationsViewController: TranslationsViewController!

    override func awakeFromNib() {

        let configurator = TranslationsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: translationsViewController)
    }

}
