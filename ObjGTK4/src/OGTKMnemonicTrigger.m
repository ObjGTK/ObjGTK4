/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKMnemonicTrigger.h"

@implementation OGTKMnemonicTrigger

- (instancetype)init:(guint)keyval
{
	GtkMnemonicTrigger* gobjectValue = GTK_MNEMONIC_TRIGGER(gtk_mnemonic_trigger_new(keyval));

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

- (GtkMnemonicTrigger*)castedGObject
{
	return GTK_MNEMONIC_TRIGGER([self gObject]);
}

- (guint)keyval
{
	guint returnValue = gtk_mnemonic_trigger_get_keyval([self castedGObject]);

	return returnValue;
}


@end