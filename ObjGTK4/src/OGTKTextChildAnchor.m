/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKTextChildAnchor.h"

#import "OGTKWidget.h"

@implementation OGTKTextChildAnchor

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_TEXT_CHILD_ANCHOR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_TEXT_CHILD_ANCHOR);
	return gObjectClass;
}

+ (instancetype)textChildAnchor
{
	GtkTextChildAnchor* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_child_anchor_new(), GTK_TYPE_TEXT_CHILD_ANCHOR, GtkTextChildAnchor);

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

+ (instancetype)textChildAnchorWithReplacementWithCharacter:(OFString*)character
{
	GtkTextChildAnchor* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_text_child_anchor_new_with_replacement([character UTF8String]), GTK_TYPE_TEXT_CHILD_ANCHOR, GtkTextChildAnchor);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_TEXT_CHILD_ANCHOR, GtkTextChildAnchor);
}

- (bool)deleted
{
	bool returnValue = (bool)gtk_text_child_anchor_get_deleted((GtkTextChildAnchor*)[self castedGObject]);

	return returnValue;
}

- (GtkWidget**)widgetsWithOutLen:(guint*)outLen
{
	GtkWidget** returnValue = (GtkWidget**)gtk_text_child_anchor_get_widgets((GtkTextChildAnchor*)[self castedGObject], outLen);

	return returnValue;
}


@end