//
//  MessageService.swift
//  smack-chat
//
//  Created by Gurpreet Bhoot on 7/11/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel()]
    
    func getChannels(completion: @escaping CompletionHandler)  {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                if let json = try? JSON(data: data).array {
                    for item in json! {
                        let channelName = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(ChannelTitle: channelName, ChannelDescription: channelDescription, id: id)
                        self.channels.append(channel)
                    }
                    print(self.channels[0].ChannelTitle)
                    completion(true)
                }

            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
