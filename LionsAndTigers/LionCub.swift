//
//  LionCub.swift
//  LionsAndTiger
//
//  Created by Sónia Rosa on 06/03/15.
//  Copyright (c) 2015 Sonia Rosa. All rights reserved.
//

import Foundation
import UIKit

class LionCub: Lion {
    
    func rubLionCubsBelly() {
        println("LionCub: Snuggle and be happy")
    }
    
    override func roar() {
        super.roar()
        
        println("LionCub: Growl Growl")
    }
    
    override func randomFact() -> String {
        var randomFactString: String
        
        if isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }
        else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks."
        }
        return randomFactString
    }
}

