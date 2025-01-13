/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKScale.h"

#import "OGTKAdjustment.h"
#import "OGTKWidget.h"
#import <OGPango/OGPangoLayout.h>

@implementation OGTKScale

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SCALE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)scaleWithOrientation:(GtkOrientation)orientation adjustment:(OGTKAdjustment*)adjustment
{
	GtkScale* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_scale_new(orientation, [adjustment castedGObject]), GtkScale, GtkScale);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKScale* wrapperObject;
	@try {
		wrapperObject = [[OGTKScale alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)scaleWithRangeWithOrientation:(GtkOrientation)orientation min:(double)min max:(double)max step:(double)step
{
	GtkScale* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_scale_new_with_range(orientation, min, max, step), GtkScale, GtkScale);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKScale* wrapperObject;
	@try {
		wrapperObject = [[OGTKScale alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkScale*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkScale, GtkScale);
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
	int returnValue = (int)gtk_scale_get_digits([self castedGObject]);

	return returnValue;
}

- (bool)drawValue
{
	bool returnValue = (bool)gtk_scale_get_draw_value([self castedGObject]);

	return returnValue;
}

- (bool)hasOrigin
{
	bool returnValue = (bool)gtk_scale_get_has_origin([self castedGObject]);

	return returnValue;
}

- (OGPangoLayout*)layout
{
	PangoLayout* gobjectValue = gtk_scale_get_layout([self castedGObject]);

	OGPangoLayout* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)layoutOffsetsWithX:(int*)x y:(int*)y
{
	gtk_scale_get_layout_offsets([self castedGObject], x, y);
}

- (GtkPositionType)valuePos
{
	GtkPositionType returnValue = (GtkPositionType)gtk_scale_get_value_pos([self castedGObject]);

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

- (void)setFormatValueFunc:(GtkScaleFormatValueFunc)func userData:(gpointer)userData destroyNotify:(GDestroyNotify)destroyNotify
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