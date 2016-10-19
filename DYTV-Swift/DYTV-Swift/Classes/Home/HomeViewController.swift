//
//  HomeViewController.swift
//  DYTV-Swift
//
//  Created by YoloMao on 16/9/21.
//  Copyright © 2016年 YoloMao. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: 导航栏的事件处理
    @objc private func leftItemClick() {
        print("点击了logo")
    }
    @objc private func qrCodeItemClick() {
        print("点击了二维码")
    }
    @objc private func searchItemClick() {
        print("点击了搜索")
    }
    @objc private func historyItemClick() {
        print("点击了历史")
    }
    
    //MARK:设置导航栏
    private func setupNavigationBar() {
        self.setupNavigationLeftBar()
        self.setupNavigationRightBar()
    }
    
    private func setupNavigationLeftBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "homeLogoIcon", highImageName: "", size: CGSize.zero, target: self, action: #selector(self.leftItemClick))
    }
    
    private func setupNavigationRightBar() {
        let size = CGSize(width: 40, height: 44)
        let historyItem = UIBarButtonItem(imageName: "viewHistoryIcon", highImageName: "viewHistoryIconHL", size: size, target: self, action: #selector(self.historyItemClick))
        let searchItem = UIBarButtonItem(imageName: "searchBtnIcon", highImageName: "searchBtnIconHL", size: size, target: self, action: #selector(self.searchItemClick))
        let qrCodeItem = UIBarButtonItem(imageName: "scanIcon", highImageName: "scanIconHL", size: size, target: self, action: #selector(self.qrCodeItemClick))
        navigationItem.rightBarButtonItems = [searchItem,qrCodeItem,historyItem]
    }
}

extension UIBarButtonItem {
    
    convenience init(imageName: String, highImageName: String = "", size: CGSize = CGSize.zero,target: AnyObject? = nil, action: Selector) {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        if highImageName != "" {
            button.setImage(UIImage(named:highImageName), for: .highlighted)
        }
        if size == CGSize.zero {
            button.sizeToFit()
        }else {
            button.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        button.addTarget(target, action: action, for: .touchUpInside)
        
        self.init(customView:button)
    }
}
