//
//  ColourTheme.swift
//  TipCalculatorStarter
//
//  Created by Michelle Karman on 1/29/22.
//  Copyright © 2022 Make School. All rights reserved.
//

import Foundation
import UIKit

struct ColourTheme {

    // MARK: - Instance Vars

    static let light = ColourTheme(isDefaultStatusBar: true,
                                  viewControllerBackgroundColor: .tcOffWhite,
                                  primaryColor: .tcWhite,
                                  primaryTextColor: .tcCharcoal,
                                  secondaryColor: .customPink,
                                  accentColor: .tcHotPink,
                                  outputTextColor: .tcAlmostBlack)

    static let dark = ColourTheme(isDefaultStatusBar: false,
                                 viewControllerBackgroundColor: .tcAlmostBlack,
                                 primaryColor: .tcMediumBlack,
                                 primaryTextColor: .tcWhite,
                                 secondaryColor: .tcBlueBlack,
                                 accentColor: .testYellow,
                                 outputTextColor: .tcWhite)

    
    let isDefaultStatusBar: Bool
    let viewControllerBackgroundColor: UIColor

    let primaryColor: UIColor
    let primaryTextColor: UIColor

    let secondaryColor: UIColor

    let accentColor: UIColor
    let outputTextColor: UIColor
}
