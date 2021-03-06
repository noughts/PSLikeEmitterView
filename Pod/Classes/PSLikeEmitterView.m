#import "PSLikeEmitterView.h"
#import "PSLikeParticleView.h"

@implementation PSLikeEmitterView{
	NSInteger _counter;
}

-(void)awakeFromNib{
	[super awakeFromNib];
	self.userInteractionEnabled = NO;
}





-(void)playWithLog:(NSArray*)log{
	NSAssert( _particle_img, @"" );
	for (NSValue* val in log) {
		CGPoint point = [val CGPointValue];
	}
	
	CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
	[link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}


-(void)update:(CADisplayLink*)link{
	if( _counter % 8 == 0 ){
		[self emittAtPoint:CGPointMake(200, 200)];
	}
	_counter++;
	if( _counter == 1000 ){
		[link invalidate];
	}
}



// CALayerは暗黙的アニメーションの管理が面倒なのでUIViewを使っています。
-(void)emittAtPoint:(CGPoint)point{
	PSLikeParticleView* particle = [[PSLikeParticleView alloc] init];
	particle.frame = (CGRect){.size=_particle_img.size};
	particle.layer.contents = (__bridge id)(_particle_img.CGImage);
	[self addSubview:particle];
	particle.center = point;
	[particle startAnimation];
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	NSLog( @"touches began" );
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	NSLog( @"touchesMoved" );
//	NSLog( @"%@", touches );
//	NSLog( @"%@", event );
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	NSLog( @"touchesEnded" );
}
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
	NSLog( @"touchesCancelled" );
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end








@interface Coordinate : NSObject
@property CGFloat x;
@property CGFloat y;
@end