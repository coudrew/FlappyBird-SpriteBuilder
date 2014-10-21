#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
    
}

-(void)update:(CCTime)delta
{
    // put update code here
    timeSinceObstacle += delta;
    if (timeSinceObstacle > 2.0f)
    {
        [self addObstacle];
        timeSinceObstacle = 0.0f;
    }
    for (CCNode *bush in _bushes) {
        //move the bush
        bush.position = ccp(bush.position.x - (character.physicsBody.velocity.x * delta), bush.position.y);
        if (bush.position.x <= (-1 * bush.contentSize.width)) {
            bush.position = ccp(bush.position.x + 2 * bush.contentSize.width, bush.position.y);
        }
    }
    for (CCNode *cloud in _clouds) {
        cloud.position = ccp(cloud.position.x - (character.physicsBody.velocity.x * delta), cloud.position.y);
        if (cloud.position.x = (-1 * cloud.contentSize.width)) {
            cloud.position = ccp(cloud.position.x + 2 * cloud.contentSize.width, cloud.position.y);
        }
    }
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    [character flap];
}

@end
