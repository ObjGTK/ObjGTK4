/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextChildAnchor.h"

#import "OGTKWidget.h"

@implementation OGTKTextChildAnchor

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TEXT_CHILD_ANCHOR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)textChildAnchor
{
	GtkTextChildAnchor* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_child_anchor_new(), GtkTextChildAnchor, GtkTextChildAnchor);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKTextChildAnchor* wrapperObject;
	@try {
		wrapperObject = [[OGTKTextChildAnchor alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)textChildAnchorWithReplacement:(OFString*)character
{
	GtkTextChildAnchor* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_child_anchor_new_with_replacement([character UTF8String]), GtkTextChildAnchor, GtkTextChildAnchor);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKTextChildAnchor* wrapperObject;
	@try {
		wrapperObject = [[OGTKTextChildAnchor alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkTextChildAnchor*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkTextChildAnchor, GtkTextChildAnchor);
}

- (bool)deleted
{
	bool returnValue = (bool)gtk_text_child_anchor_get_deleted([self castedGObject]);

	return returnValue;
}

- (GtkWidget**)widgets:(guint*)outLen
{
	GtkWidget** returnValue = (GtkWidget**)gtk_text_child_anchor_get_widgets([self castedGObject], outLen);

	return returnValue;
}


@end