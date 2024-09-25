/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKUriLauncher.h"

#import "OGTKWindow.h"
#import <OGio/OGCancellable.h>

@implementation OGTKUriLauncher

- (instancetype)init:(OFString*)uri
{
	GtkUriLauncher* gobjectValue = GTK_URI_LAUNCHER(gtk_uri_launcher_new([uri UTF8String]));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkUriLauncher*)castedGObject
{
	return GTK_URI_LAUNCHER([self gObject]);
}

- (OFString*)uri
{
	const char* gobjectValue = gtk_uri_launcher_get_uri([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)launchWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_uri_launcher_launch([self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)launchFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = gtk_uri_launcher_launch_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setUri:(OFString*)uri
{
	gtk_uri_launcher_set_uri([self castedGObject], [uri UTF8String]);
}


@end