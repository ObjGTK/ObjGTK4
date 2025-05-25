/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKRange.h"

#import "OGTKAdjustment.h"

@implementation OGTKRange

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_RANGE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_RANGE);
	return gObjectClass;
}

- (GtkRange*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_RANGE, GtkRange);
}

- (OGTKAdjustment*)adjustment
{
	GtkAdjustment* gobjectValue = gtk_range_get_adjustment((GtkRange*)[self castedGObject]);

	OGTKAdjustment* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (double)fillLevel
{
	double returnValue = (double)gtk_range_get_fill_level((GtkRange*)[self castedGObject]);

	return returnValue;
}

- (bool)flippable
{
	bool returnValue = (bool)gtk_range_get_flippable((GtkRange*)[self castedGObject]);

	return returnValue;
}

- (bool)inverted
{
	bool returnValue = (bool)gtk_range_get_inverted((GtkRange*)[self castedGObject]);

	return returnValue;
}

- (void)rangeRect:(GdkRectangle*)rangeRect
{
	gtk_range_get_range_rect((GtkRange*)[self castedGObject], rangeRect);
}

- (bool)restrictToFillLevel
{
	bool returnValue = (bool)gtk_range_get_restrict_to_fill_level((GtkRange*)[self castedGObject]);

	return returnValue;
}

- (int)roundDigits
{
	int returnValue = (int)gtk_range_get_round_digits((GtkRange*)[self castedGObject]);

	return returnValue;
}

- (bool)showFillLevel
{
	bool returnValue = (bool)gtk_range_get_show_fill_level((GtkRange*)[self castedGObject]);

	return returnValue;
}

- (void)sliderRangeWithSliderStart:(int*)sliderStart sliderEnd:(int*)sliderEnd
{
	gtk_range_get_slider_range((GtkRange*)[self castedGObject], sliderStart, sliderEnd);
}

- (bool)sliderSizeFixed
{
	bool returnValue = (bool)gtk_range_get_slider_size_fixed((GtkRange*)[self castedGObject]);

	return returnValue;
}

- (double)value
{
	double returnValue = (double)gtk_range_get_value((GtkRange*)[self castedGObject]);

	return returnValue;
}

- (void)setAdjustment:(OGTKAdjustment*)adjustment
{
	gtk_range_set_adjustment((GtkRange*)[self castedGObject], [adjustment castedGObject]);
}

- (void)setFillLevel:(double)fillLevel
{
	gtk_range_set_fill_level((GtkRange*)[self castedGObject], fillLevel);
}

- (void)setFlippable:(bool)flippable
{
	gtk_range_set_flippable((GtkRange*)[self castedGObject], flippable);
}

- (void)setIncrementsWithStep:(double)step page:(double)page
{
	gtk_range_set_increments((GtkRange*)[self castedGObject], step, page);
}

- (void)setInvertedWithSetting:(bool)setting
{
	gtk_range_set_inverted((GtkRange*)[self castedGObject], setting);
}

- (void)setRangeWithMin:(double)min max:(double)max
{
	gtk_range_set_range((GtkRange*)[self castedGObject], min, max);
}

- (void)setRestrictToFillLevel:(bool)restrictToFillLevel
{
	gtk_range_set_restrict_to_fill_level((GtkRange*)[self castedGObject], restrictToFillLevel);
}

- (void)setRoundDigits:(int)roundDigits
{
	gtk_range_set_round_digits((GtkRange*)[self castedGObject], roundDigits);
}

- (void)setShowFillLevel:(bool)showFillLevel
{
	gtk_range_set_show_fill_level((GtkRange*)[self castedGObject], showFillLevel);
}

- (void)setSliderSizeFixed:(bool)sizeFixed
{
	gtk_range_set_slider_size_fixed((GtkRange*)[self castedGObject], sizeFixed);
}

- (void)setValue:(double)value
{
	gtk_range_set_value((GtkRange*)[self castedGObject], value);
}


@end