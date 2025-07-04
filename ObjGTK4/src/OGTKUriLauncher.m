/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKUriLauncher.h"

#import <OGio/OGCancellable.h>
#import "OGTKWindow.h"

@implementation OGTKUriLauncher

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_URI_LAUNCHER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_URI_LAUNCHER);
	return gObjectClass;
}

+ (instancetype)uriLauncherWithUri:(OFString*)uri
{
	GtkUriLauncher* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_uri_launcher_new([uri UTF8String]), GTK_TYPE_URI_LAUNCHER, GtkUriLauncher);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKUriLauncher* wrapperObject;
	@try {
		wrapperObject = [[OGTKUriLauncher alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkUriLauncher*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_URI_LAUNCHER, GtkUriLauncher);
}

- (OFString*)uri
{
	const char* gobjectValue = gtk_uri_launcher_get_uri((GtkUriLauncher*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)launchWithParent:(OGTKWindow*)parent cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_uri_launcher_launch((GtkUriLauncher*)[self castedGObject], [parent castedGObject], [cancellable castedGObject], callback, userData);
}

- (bool)launchFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_uri_launcher_launch_finish((GtkUriLauncher*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (void)setUri:(OFString*)uri
{
	gtk_uri_launcher_set_uri((GtkUriLauncher*)[self castedGObject], [uri UTF8String]);
}


@end