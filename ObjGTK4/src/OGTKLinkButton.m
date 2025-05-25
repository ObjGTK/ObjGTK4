/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLinkButton.h"

#import "OGTKWidget.h"

@implementation OGTKLinkButton

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LINK_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_LINK_BUTTON);
	return gObjectClass;
}

+ (instancetype)linkButtonWithUri:(OFString*)uri
{
	GtkLinkButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_link_button_new([uri UTF8String]), GTK_TYPE_LINK_BUTTON, GtkLinkButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKLinkButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKLinkButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)linkButtonWithLabelWithUri:(OFString*)uri label:(OFString*)label
{
	GtkLinkButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_link_button_new_with_label([uri UTF8String], [label UTF8String]), GTK_TYPE_LINK_BUTTON, GtkLinkButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKLinkButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKLinkButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkLinkButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_LINK_BUTTON, GtkLinkButton);
}

- (OFString*)uri
{
	const char* gobjectValue = gtk_link_button_get_uri((GtkLinkButton*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)visited
{
	bool returnValue = (bool)gtk_link_button_get_visited((GtkLinkButton*)[self castedGObject]);

	return returnValue;
}

- (void)setUri:(OFString*)uri
{
	gtk_link_button_set_uri((GtkLinkButton*)[self castedGObject], [uri UTF8String]);
}

- (void)setVisited:(bool)visited
{
	gtk_link_button_set_visited((GtkLinkButton*)[self castedGObject], visited);
}


@end