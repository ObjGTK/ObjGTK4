/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKToggleButton.h"

#import "OGTKWidget.h"

@implementation OGTKToggleButton

- (instancetype)init
{
	GtkToggleButton* gobjectValue = GTK_TOGGLE_BUTTON(gtk_toggle_button_new());

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

- (instancetype)initWithLabel:(OFString*)label
{
	GtkToggleButton* gobjectValue = GTK_TOGGLE_BUTTON(gtk_toggle_button_new_with_label([label UTF8String]));

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

- (instancetype)initWithMnemonic:(OFString*)label
{
	GtkToggleButton* gobjectValue = GTK_TOGGLE_BUTTON(gtk_toggle_button_new_with_mnemonic([label UTF8String]));

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

- (GtkToggleButton*)castedGObject
{
	return GTK_TOGGLE_BUTTON([self gObject]);
}

- (bool)active
{
	bool returnValue = gtk_toggle_button_get_active([self castedGObject]);

	return returnValue;
}

- (void)setActive:(bool)isActive
{
	gtk_toggle_button_set_active([self castedGObject], isActive);
}

- (void)setGroup:(OGTKToggleButton*)group
{
	gtk_toggle_button_set_group([self castedGObject], [group castedGObject]);
}

- (void)toggled
{
	gtk_toggle_button_toggled([self castedGObject]);
}


@end