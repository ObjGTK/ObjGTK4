/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKScale.h"

#import "OGTKWidget.h"
#import <OGPango/OGPangoLayout.h>
#import "OGTKAdjustment.h"

@implementation OGTKScale

- (instancetype)initWithOrientation:(GtkOrientation)orientation adjustment:(OGTKAdjustment*)adjustment
{
	GtkScale* gobjectValue = GTK_SCALE(gtk_scale_new(orientation, [adjustment castedGObject]));

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

- (instancetype)initWithRangeWithOrientation:(GtkOrientation)orientation min:(double)min max:(double)max step:(double)step
{
	GtkScale* gobjectValue = GTK_SCALE(gtk_scale_new_with_range(orientation, min, max, step));

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

- (GtkScale*)castedGObject
{
	return GTK_SCALE([self gObject]);
}

- (void)addMarkWithValue:(double)value position:(GtkPositionType)position markup:(OFString*)markup
{
	gtk_scale_add_mark([self castedGObject], value, position, [markup UTF8String]);
}

- (void)clearMarks
{
	gtk_scale_clear_marks([self castedGObject]);
}

- (int)digits
{
	int returnValue = gtk_scale_get_digits([self castedGObject]);

	return returnValue;
}

- (bool)drawValue
{
	bool returnValue = gtk_scale_get_draw_value([self castedGObject]);

	return returnValue;
}

- (bool)hasOrigin
{
	bool returnValue = gtk_scale_get_has_origin([self castedGObject]);

	return returnValue;
}

- (OGPangoLayout*)layout
{
	PangoLayout* gobjectValue = PANGO_LAYOUT(gtk_scale_get_layout([self castedGObject]));

	OGPangoLayout* returnValue = [OGPangoLayout withGObject:gobjectValue];
	return returnValue;
}

- (void)layoutOffsetsWithX:(int*)x y:(int*)y
{
	gtk_scale_get_layout_offsets([self castedGObject], x, y);
}

- (GtkPositionType)valuePos
{
	GtkPositionType returnValue = gtk_scale_get_value_pos([self castedGObject]);

	return returnValue;
}

- (void)setDigits:(int)digits
{
	gtk_scale_set_digits([self castedGObject], digits);
}

- (void)setDrawValue:(bool)drawValue
{
	gtk_scale_set_draw_value([self castedGObject], drawValue);
}

- (void)setFormatValueFuncWithFunc:(GtkScaleFormatValueFunc)func userData:(gpointer)userData destroyNotify:(GDestroyNotify)destroyNotify
{
	gtk_scale_set_format_value_func([self castedGObject], func, userData, destroyNotify);
}

- (void)setHasOrigin:(bool)hasOrigin
{
	gtk_scale_set_has_origin([self castedGObject], hasOrigin);
}

- (void)setValuePos:(GtkPositionType)pos
{
	gtk_scale_set_value_pos([self castedGObject], pos);
}


@end