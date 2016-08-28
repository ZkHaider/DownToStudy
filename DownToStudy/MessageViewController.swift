//
//  MessageViewController.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit
import Chatto
import ChattoAdditions

class MessageViewController: UIViewController {
    
//    var chatSender: ChatSender!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setChatDataSource(self, triggeringUpdateType: UpdateType.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func createChatInputView() -> UIView {
//        let chatInputView = ChatInputBar.loadNib()
//        var appearance = ChatInputBarAppearance()
//        appearance.sendButtonAppearance.title = NSLocalizedString("Send", comment: "")
//        appearance.textInputAppearance.placeholderText = NSLocalizedString("Get down to study", comment: "")
////        self.chatInputPresenter = BasicChatInputBarPresenter(chatInputBar: chatInputView, chatInputItems: self.createChatInputItems(), chatInputBarAppearance: appearance)
//        chatInputView.maxCharactersCount = 1000
//        return chatInputView
//    }
//    
//    func createChatInputItems() -> [ChatInputItemProtocol] {
//        var items = [ChatInputItemProtocol]()
//        items.append(self.createTextInputItem())
//        items.append(self.createPhotoInputItem())
//        return items
//    }
//    
//    private func createTextInputItem() -> TextChatInputItem {
//        let item = TextChatInputItem()
//        item.textInputHandler = { [weak self] text in
//            // Handling code
//        }
//        return item
//    }
//    
//    private func createPhotoInputItem() -> PhotosChatInputItem {
//        let item = PhotosChatInputItem(presentingController: self)
//        item.photoInputHandler = { [weak self] image in
//            // Handling code
//        }
//        return item
//    }
//    
//    func loadNext() {
//        
//    }
//    
//    func loadPrevious() {
//        
//    }
//    
//    func adjustNumberOfMessages(preferredMaxCount preferredMaxCount: Int?, focusPosition: Double, completion: (didAdjust: Bool) -> Void) {
//        
//    }
    
}
