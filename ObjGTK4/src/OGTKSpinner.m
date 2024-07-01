/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSpinner.h"

@implementation OGTKSpinner

- (instancetype)init
{
	GtkSpinner* gobjectValue = GTK_SPINNER(gtk_spinner_new());

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

- (GtkSpinner*)castedGObject
{
	return GTK_SPINNER([self gObject]);
}

- (bool)spinning
{
	bool returnValue = gtk_spinner_get_spinning([self castedGObject]);

	return returnValue;
}

- (void)setSpinning:(bool)spinning
{
	gtk_spinner_set_spinning([self castedGObject], spinning);
}

- (void)start
{
	gtk_spinner_start([self castedGObject]);
}

- (void)stop
{
	gtk_spinner_stop([self castedGObject]);
}


@end