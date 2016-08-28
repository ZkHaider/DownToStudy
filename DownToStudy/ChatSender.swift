//
//  ChatSender.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

public protocol DTSMessageModelProtocol: MessageModelProtocol {
    var status: MessageStatus { get set }
}

public class ChatSender {
    
    public var onMessageChanged: ((message: DTSMessageModelProtocol) -> Void)?
    
    public func sendMessages(messages: [DTSMessageModelProtocol]) {
        
    }
    
//    public func sendMessage(message: DTFMessageModelProtocol) {
//        
//    }
//    
//    private func fakeMessageStatus(message: )
    
}
