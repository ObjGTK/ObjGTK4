/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKLevelBar.h"

@implementation OGTKLevelBar

- (instancetype)init
{
	GtkLevelBar* gobjectValue = GTK_LEVEL_BAR(gtk_level_bar_new());

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

- (instancetype)initForIntervalWithMinValue:(double)minValue maxValue:(double)maxValue
{
	GtkLevelBar* gobjectValue = GTK_LEVEL_BAR(gtk_level_bar_new_for_interval(minValue, maxValue));

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

- (GtkLevelBar*)castedGObject
{
	return GTK_LEVEL_BAR([self gObject]);
}

- (void)addOffsetValueWithName:(OFString*)name value:(double)value
{
	gtk_level_bar_add_offset_value([self castedGObject], [name UTF8String], value);
}

- (bool)inverted
{
	bool returnValue = gtk_level_bar_get_inverted([self castedGObject]);

	return returnValue;
}

- (double)maxValue
{
	double returnValue = gtk_level_bar_get_max_value([self castedGObject]);

	return returnValue;
}

- (double)minValue
{
	double returnValue = gtk_level_bar_get_min_value([self castedGObject]);

	return returnValue;
}

- (GtkLevelBarMode)mode
{
	GtkLevelBarMode returnValue = gtk_level_bar_get_mode([self castedGObject]);

	return returnValue;
}

- (bool)offsetValueWithName:(OFString*)name value:(double*)value
{
	bool returnValue = gtk_level_bar_get_offset_value([self castedGObject], [name UTF8String], value);

	return returnValue;
}

- (double)value
{
	double returnValue = gtk_level_bar_get_value([self castedGObject]);

	return returnValue;
}

- (void)removeOffsetValue:(OFString*)name
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