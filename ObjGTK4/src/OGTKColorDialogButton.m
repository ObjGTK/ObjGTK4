/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKColorDialogButton.h"

#import "OGTKColorDialog.h"

@implementation OGTKColorDialogButton

- (instancetype)init:(OGTKColorDialog*)dialog
{
	GtkColorDialogButton* gobjectValue = GTK_COLOR_DIALOG_BUTTON(gtk_color_dialog_button_new([dialog castedGObject]));

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

- (GtkColorDialogButton*)castedGObject
{
	return GTK_COLOR_DIALOG_BUTTON([self gObject]);
}

- (OGTKColorDialog*)dialog
{
	GtkColorDialog* gobjectValue = GTK_COLOR_DIALOG(gtk_color_dialog_button_get_dialog([self castedGObject]));

	OGTKColorDialog* returnValue = [OGTKColorDialog withGObject:gobjectValue];
	return returnValue;
}

- (const GdkRGBA*)rgba
{
	const GdkRGBA* returnValue = gtk_color_dialog_button_get_rgba([self castedGObject]);

	return returnValue;
}

- (void)setDialog:(OGTKColorDialog*)dialog
{
	gtk_color_dialog_button_set_dialog([self castedGObject], [dialog castedGObject]);
}

- (void)setRgba:(const GdkRGBA*)color
{
	gtk_color_dialog_button_set_rgba([self castedGObject], color);
}


@end