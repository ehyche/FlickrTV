//
//  FKFlickrFavoritesRemove.h
//  FlickrKit
//
//  Generated by FKAPIBuilder.
//  Copyright (c) 2013 DevedUp Ltd. All rights reserved. http://www.devedup.com
//
//  DO NOT MODIFY THIS FILE - IT IS MACHINE GENERATED


#import "FKFlickrAPIMethod.h"

typedef NS_ENUM(NSInteger, FKFlickrFavoritesRemoveError) {
	FKFlickrFavoritesRemoveError_PhotoNotInFavorites = 1,		 /* The photo id passed was not in the user's favorites. */
	FKFlickrFavoritesRemoveError_CannotRemovePhotoFromThatUsersFavorites = 2,		 /* user_id was passed as an argument, but photo_id is not owned by the authenticated user. */
	FKFlickrFavoritesRemoveError_UserNotFound = 3,		 /* Invalid user_id argument. */
	FKFlickrFavoritesRemoveError_SSLIsRequired = 95,		 /* SSL is required to access the Flickr API. */
	FKFlickrFavoritesRemoveError_InvalidSignature = 96,		 /* The passed signature was invalid. */
	FKFlickrFavoritesRemoveError_MissingSignature = 97,		 /* The call required signing but no signature was sent. */
	FKFlickrFavoritesRemoveError_LoginFailedOrInvalidAuthToken = 98,		 /* The login details or auth token passed were invalid. */
	FKFlickrFavoritesRemoveError_UserNotLoggedInOrInsufficientPermissions = 99,		 /* The method requires user authentication but the user was not logged in, or the authenticated method call did not have the required permissions. */
	FKFlickrFavoritesRemoveError_InvalidAPIKey = 100,		 /* The API key passed was not valid or has expired. */
	FKFlickrFavoritesRemoveError_ServiceCurrentlyUnavailable = 105,		 /* The requested service is temporarily unavailable. */
	FKFlickrFavoritesRemoveError_WriteOperationFailed = 106,		 /* The requested operation failed due to a temporary issue. */
	FKFlickrFavoritesRemoveError_FormatXXXNotFound = 111,		 /* The requested response format was not found. */
	FKFlickrFavoritesRemoveError_MethodXXXNotFound = 112,		 /* The requested method was not found. */
	FKFlickrFavoritesRemoveError_InvalidSOAPEnvelope = 114,		 /* The SOAP envelope send in the request could not be parsed. */
	FKFlickrFavoritesRemoveError_InvalidXMLRPCMethodCall = 115,		 /* The XML-RPC request document could not be parsed. */
	FKFlickrFavoritesRemoveError_BadURLFound = 116,		 /* One or more arguments contained a URL that has been used for abuse on Flickr. */

};

/*

Removes a photo from a user's favorites list.




*/
@interface FKFlickrFavoritesRemove : NSObject <FKFlickrAPIMethod>

/* The id of the photo to remove from the user's favorites. */
@property (nonatomic, copy) NSString *photo_id; /* (Required) */


@end
