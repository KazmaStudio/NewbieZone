//
//  TableViewCellKanbanCellTypeC.swift
//  NewbieZone
//
//  Created by ZHAOCHENJUN on 16/6/14.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class TableViewCellKanbanCellTypeC: UITableViewCell {

	@IBOutlet var heightViewImage: NSLayoutConstraint!
	
    @IBOutlet weak var viewImageContent: UIView!
    
	@IBOutlet var labelContent: UILabel!
	
	static let fontSizeLabelSubTitle: CGFloat = 15
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	static func getWidthLabelContent () -> CGFloat{
		return ScreenWith - 2 * MarginDefault
	}
	
    static func getHeightForCell (heightLableContent: CGFloat, countImage: Int) -> CGFloat{
        
		return 2 * MarginDefault + heightLableContent + getHeightForViewIamgeContent(countImage) + 2 * MarginDefault + MarginDefault
        
	}
    
    static func getHeightForViewIamgeContent (countImage: Int) -> CGFloat{
        
        var viewImageContentHeight: CGFloat
        
        switch countImage {
        case 0:
            viewImageContentHeight = 0
        case 1:
            viewImageContentHeight = MarginDefault + ScreenWith - 2 * MarginDefault
        case 2:
            viewImageContentHeight = MarginDefault + (ScreenWith - 3 * MarginDefault) / 2
        case 3:
            viewImageContentHeight = MarginDefault + (ScreenWith - 3 * MarginDefault) + MarginDefault
        case 4:
            viewImageContentHeight = MarginDefault + (ScreenWith - 3 * MarginDefault) + MarginDefault
        case 5:
            viewImageContentHeight = MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault
        case 6:
            viewImageContentHeight = MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 * 2 + MarginDefault
        case 7:
            viewImageContentHeight = MarginDefault + (ScreenWith - 3 * MarginDefault) + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault + MarginDefault
        case 8:
            viewImageContentHeight = MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 * 2 + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault + MarginDefault
        case 9:
            viewImageContentHeight = MarginDefault + (ScreenWith - 4 * MarginDefault) + MarginDefault + MarginDefault
        default:
            viewImageContentHeight = 0
        }
        
        return viewImageContentHeight
    }
    
    func loadData(modelKanban: ModelKanban) {
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        self.labelContent.text = modelKanban.kanbanContentText
        
        for subview in self.viewImageContent.subviews{
            subview.removeFromSuperview()
        }
        
        self.heightViewImage.constant = TableViewCellKanbanCellTypeC.getHeightForViewIamgeContent((modelKanban.kanbanContentImage?.count)!)
        
        self.addImageToViewImageContent(self.viewImageContent, arrayImage: modelKanban.kanbanContentImage!)
        
    }
    
    // MARK: func
    
    func addImageToViewImageContent(viewTarget: UIView, arrayImage: Array<ModelImage>) {
        
        switch arrayImage.count {
        case 0:
            break
        case 1:
            
            let imageView1 = UIImageView.init(frame: CGRectMake(MarginDefault, MarginDefault, ScreenWith - 2 * MarginDefault, ScreenWith - 2 * MarginDefault))
            imageView1.contentMode = UIViewContentMode.ScaleAspectFill
            imageView1.clipsToBounds = true
            imageView1.cornerRadius = 4
            imageView1.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[0].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button1 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault, ScreenWith - 2 * MarginDefault, ScreenWith - 2 * MarginDefault))
            button1.cornerRadius = 4
            button1.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.1), forUIControlState: .Highlighted)
            
            viewTarget.addSubview(imageView1)
            viewTarget.addSubview(button1)
            
        case 2:
            
            let imageView1 = UIImageView.init(frame: CGRectMake(MarginDefault, MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            imageView1.contentMode = UIViewContentMode.ScaleAspectFill
            imageView1.clipsToBounds = true
            imageView1.cornerRadius = 4
            imageView1.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[0].imageName)!,
                                                  placeholderImage: nil,
                                                  optionsInfo: [.Transition(.Fade(0.6))],
                                                  progressBlock: { (receivedSize, totalSize) -> () in
                                                    
                },
                                                  completionHandler: { (image, error, cacheType, imageURL) -> () in
                                                    
            })
            
            let button1 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button1.cornerRadius = 4
            button1.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.1), forUIControlState: .Highlighted)
            
            let imageView2 = UIImageView.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            imageView2.contentMode = UIViewContentMode.ScaleAspectFill
            imageView2.clipsToBounds = true
            imageView2.cornerRadius = 4
            imageView2.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[1].imageName)!,
                                                  placeholderImage: nil,
                                                  optionsInfo: [.Transition(.Fade(0.6))],
                                                  progressBlock: { (receivedSize, totalSize) -> () in
                                                    
                },
                                                  completionHandler: { (image, error, cacheType, imageURL) -> () in
                                                    
            })
            
            let button2 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button2.cornerRadius = 4
            button2.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.2), forUIControlState: .Highlighted)
            
            viewTarget.addSubview(imageView1)
            viewTarget.addSubview(imageView2)
            
            viewTarget.addSubview(button1)
            viewTarget.addSubview(button2)
            
        case 3:
            
            let imageView1 = UIImageView.init(frame: CGRectMake(MarginDefault, MarginDefault, ScreenWith - 2 * MarginDefault, (ScreenWith - 3 * MarginDefault) / 2))
            imageView1.contentMode = UIViewContentMode.ScaleAspectFill
            imageView1.clipsToBounds = true
            imageView1.cornerRadius = 4
            imageView1.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[0].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button1 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault, ScreenWith - 2 * MarginDefault, (ScreenWith - 3 * MarginDefault) / 2))
            button1.cornerRadius = 4
            button1.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.1), forUIControlState: .Highlighted)
            
            let imageView2 = UIImageView.init(frame: CGRectMake(MarginDefault, MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            imageView2.contentMode = UIViewContentMode.ScaleAspectFill
            imageView2.clipsToBounds = true
            imageView2.cornerRadius = 4
            imageView2.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[1].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button2 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button2.cornerRadius = 4
            button2.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.1), forUIControlState: .Highlighted)
            
            let imageView3 = UIImageView.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            imageView3.contentMode = UIViewContentMode.ScaleAspectFill
            imageView3.clipsToBounds = true
            imageView3.cornerRadius = 4
            imageView3.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[2].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button3 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button3.cornerRadius = 4
            button3.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.2), forUIControlState: .Highlighted)
            
            viewTarget.addSubview(imageView1)
            viewTarget.addSubview(imageView2)
            viewTarget.addSubview(imageView3)
            
            viewTarget.addSubview(button1)
            viewTarget.addSubview(button2)
            viewTarget.addSubview(button3)
            
        case 4:
            
            let imageView1 = UIImageView.init(frame: CGRectMake(MarginDefault, MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            imageView1.contentMode = UIViewContentMode.ScaleAspectFill
            imageView1.clipsToBounds = true
            imageView1.cornerRadius = 4
            imageView1.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[0].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button1 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button1.cornerRadius = 4
            button1.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.1), forUIControlState: .Highlighted)
            
            let imageView2 = UIImageView.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            imageView2.contentMode = UIViewContentMode.ScaleAspectFill
            imageView2.clipsToBounds = true
            imageView2.cornerRadius = 4
            imageView2.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[1].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button2 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button2.cornerRadius = 4
            button2.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.2), forUIControlState: .Highlighted)
            
            let imageView3 = UIImageView.init(frame: CGRectMake(MarginDefault, MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            imageView3.contentMode = UIViewContentMode.ScaleAspectFill
            imageView3.clipsToBounds = true
            imageView3.cornerRadius = 4
            imageView3.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[2].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button3 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button3.cornerRadius = 4
            button3.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.1), forUIControlState: .Highlighted)
            
            let imageView4 = UIImageView.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            imageView4.contentMode = UIViewContentMode.ScaleAspectFill
            imageView4.clipsToBounds = true
            imageView4.cornerRadius = 4
            imageView4.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[3].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button4 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button4.cornerRadius = 4
            button4.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.2), forUIControlState: .Highlighted)
            
            viewTarget.addSubview(imageView1)
            viewTarget.addSubview(imageView2)
            viewTarget.addSubview(imageView3)
            viewTarget.addSubview(imageView4)
            
            viewTarget.addSubview(button1)
            viewTarget.addSubview(button2)
            viewTarget.addSubview(button3)
            viewTarget.addSubview(button4)
            
        case 5:
            
            let imageView1 = UIImageView.init(frame: CGRectMake(MarginDefault, MarginDefault, (ScreenWith - 4 * MarginDefault) / 3, (ScreenWith - 4 * MarginDefault) / 3))
            imageView1.contentMode = UIViewContentMode.ScaleAspectFill
            imageView1.clipsToBounds = true
            imageView1.cornerRadius = 4
            imageView1.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[0].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button1 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault, (ScreenWith - 4 * MarginDefault) / 3, (ScreenWith - 4 * MarginDefault) / 3))
            button1.cornerRadius = 4
            button1.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.1), forUIControlState: .Highlighted)
            
            let imageView2 = UIImageView.init(frame: CGRectMake(MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault, MarginDefault, (ScreenWith - 4 * MarginDefault) / 3, (ScreenWith - 4 * MarginDefault) / 3))
            imageView2.contentMode = UIViewContentMode.ScaleAspectFill
            imageView2.clipsToBounds = true
            imageView2.cornerRadius = 4
            imageView2.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[1].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button2 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault, MarginDefault, (ScreenWith - 4 * MarginDefault) / 3, (ScreenWith - 4 * MarginDefault) / 3))
            button2.cornerRadius = 4
            button2.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.2), forUIControlState: .Highlighted)
            
            let imageView3 = UIImageView.init(frame: CGRectMake(MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault, MarginDefault, (ScreenWith - 4 * MarginDefault) / 3, (ScreenWith - 4 * MarginDefault) / 3))
            imageView3.contentMode = UIViewContentMode.ScaleAspectFill
            imageView3.clipsToBounds = true
            imageView3.cornerRadius = 4
            imageView3.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[2].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button3 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault, MarginDefault, (ScreenWith - 4 * MarginDefault) / 3, (ScreenWith - 4 * MarginDefault) / 3))
            button3.cornerRadius = 4
            button3.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.2), forUIControlState: .Highlighted)
            
            
            let imageView4 = UIImageView.init(frame: CGRectMake(MarginDefault, MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            imageView4.contentMode = UIViewContentMode.ScaleAspectFill
            imageView4.clipsToBounds = true
            imageView4.cornerRadius = 4
            imageView4.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[3].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button4 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button4.cornerRadius = 4
            button4.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.1), forUIControlState: .Highlighted)
            
            let imageView5 = UIImageView.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            imageView5.contentMode = UIViewContentMode.ScaleAspectFill
            imageView5.clipsToBounds = true
            imageView5.cornerRadius = 4
            imageView5.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[4].imageName)!,
                                          placeholderImage: nil,
                                          optionsInfo: [.Transition(.Fade(0.6))],
                                          progressBlock: { (receivedSize, totalSize) -> () in
                                            
                },
                                          completionHandler: { (image, error, cacheType, imageURL) -> () in
                                            
            })
            
            let button5 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button5.cornerRadius = 4
            button5.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.2), forUIControlState: .Highlighted)
            
            viewTarget.addSubview(imageView1)
            viewTarget.addSubview(imageView2)
            viewTarget.addSubview(imageView3)
            viewTarget.addSubview(imageView4)
            viewTarget.addSubview(imageView5)
            
            viewTarget.addSubview(button1)
            viewTarget.addSubview(button2)
            viewTarget.addSubview(button3)
            viewTarget.addSubview(button4)
            viewTarget.addSubview(button5)

        default:
            break
        }
        
        
    }

    
}
