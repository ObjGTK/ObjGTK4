/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStatusbar.h"

@implementation OGTKStatusbar

- (instancetype)init
{
	GtkStatusbar* gobjectValue = GTK_STATUSBAR(gtk_statusbar_new());

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

- (GtkStatusbar*)castedGObject
{
	return GTK_STATUSBAR([self gObject]);
}

- (guint)contextId:(OFString*)contextDescription
{
	guint returnValue = gtk_statusbar_get_context_id([self castedGObject], [contextDescription UTF8String]);

	return returnValue;
}

- (void)pop:(guint)contextId
{
	gtk_statusbar_pop([self castedGObject], contextId);
}

- (guint)pushWithContextId:(guint)contextId text:(OFString*)text
{
	guint returnValue = gtk_statusbar_push([self castedGObject], contextId, [text UTF8String]);

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