//
//  Headers.h
//  KQXDrawer
//
//  Created by Kxx.xxQ 一生相伴 on 15/12/4.
//  Copyright © 2015年 asahi_kuang. All rights reserved.
//

#ifndef Headers_h
#define Headers_h

//*颜色相关*//
#define RGBA(r, g, b, a)        [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]
#define RGB(r, g, b)            [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1]
#define BACKGROUND(des, color)  [des setBackgroundColor:color]

//*尺寸相关*//
#define REACT_MAKE(x, y, w, h) CGRectMake(x, y, w, h)
#define REACT_WIDTH(des)       CGRectGetWidth(des)
#define REACT_HEIGHT(des)      CGRectGetHeight(des)
#define REACT_MAXX(des)        CGRectGetMaxX(des)
#define REACT_MAXY(des)        CGRectGetMaxY(des)
#define REACT_MINX(des)        CGRectGetMinX(des)
#define REACT_MINY(des)        CGRectGetMinY(des)
#define REACT_MIDX(des)        CGRectGetMidX(des)
#define REACT_MIDY(des)        CGRectGetMidY(des)
#define SCREEN_WIDTH           [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT          [[UIScreen mainScreen] bounds].size.height


//
#define FRAME                  self.view.frame
#define NAV_ITEM               self.navigationItem
#define NAV_BAR                NAV_CONTROLLER.navigationBar
#define NAV_CONTROLLER         self.navigationController

//*形变相关*//
#define MAKE_TRANSLATION(des, tx, ty) [des setTransform:CGAffineTransformMakeTranslation(tx, ty)]
#define MAKE_ROTATION(des, angle)     [des setTransform:CGAffineTransformMakeRotation(angle)]
#define MAKE_SCALE(des, sx, sy)       [des setTransform:CGAffineTransformMakeScale(sx, sy)]

//*字体*//
#define BOLD(s)                 [UIFont boldSystemFontOfSize:s]
#define SYSTEM(s)               [UIFont systemFontOfSize:s]

#endif /* Headers_h */
