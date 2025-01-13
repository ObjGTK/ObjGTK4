/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLevelBar.h"

@implementation OGTKLevelBar

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_LEVEL_BAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)levelBar
{
	GtkLevelBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_level_bar_new(), GtkLevelBar, GtkLevelBar);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKLevelBar* wrapperObject;
	@try {
		wrapperObject = [[OGTKLevelBar alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)levelBarForIntervalWithMinValue:(double)minValue maxValue:(double)maxValue
{
	GtkLevelBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_level_bar_new_for_interval(minValue, maxValue), GtkLevelBar, GtkLevelBar);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKLevelBar* wrapperObject;
	@try {
		wrapperObject = [[OGTKLevelBar alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkLevelBar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkLevelBar, GtkLevelBar);
}

- (void)addOffsetValueWithName:(OFString*)name value:(double)value
{
	gtk_level_bar_add_offset_value([self castedGObject], [name UTF8String], value);
}

- (bool)inverted
{
	bool returnValue = (bool)gtk_level_bar_get_inverted([self castedGObject]);

	return returnValue;
}

- (double)maxValue
{
	double returnValue = (double)gtk_level_bar_get_max_value([self castedGObject]);

	return returnValue;
}

- (double)minValue
{
	double returnValue = (double)gtk_level_bar_get_min_value([self castedGObject]);

	return returnValue;
}

- (GtkLevelBarMode)mode
{
	GtkLevelBarMode returnValue = (GtkLevelBarMode)gtk_level_bar_get_mode([self castedGObject]);

	return returnValue;
}

- (bool)offsetValueWithName:(OFString*)name value:(double*)value
{
	bool returnValue = (bool)gtk_level_bar_get_offset_value([self castedGObject], [name UTF8String], value);

	return returnValue;
}

- (double)value
{
	double returnValue = (double)gtk_level_bar_get_value([self castedGObject]);

	return returnValue;
}

- (void)removeOffsetValueWithName:(OFString*)name
{
	gtk_level_bar_remove_offset_value([self castedGObject], [name UTF8String]);
}

- (void)setInverted:(bool)inverted
{
	gtk_level_bar_set_inverted([self castedGObject], inverted);
}

- (void)setMaxValue:(double)value
{
	gtk_level_bar_set_max_value([self castedGObject], value);
}

- (void)setMinValue:(double)value
{
	gtk_level_bar_set_min_value([self castedGObject], value);
}

- (void)setMode:(GtkLevelBarMode)mode
{
	gtk_level_bar_set_mode([self castedGObject], mode);
}

- (void)setValue:(double)value
{
	gtk_level_bar_set_value([self castedGObject], value);
}


@end