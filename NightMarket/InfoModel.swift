//
//  InfoLoader.swift
//  NightMarket
//
//  Created by lin shih-feng on 7/28/16.
//  Copyright © 2016 lin shih-feng. All rights reserved.
//

import Foundation

class InfoModel {
    
    private var InfoArrays: [NightMarketVO] = []
    
    func setInfos(aInfoVOs: [NightMarketVO]) {
        InfoArrays = aInfoVOs
    }
    
    func addInfo(aInfoVO: NightMarketVO)  {
        InfoArrays.append(aInfoVO)
    }
    
    func getInfoArrays() -> [NightMarketVO] {
        return InfoArrays
    }
    
}
