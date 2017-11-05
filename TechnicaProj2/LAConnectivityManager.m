//
//  la.m
//  TechnicaProj2
//
//  Created by Lily Caplan on 11/4/17.
//  Copyright © 2017 Saad Khalid. All rights reserved.
//

#import "LAConnectivityManager.h"

@interface LAConnectivityManager ()<MCNearbyServiceBrowserDelegate>

@property(strong, nonatomic) MCNearbyServiceAdvertiser *advertiser;
@property(strong, nonatomic) MCPeerID *localPeerID;
@property(strong, nonatomic) MCNearbyServiceBrowser *browser;


@end

@implementation LAConnectivityManager

- (instancetype)init {
  NSString * serviceType = @"xoxo";
  self = [super init];
  if (self) {
    self.localPeerID = [[MCPeerID alloc] initWithDisplayName:[[UIDevice currentDevice] name]];

    self.advertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:self.localPeerID
                                                        discoveryInfo:nil
                                                          serviceType:serviceType];
    [self.advertiser startAdvertisingPeer];
    self.browser = [[MCNearbyServiceBrowser alloc] initWithPeer:self.localPeerID serviceType:serviceType];
    self.browser.delegate = self;
  }
  return self;
}
#pragma mark - MCNearbyServiceAdvertiserDelegate

- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser
didReceiveInvitationFromPeer:(MCPeerID *)peerID
       withContext:(NSData *)context
 invitationHandler:(void(^)(BOOL accept, MCSession *session))invitationHandler{
  NSLog(@"YAY WE'RE CONNECTING: %@", peerID);
  
  MCSession *session = [[MCSession alloc] initWithPeer:self.localPeerID
                                      securityIdentity:nil
                                  encryptionPreference:MCEncryptionNone];
//  session.delegate = self;
  invitationHandler(YES, session);
}

- (void)browser:(MCNearbyServiceBrowser *)browser didNotStartBrowsingForPeers:(NSError *)error {
  NSLog(@"Did not start browsing: %@", error);
}
-(void)browser:(MCNearbyServiceBrowser *)browser lostPeer:(MCPeerID *)peerID {
  NSLog(@"Lost Peer: %@", peerID);
}
-(void)browser:(MCNearbyServiceBrowser *)browser foundPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary<NSString *,NSString *> *)info{
  NSLog(@"Yay connection made with: %@ %@", peerID, info);
  
}


@end
