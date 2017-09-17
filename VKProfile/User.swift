//
//  User.swift
//  VKProfile
//
//  Created by Тимур Шафигуллин on 17.09.17.
//  Copyright © 2017 iOS Lab ITIS. All rights reserved.
//

import UIKit

struct User {
    var name: String
    var surname: String
    var isOnline: Bool
    var age: Int
    var city: String
    var friends: Int //по-хорошему, лучше использовать массив user (но пока без смысла)
    var followers: Int //тоже самое
    var photos: [UIImage]
    //дальше пойдёт только кол-во, но а так, это будет массив различных структур (групп, фоток, аудито и тп)
    var groups: Int
    var videos: Int
    var audios: Int
    var presents: Int
    var files: Int
    var profileImage: UIImage
}
