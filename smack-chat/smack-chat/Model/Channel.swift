//
//  Channel.swift
//  smack-chat
//
//  Created by Gurpreet Bhoot on 7/11/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation

struct Channel : Decodable{
    public private(set) var ChannelTitle: String!
    public private(set) var ChannelDescription: String!
    public private(set) var id: String!
}
