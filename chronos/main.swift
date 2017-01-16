//
//  main.swift
//  chronos
//
//  Created by Jonathan Hersh on 1/1/17.
//  Copyright © 2017 Splinesoft. All rights reserved.
//

import Foundation

struct Chronos {
    static let defaultInterval: TimeInterval = 5 * 60
    static let defaultMessage = "Blip."
    
    static let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.includesTimeRemainingPhrase = false
        formatter.includesApproximationPhrase = false
        formatter.allowedUnits = [.second, .minute]
        formatter.unitsStyle = .full
        formatter.collapsesLargestUnit = false
        return formatter
    }()
    
    let message: String
    let duration: TimeInterval
    let timeString: String
    
    var isFiring: Bool
    
    init(_ arguments: [String]) {
        self.isFiring = false
        self.message = arguments.count > 1
                        ? arguments[1]
                        : Chronos.defaultMessage
        self.duration = arguments.count > 2
                        ? max(1, TimeInterval(UInt(arguments[2]) ?? 0))
                        : Chronos.defaultInterval
        self.timeString = Chronos.durationFormatter.string(from: self.duration) ?? "soon"
    }
    
    mutating func fire() {
        self.isFiring = true
        print(message)
        print("See you in \(timeString)...")
        
        repeat {
            sleep(UInt32(duration))
            print(message)
        } while (true)
    }
}

var chronos = Chronos(CommandLine.arguments)

chronos.fire()
