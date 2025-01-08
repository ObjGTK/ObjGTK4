/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKScaleButton.h"

#import "OGTKAdjustment.h"

@implementation OGTKScaleButton

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SCALE_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithMin:(double)min max:(double)max step:(double)step icons:(const char**)icons
{
	GtkScaleButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_scale_button_new(min, max, step, icons), GtkScaleButton, GtkScaleButton);

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

- (GtkScaleButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkScaleButton, GtkScaleButton);
}

- (bool)active
{
	bool returnValue = (bool)gtk_scale_button_get_active([self castedGObject]);

	return returnValue;
}

- (OGTKAdjustment*)adjustment
{
	GtkAdjustment* gobjectValue = gtk_scale_button_get_adjustment([self castedGObject]);

	OGTKAdjustment* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)hasFrame
{
	bool returnValue = (bool)gtk_scale_button_get_has_frame([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)minusButton
{
	GtkWidget* gobjectValue = gtk_scale_button_get_minus_button([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)plusButton
{
	GtkWidget* gobjectValue = gtk_scale_button_get_plus_button([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGTKWidget*)popup
{
	GtkWidget* gobjectValue = gtk_scale_button_get_popup([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (double)value
{
	double returnValue = (double)gtk_scale_button_get_value([self castedGObject]);

	return returnValue;
}

- (void)setAdjustment:(OGTKAdjustment*)adjustment
{
	gtk_scale_button_set_adjustment([self castedGObject], [adjustment castedGObject]);
}

- (void)setHasFrame:(bool)hasFrame
{
	gtk_scale_button_set_has_frame([self castedGObject], hasFrame);
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