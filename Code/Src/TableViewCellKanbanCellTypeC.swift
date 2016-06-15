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

            let button1 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault, ScreenWith - 2 * MarginDefault, ScreenWith - 2 * MarginDefault))
            button1.cornerRadius = 4
			button1.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[0].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button1.addGrayHighlightEffect()
			button1.imageView?.contentMode = .ScaleAspectFill
			
            viewTarget.addSubview(button1)
			
        case 2:
            
            let button1 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
			button1.imageView?.contentMode = .ScaleAspectFill
			button1.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[0].imageName)!,
			                                     forState: .Normal,
			                                     placeholderImage: nil,
			                                     optionsInfo: [.Transition(.Fade(0.6))],
			                                     progressBlock: { (receivedSize, totalSize) -> () in
													
				},
			                                     completionHandler: { (image, error, cacheType, imageURL) -> () in
													
			})
            button1.cornerRadius = 4
            button1.addGrayHighlightEffect()
            
            let button2 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button2.cornerRadius = 4
            button2.addGrayHighlightEffect()
			button2.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[1].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button2.imageView?.contentMode = .ScaleAspectFill
			
            viewTarget.addSubview(button1)
            viewTarget.addSubview(button2)
            
        case 3:
            
            let button1 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault, ScreenWith - 2 * MarginDefault, (ScreenWith - 3 * MarginDefault) / 2))
            button1.cornerRadius = 4
			button1.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[0].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button1.addGrayHighlightEffect()
			button1.imageView?.contentMode = .ScaleAspectFill
			
            let button2 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button2.cornerRadius = 4
			button2.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[1].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button2.addGrayHighlightEffect()
			button2.imageView?.contentMode = .ScaleAspectFill
			
            let button3 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button3.cornerRadius = 4
			button3.imageView?.contentMode = .ScaleAspectFill
			button3.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[2].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button3.addGrayHighlightEffect()
			
			viewTarget.addSubview(button1)
            viewTarget.addSubview(button2)
            viewTarget.addSubview(button3)
            
        case 4:
            
			
            
            let button1 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button1.cornerRadius = 4
			button1.imageView?.contentMode = .ScaleAspectFill
			button1.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[0].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button1.addGrayHighlightEffect()
            
            let button2 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button2.cornerRadius = 4
			button2.imageView?.contentMode = .ScaleAspectFill
			button2.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[1].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button2.addGrayHighlightEffect()
			
			
            let button3 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button3.cornerRadius = 4
			button3.imageView?.contentMode = .ScaleAspectFill
			button3.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[2].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button3.addGrayHighlightEffect()
			
			
            let button4 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
			button4.imageView?.contentMode = .ScaleAspectFill
            button4.cornerRadius = 4
			button4.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[3].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button4.addGrayHighlightEffect()
			
            viewTarget.addSubview(button1)
            viewTarget.addSubview(button2)
            viewTarget.addSubview(button3)
            viewTarget.addSubview(button4)
            
        case 5:
            
            let button1 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault, (ScreenWith - 4 * MarginDefault) / 3, (ScreenWith - 4 * MarginDefault) / 3))
            button1.cornerRadius = 4
			button1.imageView?.contentMode = .ScaleAspectFill
			button1.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[0].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button1.addGrayHighlightEffect()
			
            let button2 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault, MarginDefault, (ScreenWith - 4 * MarginDefault) / 3, (ScreenWith - 4 * MarginDefault) / 3))
            button2.cornerRadius = 4
			button2.imageView?.contentMode = .ScaleAspectFill
			button2.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[1].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button2.addGrayHighlightEffect()
			
            let button3 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault, MarginDefault, (ScreenWith - 4 * MarginDefault) / 3, (ScreenWith - 4 * MarginDefault) / 3))
            button3.cornerRadius = 4
			button3.imageView?.contentMode = .ScaleAspectFill
			button3.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[2].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button3.addGrayHighlightEffect()
			
            let button4 = UIButton.init(frame: CGRectMake(MarginDefault, MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button4.cornerRadius = 4
			button4.imageView?.contentMode = .ScaleAspectFill
			button4.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[3].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button4.addGrayHighlightEffect()
			
            let button5 = UIButton.init(frame: CGRectMake(MarginDefault + (ScreenWith - 3 * MarginDefault) / 2 + MarginDefault, MarginDefault + (ScreenWith - 4 * MarginDefault) / 3 + MarginDefault, (ScreenWith - 3 * MarginDefault) / 2, (ScreenWith - 3 * MarginDefault) / 2))
            button5.cornerRadius = 4
			button5.imageView?.contentMode = .ScaleAspectFill
			button5.kf_setImageWithURL(NSURL(string: qiniuResourceImageURL + arrayImage[4].imageName)!,
			                           forState: .Normal,
			                           placeholderImage: nil,
			                           optionsInfo: [.Transition(.Fade(0.6))],
			                           progressBlock: { (receivedSize, totalSize) -> () in
										
				},
			                           completionHandler: { (image, error, cacheType, imageURL) -> () in
										
			})
			button5.addGrayHighlightEffect()

            viewTarget.addSubview(button1)
            viewTarget.addSubview(button2)
            viewTarget.addSubview(button3)
            viewTarget.addSubview(button4)
            viewTarget.addSubview(button5)

		//case 6:
			
        default:
            break
        }
        
        
    }

    
}
