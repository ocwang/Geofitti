#import "Stroke.h"
#import <WILLCore/WILLCore.h>

@implementation Stroke

@synthesize segmentsBounds;
@synthesize bounds;

+(Stroke*) strokeWithPoints:(WCMFloatVector*)points andStride:(int)stride andWidth:(float)width andColor:(UIColor*)color andTs:(float)ts andTf:(float)tf andBlendMode:(WCMBlendMode)blendmode
{
    Stroke * result = [[Stroke alloc] init];
    result->_points = points;
    result->_stride = stride;
    result->_width = width;
    result->_color = color;
    result->_ts = ts;
    result->_tf = tf;
    result->_blendMode = blendmode;
    
    [result calculateBounds];
    
    return result;
}

-(void) calculateBounds
{
    segmentsBounds = WCMCalculateStrokeSegmentsBoundsVector(self.points.pointer, self.stride, self.width, 0.0);
    
    bounds = CGRectNull;
    for (int i=0;i<segmentsBounds.size;i++)
    {
        bounds = CGRectUnion(bounds, segmentsBounds.begin[i]);
    }
}

+(Stroke*) strokeFromStroke:(Stroke*)s andInterval:(WCMPathInterval)interval
{
    Stroke * result = [[Stroke alloc] init];
    result->_points = [WCMFloatVector vectorWithBegin:s.points.begin + interval.fromIndex*s.stride
                                               andEnd:s.points.begin + (interval.toIndex+1)*s.stride];
    result->_stride = s->_stride;
    result->_width = s->_width;
    result->_color = s->_color;
    result->_blendMode = s->_blendMode;
    result->_ts = interval.fromT;
    result->_tf = interval.toT;
    
    [result calculateBounds];
    
    return result;
}



@end