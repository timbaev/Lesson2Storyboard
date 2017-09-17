//
//  ViewController.swift
//  VKProfile
//
//  Created by Тимур Шафигуллин on 11.09.17.
//  Copyright © 2017 iOS Lab ITIS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum BorderPosition {
        case top
        case bottom
        case right
        case left
    }
    
    enum InfoType {
        case friends
        case followers
        case groups
        case photos
        case videos
        case audios
        case presents
        case files
    }

    @IBOutlet weak var infoScrollView: UIScrollView!
    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet var menuButtons: [UIButton]!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var onlineStatusLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet var infoButtons: [UIButton]!
    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet var photos: [UIImageView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createStyles()
        let user = UserInfoData.generateUser()
        
        self.title = user.name
        nameLabel.text = user.name + " " + user.surname
        onlineStatusLabel.text = user.isOnline ? "online" : "offline"
        ageLabel.text = String(user.age)
        if (user.age == 1) {
            yearsLabel.text = "год"
        } else {
            yearsLabel.text = user.age > 4 ? "лет" : "года"
        }
        yearsLabel.text = yearsLabel.text! + ","
        cityLabel.text = user.city
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let attributes: [String: Any] = [NSParagraphStyleAttributeName: paragraph]
        setTitle(with: infoButtons[0], type: .friends, count: user.friends, attributes: attributes)
        setTitle(with: infoButtons[1], type: .followers, count: user.followers, attributes: attributes)
        setTitle(with: infoButtons[2], type: .groups, count: user.groups, attributes: attributes)
        setTitle(with: infoButtons[3], type: .photos, count: user.photos.count, attributes: attributes)
        setTitle(with: infoButtons[4], type: .videos, count: user.videos, attributes: attributes)
        setTitle(with: infoButtons[5], type: .audios, count: user.audios, attributes: attributes)
        setTitle(with: infoButtons[6], type: .presents, count: user.presents, attributes: attributes)
        setTitle(with: infoButtons[7], type: .files, count: user.files, attributes: attributes)
        
        photosButton.setTitle("\(user.photos.count) фотографии", for: .normal)
        for (i, photo) in photos.enumerated() {
            photo.image = user.photos[i]
        }
        avatarImage.image = user.profileImage
    }
    
    private func createBorders(to view: UIView, on position: BorderPosition) {
        let borderWidth = CGFloat(2.0)
        let marginX = CGFloat(10)
        let borderLength = CGFloat(320 - marginX * 2) //hardcode for iPhone SE
        let borderColor = UIColor(rgb: 0xdbd6d6).cgColor
        
        switch position {
        case .top:
            let borderTop = CALayer()
            borderTop.borderColor = borderColor
            borderTop.frame = CGRect(x: marginX, y: 0, width: borderLength, height: 1.5)
            borderTop.borderWidth = borderWidth
            
            view.layer.addSublayer(borderTop)
            view.layer.masksToBounds = true
            break
        case .bottom:
            let borderBottom = CALayer()
            borderBottom.borderColor = borderColor
            borderBottom.frame = CGRect(x: marginX, y: view.frame.height - 1.0, width: borderLength, height: view.frame.height - 1.0)
            borderBottom.borderWidth = borderWidth
            
            view.layer.addSublayer(borderBottom)
            view.layer.masksToBounds = true
            break
        case .right:
            let borderRight = CALayer()
            borderRight.borderColor = borderColor
            borderRight.frame = CGRect(x: view.frame.width - 1.0, y: 0, width: 1, height: view.frame.height)
            borderRight.borderWidth = borderWidth
            
            view.layer.addSublayer(borderRight)
            break
        case .left:
            let borderLeft = CALayer()
            borderLeft.borderColor = borderColor
            borderLeft.frame = CGRect(x: 0, y: 0, width: 1, height: view.frame.height)
            
            view.layer.addSublayer(borderLeft)
            break
        }
    }
    
    private func createStyles() {
        createBorders(to: infoScrollView, on: .bottom)
        createBorders(to: infoScrollView, on: .top)
        createBorders(to: photoScrollView, on: .bottom)
        createBorders(to: menuButtons[0], on: .right)
        createBorders(to: menuButtons[1], on: .right)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(rgb: 0x3180d6)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        avatarImage.layer.cornerRadius = avatarImage.frame.size.width / 2
        avatarImage.clipsToBounds = true
        self.view.layoutIfNeeded()
    }
    
    var count = 0
    @IBAction func onInfoClick(_ sender: UIButton) {
        if (count == 5) {
            viewDidLoad()
            count = 0
        } else {
            count += 1
        }
    }
    
    private func setTitle(with button: UIButton, type: InfoType, count: Int, attributes: [String : Any]) {
        var title: String
//        let moreThanFore = count % 10 > 4
//        let notOne = count % 10 != 1
        
        switch type {
        case .friends:
            title = "друг"
            if (count % 10 > 4) {
                title = "друзей"
            } else if (count % 10 != 1) {
                title = "друга"
            }
            break
        case .followers:
            title = "подписчик"
            if (count % 10 > 4) {
                title = "подписчиков"
            } else if (count % 10 != 1) {
                title = "подписчика"
            }
            break
        case .groups:
            title = "группа"
            if (count % 10 > 4) {
                title = "групп"
            }
            else if (count % 10 != 1) {
                title = "группы"
            }
            break
        case .photos:
            title = "фото"
            break
        case .videos:
            title = "видео"
            break
        case .audios:
            title = "аудио"
            break
        case .presents:
            title = "подарок"
            if (count % 10 > 4) {
                title = "подарков"
            } else if (count % 10 != 1) {
                title = "подарка"
            }
            break
        case .files:
            title = "файл"
            if (count % 10 > 4) {
                title = "файлов"
            } else if (count % 10 != 1) {
                title = "файла"
            }
            break
        }
        
        let attrString = NSAttributedString(string: "\(count)" + "\n" + title, attributes: attributes)
        button.setAttributedTitle(attrString, for: .normal)
    }
    
}

//extension to create color from HEX
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1)
    }
    
    convenience init(rgb: Int) {
        self.init(red: (rgb >> 16) & 0xFF, green: (rgb >> 8) & 0xFF, blue: rgb & 0xFF)
    }
}

