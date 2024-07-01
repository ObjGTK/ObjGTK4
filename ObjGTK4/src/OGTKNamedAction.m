/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKNamedAction.h"

@implementation OGTKNamedAction

- (instancetype)init:(OFString*)name
{
	GtkNamedAction* gobjectValue = GTK_NAMED_ACTION(gtk_named_action_new([name UTF8String]));

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

- (GtkNamedAction*)castedGObject
{
	return GTK_NAMED_ACTION([self gObject]);
}

- (OFString*)actionName
{
	const char* gobjectValue = gtk_named_action_get_action_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end