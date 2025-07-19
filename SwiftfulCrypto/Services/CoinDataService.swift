//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by Paul Norris on 7/15/25.
//
/*
 Comment on web page.
They have changed the API, you need to make an account and get a demo API Key. Then change your URL to include "?x_cg_demo_api_key=YOUR_API_KEY" at the end. I also had to remove "priceChangePercentage24HInCurrency" from my model to get it to work.
 
 Not sure this is accurate. Nick's app still runs.
 
 */

import Foundation
import Combine

class CoinDataService {

    @Published var allCoins: [CoinModel] = []
    
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string:
                                "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
                            //                             "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h?x_cg_demo_api_key=CG-SzMBAP7QRHVamGb2CgF1kcVE"
                            
        ) else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnCoins) in
                self?.allCoins = returnCoins
                self?.coinSubscription?.cancel()
            })
    }
}
