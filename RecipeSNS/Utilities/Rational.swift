//
//  Rational.swift
//  RecipeSNS
//
//  Created by Sunghee Bang on 2022-06-14.
//

import Foundation

struct Rational {
    static func greatestCommonDivisior (_ a: Int, _ b: Int) -> Int {
        
        // GCD(0,b) = b
        if a == 0 { return b }
        
        // GCD(a,0) = a
        if b == 0 { return a }
        
        // Otherwise, GCD(a,b) = GCD(b, remainder)
        return greatestCommonDivisior(b, a % b)
    }
}
