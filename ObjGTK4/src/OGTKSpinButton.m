/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKSpinButton.h"

#import "OGTKAdjustment.h"

@implementation OGTKSpinButton

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SPIN_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SPIN_BUTTON);
	return gObjectClass;
}

+ (instancetype)spinButtonWithAdjustment:(OGTKAdjustment*)adjustment climbRate:(double)climbRate digits:(guint)digits
{
	GtkSpinButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_spin_button_new([adjustment castedGObject], climbRate, digits), GTK_TYPE_SPIN_BUTTON, GtkSpinButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKSpinButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKSpinButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)spinButtonWithRangeWithMin:(double)min max:(double)max step:(double)step
{
	GtkSpinButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_spin_button_new_with_range(min, max, step), GTK_TYPE_SPIN_BUTTON, GtkSpinButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKSpinButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKSpinButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkSpinButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SPIN_BUTTON, GtkSpinButton);
}

- (void)configureWithAdjustment:(OGTKAdjustment*)adjustment climbRate:(double)climbRate digits:(guint)digits
{
	gtk_spin_button_configure((GtkSpinButton*)[self castedGObject], [adjustment castedGObject], climbRate, digits);
}

- (bool)activatesDefault
{
	bool returnValue = (bool)gtk_spin_button_get_activates_default((GtkSpinButton*)[self castedGObject]);

	return returnValue;
}

- (OGTKAdjustment*)adjustment
{
	GtkAdjustment* gobjectValue = gtk_spin_button_get_adjustment((GtkSpinButton*)[self castedGObject]);

	OGTKAdjustment* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (double)climbRate
{
	double returnValue = (double)gtk_spin_button_get_climb_rate((GtkSpinButton*)[self castedGObject]);

	return returnValue;
}

- (guint)digits
{
	guint returnValue = (guint)gtk_spin_button_get_digits((GtkSpinButton*)[self castedGObject]);

	return returnValue;
}

- (void)incrementsWithStep:(double*)step page:(double*)page
{
	gtk_spin_button_get_increments((GtkSpinButton*)[self castedGObject], step, page);
}

- (bool)numeric
{
	bool returnValue = (bool)gtk_spin_button_get_numeric((GtkSpinButton*)[self castedGObject]);

	return returnValue;
}

- (void)rangeWithMin:(double*)min max:(double*)max
{
	gtk_spin_button_get_range((GtkSpinButton*)[self castedGObject], min, max);
}

- (bool)snapToTicks
{
	bool returnValue = (bool)gtk_spin_button_get_snap_to_ticks((GtkSpinButton*)[self castedGObject]);

	return returnValue;
}

- (GtkSpinButtonUpdatePolicy)updatePolicy
{
	GtkSpinButtonUpdatePolicy returnValue = (GtkSpinButtonUpdatePolicy)gtk_spin_button_get_update_policy((GtkSpinButton*)[self castedGObject]);

	return returnValue;
}

- (double)value
{
	double returnValue = (double)gtk_spin_button_get_value((GtkSpinButton*)[self castedGObject]);

	return returnValue;
}

- (int)valueAsInt
{
	int returnValue = (int)gtk_spin_button_get_value_as_int((GtkSpinButton*)[self castedGObject]);

	return returnValue;
}

- (bool)wrap
{
	bool returnValue = (bool)gtk_spin_button_get_wrap((GtkSpinButton*)[self castedGObject]);

	return returnValue;
}

- (void)setActivatesDefault:(bool)activatesDefault
{
	gtk_spin_button_set_activates_default((GtkSpinButton*)[self castedGObject], activatesDefault);
}

- (void)setAdjustment:(OGTKAdjustment*)adjustment
{
	gtk_spin_button_set_adjustment((GtkSpinButton*)[self castedGObject], [adjustment castedGObject]);
}

- (void)setClimbRate:(double)climbRate
{
	gtk_spin_button_set_climb_rate((GtkSpinButton*)[self castedGObject], climbRate);
}

- (void)setDigits:(guint)digits
{
	gtk_spin_button_set_digits((GtkSpinButton*)[self castedGObject], digits);
}

- (void)setIncrementsWithStep:(double)step page:(double)page
{
	gtk_spin_button_set_increments((GtkSpinButton*)[self castedGObject], step, page);
}

- (void)setNumeric:(bool)numeric
{
	gtk_spin_button_set_numeric((GtkSpinButton*)[self castedGObject], numeric);
}

- (void)setRangeWithMin:(double)min max:(double)max
{
	gtk_spin_button_set_range((GtkSpinButton*)[self castedGObject], min, max);
}

- (void)setSnapToTicks:(bool)snapToTicks
{
	gtk_spin_button_set_snap_to_ticks((GtkSpinButton*)[self castedGObject], snapToTicks);
}

- (void)setUpdatePolicy:(GtkSpinButtonUpdatePolicy)policy
{
	gtk_spin_button_set_update_policy((GtkSpinButton*)[self castedGObject], policy);
}

- (void)setValue:(double)value
{
	gtk_spin_button_set_value((GtkSpinButton*)[self castedGObject], value);
}

- (void)setWrap:(bool)wrap
{
	gtk_spin_button_set_wrap((GtkSpinButton*)[self castedGObject], wrap);
}

- (void)spinWithDirection:(GtkSpinType)direction increment:(double)increment
{
	gtk_spin_button_spin((GtkSpinButton*)[self castedGObject], direction, increment);
}

- (void)update
{
	gtk_spin_button_update((GtkSpinButton*)[self castedGObject]);
}


@end