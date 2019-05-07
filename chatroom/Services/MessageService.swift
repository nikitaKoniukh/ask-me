//
//  MessageService.swift
//  chatroom
//
//  Created by Nikita Koniukh on 24/04/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Chanel]()
    var selectedChannel: Chanel?
    var messages = [Message]()
    var unreadChannels = [String]()
    
    func findAllChannel(completion: @escaping CompletionHandler){
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil{
                guard let data = response.data else {return}
                
//                do{
//                    self.channels = try JSONDecoder().decode([Chanel].self, from: data)
//                }catch let err{
//                    debugPrint(err as Any)
//                }
//                print(self.channels)
//                completion(true)
                if let json = JSON(data: data).array{
                    for item in json{
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Chanel(channelTitle: name, channelDescription: channelDescription, id: id)
                        self.channels.append(channel)
                    }
                    
                    NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                    completion(true)
                }
                
                
            }else{
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func clearChannels(){
        channels.removeAll()
    }
    
    func findAllMessagesForChannel(channelId: String, completion: @escaping CompletionHandler){
        Alamofire.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil{
                self.clearMessages()
                
                guard let data = response.data else {return}
                if let json = JSON(data: data).array{
                    for item in json{
                        let messageBody = item["messageBody"].stringValue
                        let channelId = item["channelId"].stringValue
                        let id = item["_id"].stringValue
                        let userName = item["userName"].stringValue
                        let userAvatar = item["userAvatar"].stringValue
                        let userAvatarColor = item["userAvatarColor"].stringValue
                        let timeStamp = item["timeStamp"].stringValue
                        
                        let message = Message(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
                        self.messages.append(message)
                    }
                    print(self.messages)
                    completion(true)
                }
                
                
            }else{
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
    func clearMessages(){
        messages.removeAll()
    }
    
}
