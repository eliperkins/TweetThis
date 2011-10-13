//
//  ViewController.h
//  TweetThis
//
//  Created by Eli Perkins on 10/13/11.
//  Copyright (c) 2011 One Mighty Roar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    BOOL _canTweet;                     //If false, prompt user to log in to Twitter
    IBOutlet UIButton *tweetButton;
    IBOutlet UILabel *errorLabel;
}

- (IBAction)tweetButtonPressed:(id)sender;

@end
