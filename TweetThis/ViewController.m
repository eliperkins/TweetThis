//
//  ViewController.m
//  TweetThis
//
//  Created by Eli Perkins on 10/13/11.
//  Copyright (c) 2011 One Mighty Roar. All rights reserved.
//

#import "ViewController.h"
#import <Twitter/Twitter.h>

#define letOSHandleLogin FALSE

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)loadView
{
    [super loadView];
    //Check to see if the user is able to tweet
    /**
    * This part is somehwat optional. iOS will prompt the user to log in to Twitter if they aren't already
    * However, it's best practice to do something similar to this, like show custom alerts, etc.
    **/
    if ([TWTweetComposeViewController canSendTweet]){
        _canTweet = YES;
    }
    if (letOSHandleLogin) {
        errorLabel.hidden = YES;
    } else{
        tweetButton.hidden = !(_canTweet);      //If able to tweet, show button
        errorLabel.hidden = _canTweet;          //If able to tweet, hide error
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    tweetButton = nil;
    errorLabel = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)tweetButtonPressed:(id)sender {
    //Create the tweet sheet
    TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];

    //Customize the tweet sheet here
    //Add a tweet message
    [tweetSheet setInitialText:@"Just learned how to use the #iOS5 Twitter Framework on @buildinternet"];
    
    //Add an image
    [tweetSheet addImage:[UIImage imageNamed:@"tweetThumb.png"]];
    
    //Add a link
    //Don't worry, Twitter will handle turning this into a t.co link
    [tweetSheet addURL:[NSURL URLWithString:@"http://buildinternet.com/2011/10/tweet-sheet-creating-a-popup-tweet-in-ios-5/"]];
    
    
    //Set a blocking handler for the tweet sheet
    tweetSheet.completionHandler = ^(TWTweetComposeViewControllerResult result){
        [self dismissModalViewControllerAnimated:YES];
    };
    //Show the tweet sheet!
    [self presentModalViewController:tweetSheet animated:YES];
}
@end
