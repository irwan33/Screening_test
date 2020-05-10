//
//  EventModel.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import Foundation

struct Event {
    let id: Int
    let name: String
    let subTitle: String
    let Date: String
    let imageEvent: String
    let Long : Double
    let Lat :  Double
    
    static let data = [
        Event(id: 001, name: "name satu", subTitle: "lorem ipsum si doler ismet", Date: "April 01 2020",imageEvent: "img1", Long: 107.614215, Lat: -6.9084869),
        Event(id: 002,name: "name dua", subTitle: "lorem ipsum si doler ismet", Date: "April 02 2020",imageEvent: "img2", Long: 107.614215, Lat: -6.9084869),
        Event(id: 003,name: "name tiga", subTitle: "lorem ipsum si doler ismet", Date: "April 03 2020",imageEvent: "img3", Long: 107.6155231, Lat: -6.8696154),
        Event(id: 004,name: "name empat", subTitle: "lorem ipsum si doler ismet", Date: "April 04 2020",imageEvent: "img4", Long: 107.6354418, Lat: -6.8946884),
        Event(id: 005,name: "name lima", subTitle: "lorem ipsum si doler ismet", Date: "April 05 2020",imageEvent: "img5", Long: 107.6306433, Lat: -6.9072513),
        Event(id: 006,name: "name enam", subTitle: "lorem ipsum si doler ismet", Date: "April 06 2020",imageEvent: "img1", Long: 107.6206226, Lat: -6.916901),
       
    ]
}
