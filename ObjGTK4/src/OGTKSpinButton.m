/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSpinButton.h"

#import "OGTKAdjustment.h"

@implementation OGTKSpinButton

- (instancetype)initWithAdjustment:(OGTKAdjustment*)adjustment climbRate:(double)climbRate digits:(guint)digits
{
	GtkSpinButton* gobjectValue = GTK_SPIN_BUTTON(gtk_spin_button_new([adjustment castedGObject], climbRate, digits));

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

- (instancetype)initWithRangeWithMin:(double)min max:(double)max step:(double)step
{
	GtkSpinButton* gobjectValue = GTK_SPIN_BUTTON(gtk_spin_button_new_with_range(min, max, step));

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

- (GtkSpinButton*)castedGObject
{
	return GTK_SPIN_BUTTON([self gObject]);
}

- (void)configureWithAdjustment:(OGTKAdjustment*)adjustment climbRate:(double)climbRate digits:(guint)digits
{
	gtk_spin_button_configure([self castedGObject], [adjustment castedGObject], climbRate, digits);
}

- (OGTKAdjustment*)adjustment
{
	GtkAdjustment* gobjectValue = GTK_ADJUSTMENT(gtk_spin_button_get_adjustment([self castedGObject]));

	OGTKAdjustment* returnValue = [OGTKAdjustment withGObject:gobjectValue];
	return returnValue;
}

- (double)climbRate
{
	double returnValue = gtk_spin_button_get_climb_rate([self castedGObject]);

	return returnValue;
}

- (guint)digits
{
	guint returnValue = gtk_spin_button_get_digits([self castedGObject]);

	return returnValue;
}

- (void)incrementsWithStep:(double*)step page:(double*)page
{
	gtk_spin_button_get_increments([self castedGObject], step, page);
}

- (bool)numeric
{
	bool returnValue = gtk_spin_button_get_numeric([self castedGObject]);

	return returnValue;
}

- (void)rangeWithMin:(double*)min max:(double*)max
{
	gtk_spin_button_get_range([self castedGObject], min, max);
}

- (bool)snapToTicks
{
	bool returnValue = gtk_spin_button_get_snap_to_ticks([self castedGObject]);

	return returnValue;
}

- (GtkSpinButtonUpdatePolicy)updatePolicy
{
	GtkSpinButtonUpdatePolicy returnValue = gtk_spin_button_get_update_policy([self castedGObject]);

	return returnValue;
}

- (double)value
{
	double returnValue = gtk_spin_button_get_value([self castedGObject]);

	return returnValue;
}

- (int)valueAsInt
{
	int returnValue = gtk_spin_button_get_value_as_int([self castedGObject]);

	return returnValue;
}

- (bool)wrap
{
	bool returnValue = gtk_spin_button_get_wrap([self castedGObject]);

	return returnValue;
}

- (void)setAdjustment:(OGTKAdjustment*)adjustment
{
	gtk_spin_button_set_adjustment([self castedGObject], [adjustment castedGObject]);
}

- (void)setClimbRate:(double)climbRate
{
	gtk_spin_button_set_climb_rate([self castedGObject], climbRate);
}

- (void)setDigits:(guint)digits
{
	gtk_spin_button_set_digits([self castedGObject], digits);
}

- (void)setIncrementsWithStep:(double)step page:(double)page
{
	gtk_spin_button_set_increments([self castedGObject], step, page);
}

- (void)setNumeric:(bool)numeric
{
	gtk_spin_button_set_numeric([self castedGObject], numeric);
}

- (void)setRangeWithMin:(double)min max:(double)max
{
	gtk_spin_button_set_range([self castedGObject], min, max);
}

- (void)setSnapToTicks:(bool)snapToTicks
{
	gtk_spin_button_set_snap_to_ticks([self castedGObject], snapToTicks);
}

- (void)setUpdatePolicy:(GtkSpinButtonUpdatePolicy)policy
{
	gtk_spin_button_set_update_policy([self castedGObject], policy);
}

- (void)setValue:(double)value
{
	gtk_spin_button_set_value([self castedGObject], value);
}

- (void)setWrap:(bool)wrap
{
	gtk_spin_button_set_wrap([self castedGObject], wrap);
}

- (void)spinWithDirection:(GtkSpinType)direction increment:(double)increment
{
	gtk_spin_button_spin([self castedGObject], direction, increment);
}

- (void)update
{
	gtk_spin_button_update([self castedGObject]);
}


@end