//
//  Constains.swift
//  chatroom
//
//  Created by Nikita Koniukh on 03/03/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import Foundation

//renaming a Type
//typeAlias Jonny = String
//let name: Jonny = Jonny

typealias CompletionHandler = (_ Success: Bool) ->()

//URL Constans
let BASE_URL = "https://chatroomchat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel/"
let URL_GET_MESSAGES = "\(BASE_URL)message/byChannel/"


//Color
let purplePlaceHolder = #colorLiteral(red: 0.3254901961, green: 0.1294117647, blue: 0.716280956, alpha: 0.5)

//Notification constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserdataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("channelSelected")

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACOUNT = "toCreateAcount"
let UNWIND = "unwindToChanel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//HEADERS
let HEADER = [
    "content-Type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization":"Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]
