//
//  StatisticView.swift
//  SwiftfulCrypto
//
//  Created by Paul Norris on 7/25/25.
//

import SwiftUI

struct StatisticView: View {

    let stat: StatisticModel

    var body: some View {
        
        Text(stat.title)
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(stat: dev.stat1)
    }
}

