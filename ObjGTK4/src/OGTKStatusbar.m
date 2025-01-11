/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStatusbar.h"

@implementation OGTKStatusbar

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STATUSBAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)statusbar
{
	GtkStatusbar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_statusbar_new(), GtkStatusbar, GtkStatusbar);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKStatusbar* wrapperObject;
	@try {
		wrapperObject = [[OGTKStatusbar alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkStatusbar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkStatusbar, GtkStatusbar);
}

- (guint)contextId:(OFString*)contextDescription
{
	guint returnValue = (guint)gtk_statusbar_get_context_id([self castedGObject], [contextDescription UTF8String]);

	return returnValue;
}

- (void)pop:(guint)contextId
{
	gtk_statusbar_pop([self castedGObject], contextId);
}

- (guint)pushWithContextId:(guint)contextId text:(OFString*)text
{
	guint returnValue = (guint)gtk_statusbar_push([self castedGObject], contextId, [text UTF8String]);

	return returnValue;
}

- (void)removeWithContextId:(guint)contextId messageId:(guint)messageId
{
	gtk_statusbar_remove([self castedGObject], contextId, messageId);
}

- (void)removeAll:(guint)contextId
{
	gtk_statusbar_remove_all([self castedGObject], contextId);
}


@end