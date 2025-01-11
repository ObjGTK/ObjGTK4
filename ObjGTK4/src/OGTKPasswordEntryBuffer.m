/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKPasswordEntryBuffer.h"

@implementation OGTKPasswordEntryBuffer

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_PASSWORD_ENTRY_BUFFER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)passwordEntryBuffer
{
	GtkPasswordEntryBuffer* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_password_entry_buffer_new(), GtkPasswordEntryBuffer, GtkPasswordEntryBuffer);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKPasswordEntryBuffer* wrapperObject;
	@try {
		wrapperObject = [[OGTKPasswordEntryBuffer alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkPasswordEntryBuffer*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkPasswordEntryBuffer, GtkPasswordEntryBuffer);
}


@end