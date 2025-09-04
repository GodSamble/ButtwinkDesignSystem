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
        public static let teachers            = UIImage(name: "ic_teachers")
        public static let calendar            = UIImage(name: "ic_calendar")
        public static let videos              = UIImage(name: "ic_videos")
        public static let mypage_ver2         = UIImage(name: "ic_mypage_ver2")
        public static let circle_warning      = UIImage(name: "ic_circle_warning")
        public static let octagon_check       = UIImage(name: "ic_octagon_check")
        public static let octagon_check_green = UIImage(name: "ic_octagon_check_green")
        public static let octagon_check_bright = UIImage(name: "ic_octagon_check_bright")
        public static let note_edit           = UIImage(name: "ic_note_edit")
        public static let chevron_left        = UIImage(name: "ic_chevron_left")
        public static let clock_loader        = UIImage(name: "ic_clock_loader")
        public static let check_big           = UIImage(name: "ic_check_big")
        public static let mail_white          = UIImage(name: "ic_mail_white")
        public static let ic_profile          = UIImage(name: "ic_profile")
        public static let subtitle            = UIImage(name: "ic_subtitle")
        public static let calendar_white      = UIImage(name: "ic_calendar_white")
        public static let chart_white         = UIImage(name: "ic_chart_white")
    }
 
    enum Img {
        public static let sample              = UIImage(name: "sample")
        public static let kakaoLogin          = UIImage(name: "KakaoLogin")
        public static let appleLogin          = UIImage(name: "AppleLogin")
        public static let bdink               = UIImage(name: "bdink")
        public static let bdink_icon          = UIImage(name: "Bdink_Icon")
        public static let bdink_gray          = UIImage(name: "bdink_gray")
        public static let placeholder         = UIImage(name: "placeholder")
    }
    
    enum Btn {
        public static let alarm_default       = UIImage(name: "btn_alarm_default")
        public static let alarm_variant       = UIImage(name: "btn_alarm_variant")
        public static let back                = UIImage(name: "btn_back")
        public static let bookmark_white_on   = UIImage(name: "btn_bookmark_white_on")
        public static let bookmark_white_off  = UIImage(name: "btn_bookmark_white_off")
        public static let bookmark_gray_on    = UIImage(name: "btn_bookmark_gray_on")
        public static let bookmark_gray_off   = UIImage(name: "btn_bookmark_gray_off")
        public static let check_blank         = UIImage(name: "btn_check_blank")
        public static let check_green         = UIImage(name: "btn_check_green")
        public static let close               = UIImage(name: "btn_close")
        public static let edit                = UIImage(name: "btn_edit")
        public static let floating            = UIImage(name: "btn_floating")
        public static let left                = UIImage(name: "btn_left")
        public static let more                = UIImage(name: "btn_more")
        public static let setting             = UIImage(name: "btn_setting")
        public static let share               = UIImage(name: "btn_share")
        public static let arrow               = UIImage(name: "btn_arrow")
        public static let camera              = UIImage(name: "btn_camera")
        //MARK: 이 밑으론 콜러스 플레이어에 사용되는 UI버튼
        public static let play_white          = UIImage(name: "btn_play_white")
        public static let skip_backward       = UIImage(name: "btn_skip_backward")
        public static let skip_forward        = UIImage(name: "btn_skip_forward")
        public static let pause               = UIImage(name: "btn_pause")
        public static let cc_on               = UIImage(name: "btn_CC_on")
        public static let cc_off              = UIImage(name: "btn_CC_off")
        public static let option              = UIImage(name: "btn_option")
        public static let screen_full         = UIImage(name: "btn_screen_full")
        public static let profile             = UIImage(name: "btn_profile")
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
