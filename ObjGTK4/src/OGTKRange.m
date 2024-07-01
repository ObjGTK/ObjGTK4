/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKRange.h"

#import "OGTKAdjustment.h"

@implementation OGTKRange

- (GtkRange*)castedGObject
{
	return GTK_RANGE([self gObject]);
}

- (OGTKAdjustment*)adjustment
{
	GtkAdjustment* gobjectValue = GTK_ADJUSTMENT(gtk_range_get_adjustment([self castedGObject]));

	OGTKAdjustment* returnValue = [OGTKAdjustment withGObject:gobjectValue];
	return returnValue;
}

- (double)fillLevel
{
	double returnValue = gtk_range_get_fill_level([self castedGObject]);

	return returnValue;
}

- (bool)flippable
{
	bool returnValue = gtk_range_get_flippable([self castedGObject]);

	return returnValue;
}

- (bool)inverted
{
	bool returnValue = gtk_range_get_inverted([self castedGObject]);

	return returnValue;
}

- (void)rangeRect:(GdkRectangle*)rangeRect
{
	gtk_range_get_range_rect([self castedGObject], rangeRect);
}

- (bool)restrictToFillLevel
{
	bool returnValue = gtk_range_get_restrict_to_fill_level([self castedGObject]);

	return returnValue;
}

- (int)roundDigits
{
	int returnValue = gtk_range_get_round_digits([self castedGObject]);

	return returnValue;
}

- (bool)showFillLevel
{
	bool returnValue = gtk_range_get_show_fill_level([self castedGObject]);

	return returnValue;
}

- (void)sliderRangeWithSliderStart:(int*)sliderStart sliderEnd:(int*)sliderEnd
{
	gtk_range_get_slider_range([self castedGObject], sliderStart, sliderEnd);
}

- (bool)sliderSizeFixed
{
	bool returnValue = gtk_range_get_slider_size_fixed([self castedGObject]);

	return returnValue;
}

- (double)value
{
	double returnValue = gtk_range_get_value([self castedGObject]);

	return returnValue;
}

- (void)setAdjustment:(OGTKAdjustment*)adjustment
{
	gtk_range_set_adjustment([self castedGObject], [adjustment castedGObject]);
}

- (void)setFillLevel:(double)fillLevel
{
	gtk_range_set_fill_level([self castedGObject], fillLevel);
}

- (void)setFlippable:(bool)flippable
{
	gtk_range_set_flippable([self castedGObject], flippable);
}

- (void)setIncrementsWithStep:(double)step page:(double)page
{
	gtk_range_set_increments([self castedGObject], step, page);
}

- (void)setInverted:(bool)setting
{
	gtk_range_set_inverted([self castedGObject], setting);
}

- (void)setRangeWithMin:(double)min max:(double)max
{
	gtk_range_set_range([self castedGObject], min, max);
}

- (void)setRestrictToFillLevel:(bool)restrictToFillLevel
{
	gtk_range_set_restrict_to_fill_level([self castedGObject], restrictToFillLevel);
}

- (void)setRoundDigits:(int)roundDigits
{
	gtk_range_set_round_digits([self castedGObject], roundDigits);
}

- (void)setShowFillLevel:(bool)showFillLevel
{
	gtk_range_set_show_fill_level([self castedGObject], showFillLevel);
}

- (void)setSliderSizeFixed:(bool)sizeFixed
{
	gtk_range_set_slider_size_fixed([self castedGObject], sizeFixed);
}

- (void)setValue:(double)value
{
	gtk_range_set_value([self castedGObject], value);
}


@end