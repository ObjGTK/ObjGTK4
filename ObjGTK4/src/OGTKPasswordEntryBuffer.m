/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPasswordEntryBuffer.h"

@implementation OGTKPasswordEntryBuffer

- (instancetype)init
{
	GtkPasswordEntryBuffer* gobjectValue = GTK_PASSWORD_ENTRY_BUFFER(gtk_password_entry_buffer_new());

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

- (GtkPasswordEntryBuffer*)castedGObject
{
	return GTK_PASSWORD_ENTRY_BUFFER([self gObject]);
}


@end