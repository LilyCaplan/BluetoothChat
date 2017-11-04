//
//  la.m
//  TechnicaProj2
//
//  Created by Lily Caplan on 11/4/17.
//  Copyright © 2017 Saad Khalid. All rights reserved.
//

#import "LAConnectivityManager.h"

@interface LAConnectivityManager ()

@property(strong, nonatomic) MCNearbyServiceAdvertiser *advertiser;
@property(strong, nonatomic) MCPeerID *localPeerID;
@end

@implementation LAConnectivityManager

- (instancetype)init {
  self = [super init];
  if (self) {
    self.localPeerID = [[MCPeerID alloc] initWithDisplayName:[[UIDevice currentDevice] name]];

    self.advertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:self.localPeerID
                                                        discoveryInfo:nil
                                                          serviceType:@"XOXO"];
    [self.advertiser startAdvertisingPeer];
  }
  return self;
}
#pragma mark - MCNearbyServiceAdvertiserDelegate

- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser
didReceiveInvitationFromPeer:(MCPeerID *)peerID
       withContext:(NSData *)context
 invitationHandler:(void(^)(BOOL accept, MCSession *session))invitationHandler{
  NSLog(@"%@ YAY WE'RE CONNECTING", peerID);
  
  MCSession *session = [[MCSession alloc] initWithPeer:self.localPeerID
                                      securityIdentity:nil
                                  encryptionPreference:MCEncryptionNone];
//  session.delegate = self;
  invitationHandler(YES, session);
}

@end
