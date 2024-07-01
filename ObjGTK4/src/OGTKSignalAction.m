/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSignalAction.h"

@implementation OGTKSignalAction

- (instancetype)init:(OFString*)signalName
{
	GtkSignalAction* gobjectValue = GTK_SIGNAL_ACTION(gtk_signal_action_new([signalName UTF8String]));

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

- (GtkSignalAction*)castedGObject
{
	return GTK_SIGNAL_ACTION([self gObject]);
}

- (OFString*)signalName
{
	const char* gobjectValue = gtk_signal_action_get_signal_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end