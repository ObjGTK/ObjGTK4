/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKUriLauncher.h"

#import <OGio/OGCancellable.h>
#import "OGTKWindow.h"

@implementation OGTKUriLauncher

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_URI_LAUNCHER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithUri:(OFString*)uri
{
	GtkUriLauncher* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_uri_launcher_new([uri UTF8String]), GtkUriLauncher, GtkUriLauncher);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkUriLauncher, GtkUriLauncher);
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

	bool returnValue = (bool)gtk_uri_launcher_launch_finish([self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setUri:(OFString*)uri
{
	gtk_uri_launcher_set_uri([self castedGObject], [uri UTF8String]);
}


@end