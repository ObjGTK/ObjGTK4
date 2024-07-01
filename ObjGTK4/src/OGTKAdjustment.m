/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAdjustment.h"

@implementation OGTKAdjustment

- (instancetype)initWithValue:(double)value lower:(double)lower upper:(double)upper stepIncrement:(double)stepIncrement pageIncrement:(double)pageIncrement pageSize:(double)pageSize
{
	GtkAdjustment* gobjectValue = GTK_ADJUSTMENT(gtk_adjustment_new(value, lower, upper, stepIncrement, pageIncrement, pageSize));

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

- (GtkAdjustment*)castedGObject
{
	return GTK_ADJUSTMENT([self gObject]);
}

- (void)clampPageWithLower:(double)lower upper:(double)upper
{
	gtk_adjustment_clamp_page([self castedGObject], lower, upper);
}

- (void)configureWithValue:(double)value lower:(double)lower upper:(double)upper stepIncrement:(double)stepIncrement pageIncrement:(double)pageIncrement pageSize:(double)pageSize
{
	gtk_adjustment_configure([self castedGObject], value, lower, upper, stepIncrement, pageIncrement, pageSize);
}

- (double)lower
{
	double returnValue = gtk_adjustment_get_lower([self castedGObject]);

	return returnValue;
}

- (double)minimumIncrement
{
	double returnValue = gtk_adjustment_get_minimum_increment([self castedGObject]);

	return returnValue;
}

- (double)pageIncrement
{
	double returnValue = gtk_adjustment_get_page_increment([self castedGObject]);

	return returnValue;
}

- (double)pageSize
{
	double returnValue = gtk_adjustment_get_page_size([self castedGObject]);

	return returnValue;
}

- (double)stepIncrement
{
	double returnValue = gtk_adjustment_get_step_increment([self castedGObject]);

	return returnValue;
}

- (double)upper
{
	double returnValue = gtk_adjustment_get_upper([self castedGObject]);

	return returnValue;
}

- (double)value
{
	double returnValue = gtk_adjustment_get_value([self castedGObject]);

	return returnValue;
}

- (void)setLower:(double)lower
{
	gtk_adjustment_set_lower([self castedGObject], lower);
}

- (void)setPageIncrement:(double)pageIncrement
{
	gtk_adjustment_set_page_increment([self castedGObject], pageIncrement);
}

- (void)setPageSize:(double)pageSize
{
	gtk_adjustment_set_page_size([self castedGObject], pageSize);
}

- (void)setStepIncrement:(double)stepIncrement
{
	gtk_adjustment_set_step_increment([self castedGObject], stepIncrement);
}

- (void)setUpper:(double)upper
{
	gtk_adjustment_set_upper([self castedGObject], upper);
}

- (void)setValue:(double)value
{
	gtk_adjustment_set_value([self castedGObject], value);
}


@end