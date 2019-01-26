//
//  LanguagesLanguagesInitializer.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

import UIKit

class LanguagesModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var languagesViewController: LanguagesViewController!

    override func awakeFromNib() {

        let configurator = LanguagesModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: languagesViewController)
    }

}
