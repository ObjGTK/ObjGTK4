/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKScaleButton.h"

#import "OGTKAdjustment.h"

@implementation OGTKScaleButton

- (instancetype)initWithMin:(double)min max:(double)max step:(double)step icons:(const char**)icons
{
	GtkScaleButton* gobjectValue = GTK_SCALE_BUTTON(gtk_scale_button_new(min, max, step, icons));

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

- (GtkScaleButton*)castedGObject
{
	return GTK_SCALE_BUTTON([self gObject]);
}

- (OGTKAdjustment*)adjustment
{
	GtkAdjustment* gobjectValue = GTK_ADJUSTMENT(gtk_scale_button_get_adjustment([self castedGObject]));

	OGTKAdjustment* returnValue = [OGTKAdjustment withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)minusButton
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_scale_button_get_minus_button([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)plusButton
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_scale_button_get_plus_button([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGTKWidget*)popup
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_scale_button_get_popup([self castedGObject]));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (double)value
{
	double returnValue = gtk_scale_button_get_value([self castedGObject]);

	return returnValue;
}

- (void)setAdjustment:(OGTKAdjustment*)adjustment
{
	gtk_scale_button_set_adjustment([self castedGObject], [adjustment castedGObject]);
}

- (void)setIcons:(const char**)icons
{
	gtk_scale_button_set_icons([self castedGObject], icons);
}

- (void)setValue:(double)value
{
	gtk_scale_button_set_value([self castedGObject], value);
}


@end