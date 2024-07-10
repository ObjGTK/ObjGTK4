/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCenterBox.h"

@implementation OGTKCenterBox

- (instancetype)init
{
	GtkCenterBox* gobjectValue = GTK_CENTER_BOX(gtk_center_box_new());

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

- (GtkCenterBox*)castedGObject
{
	return GTK_CENTER_BOX([self gObject]);
}

- (GtkBaselinePosition)baselinePosition
{
	GtkBaselinePosition returnValue = gtk_center_box_get_baseline_position([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)centerWidget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_center_box_get_center_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)endWidget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_center_box_get_end_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)startWidget
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_center_box_get_start_widget([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (void)setBaselinePosition:(GtkBaselinePosition)position
{
	gtk_center_box_set_baseline_position([self castedGObject], position);
}

- (void)setCenterWidget:(OGTKWidget*)child
{
	gtk_center_box_set_center_widget([self castedGObject], [child castedGObject]);
}

- (void)setEndWidget:(OGTKWidget*)child
{
	gtk_center_box_set_end_widget([self castedGObject], [child castedGObject]);
}

- (void)setStartWidget:(OGTKWidget*)child
{
	gtk_center_box_set_start_widget([self castedGObject], [child castedGObject]);
}


@end