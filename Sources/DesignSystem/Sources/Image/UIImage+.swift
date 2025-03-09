//
//  File.swift
//  
//
//  Created by 고영민 on 11/25/24.
//

import UIKit

public extension UIImage {
    enum Icon {
        public static let chart               = UIImage(name: "ic_chart")
        public static let complete            = UIImage(name: "ic_complete")
        public static let fail                = UIImage(name: "ic_fail")
        public static let feed                = UIImage(name: "ic_feed")
        public static let info                = UIImage(name: "ic_info")
        public static let inform              = UIImage(name: "ic_inform")
        public static let like                = UIImage(name: "ic_like")
        public static let link                = UIImage(name: "ic_link")
        public static let list                = UIImage(name: "ic_list")
        public static let mail                = UIImage(name: "ic_mail")
        public static let mypage              = UIImage(name: "ic_mypage")
        public static let next                = UIImage(name: "ic_next")
        public static let pen                 = UIImage(name: "ic_pen")
        public static let play                = UIImage(name: "ic_play")
        public static let player              = UIImage(name: "ic_player")
        public static let runtime             = UIImage(name: "ic_runtime")
        public static let star                = UIImage(name: "ic_star")
        public static let success             = UIImage(name: "ic_success")
        public static let teacher             = UIImage(name: "ic_teacher")
        public static let unlock              = UIImage(name: "ic_unlock")
    }
 
    enum Img {
        public static let sample              = UIImage(name: "sample")
        public static let kakaoLogin          = UIImage(name: "kakaoLogin")
        public static let appleLogin          = UIImage(name: "appleLogin")
        public static let bdink               = UIImage(name: "bdink")
    }
    
    enum Btn {
        public static let alarm_default       = UIImage(name: "btn_alarm_default")
        public static let alarm_variant       = UIImage(name: "btn_alarm_variant")
        public static let back                = UIImage(name: "btn_back")
        public static let bookmark            = UIImage(name: "btn_bookmark")
        public static let check_blank         = UIImage(name: "btn_check_blank")
        public static let check_green         = UIImage(name: "btn_check_green")
        public static let close               = UIImage(name: "btn_close")
        public static let edit                = UIImage(name: "btn_edit")
        public static let floating            = UIImage(name: "btn_floating")
        public static let left                = UIImage(name: "btn_left")
        public static let more                = UIImage(name: "btn_more")
        public static let setting             = UIImage(name: "btn_setting")
        public static let share               = UIImage(name: "btn_share")
    }
}

extension UIImage {
    convenience init?(name: String) {
        self.init(named: name, in: .module, with: nil)
    }
}

extension UIImage {
   public func resizing(width: CGFloat, height: CGFloat) -> UIImage {
       let size = CGSize(width: width, height: height)
       let render = UIGraphicsImageRenderer(size: size)
       let renderImage = render.image { context in
           self.draw(in: CGRect(origin: .zero, size: size))
       }
       return renderImage
   }
    
    public func resizeWithWidth(width: CGFloat) -> UIImage? {
         let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))))
         imageView.contentMode = .scaleAspectFit
         imageView.image = self
         UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
         guard let context = UIGraphicsGetCurrentContext() else { return nil }
         imageView.layer.render(in: context)
         guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
         UIGraphicsEndImageContext()
         return result
     }
}
