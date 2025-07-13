//
//  Double.swift
//  SwiftfulCrypto
//
//  Created by Paul Norris on 7/12/25.
//

import Foundation

extension Double {
    
    /// Converts a double into a Currency with 2 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// '''

    public var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current
//        formatter.currencyCode = "USD"
//        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }

    /// Converts a double into a Currency as a string with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// '''

    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    /// Converts a double into a Currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// '''

    public var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current
//        formatter.currencyCode = "USD"
//        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }

    /// Converts a double into a Currency as a string with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$1,234.56"
    /// Convert 0.123456 to "$0.123456"
    /// '''

    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into String representation
    /// ```
    /// Convert 1.2345 to "1.23"
    /// ```
    ///
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
        
    /// Converts a Double into String representation with percent symbol
    /// ```
    /// Convert 1.2345 to "1.23%"
    /// ```
    ///        
        func asPercentString() -> String {
            return asNumberString() + "%"
        }
    }

