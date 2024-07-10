/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKVolumeButton.h"

#import "OGTKWidget.h"

@implementation OGTKVolumeButton

- (instancetype)init
{
	GtkVolumeButton* gobjectValue = GTK_VOLUME_BUTTON(gtk_volume_button_new());

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkVolumeButton*)castedGObject
{
	return GTK_VOLUME_BUTTON([self gObject]);
}


@end