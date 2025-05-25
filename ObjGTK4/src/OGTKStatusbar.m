/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStatusbar.h"

@implementation OGTKStatusbar

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STATUSBAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_STATUSBAR);
	return gObjectClass;
}

+ (instancetype)statusbar
{
	GtkStatusbar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_statusbar_new(), GTK_TYPE_STATUSBAR, GtkStatusbar);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_STATUSBAR, GtkStatusbar);
}

- (guint)contextIdWithContextDescription:(OFString*)contextDescription
{
	guint returnValue = (guint)gtk_statusbar_get_context_id((GtkStatusbar*)[self castedGObject], [contextDescription UTF8String]);

	return returnValue;
}

- (void)popWithContextId:(guint)contextId
{
	gtk_statusbar_pop((GtkStatusbar*)[self castedGObject], contextId);
}

- (guint)pushWithContextId:(guint)contextId text:(OFString*)text
{
	guint returnValue = (guint)gtk_statusbar_push((GtkStatusbar*)[self castedGObject], contextId, [text UTF8String]);

	return returnValue;
}

- (void)removeWithContextId:(guint)contextId messageId:(guint)messageId
{
	gtk_statusbar_remove((GtkStatusbar*)[self castedGObject], contextId, messageId);
}

- (void)removeAllWithContextId:(guint)contextId
{
	gtk_statusbar_remove_all((GtkStatusbar*)[self castedGObject], contextId);
}


@end