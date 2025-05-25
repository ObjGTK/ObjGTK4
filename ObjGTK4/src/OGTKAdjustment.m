/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAdjustment.h"

@implementation OGTKAdjustment

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ADJUSTMENT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_ADJUSTMENT);
	return gObjectClass;
}

+ (instancetype)adjustmentWithValue:(double)value lower:(double)lower upper:(double)upper stepIncrement:(double)stepIncrement pageIncrement:(double)pageIncrement pageSize:(double)pageSize
{
	GtkAdjustment* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_adjustment_new(value, lower, upper, stepIncrement, pageIncrement, pageSize), GTK_TYPE_ADJUSTMENT, GtkAdjustment);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKAdjustment* wrapperObject;
	@try {
		wrapperObject = [[OGTKAdjustment alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkAdjustment*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_ADJUSTMENT, GtkAdjustment);
}

- (void)clampPageWithLower:(double)lower upper:(double)upper
{
	gtk_adjustment_clamp_page((GtkAdjustment*)[self castedGObject], lower, upper);
}

- (void)configureWithValue:(double)value lower:(double)lower upper:(double)upper stepIncrement:(double)stepIncrement pageIncrement:(double)pageIncrement pageSize:(double)pageSize
{
	gtk_adjustment_configure((GtkAdjustment*)[self castedGObject], value, lower, upper, stepIncrement, pageIncrement, pageSize);
}

- (double)lower
{
	double returnValue = (double)gtk_adjustment_get_lower((GtkAdjustment*)[self castedGObject]);

	return returnValue;
}

- (double)minimumIncrement
{
	double returnValue = (double)gtk_adjustment_get_minimum_increment((GtkAdjustment*)[self castedGObject]);

	return returnValue;
}

- (double)pageIncrement
{
	double returnValue = (double)gtk_adjustment_get_page_increment((GtkAdjustment*)[self castedGObject]);

	return returnValue;
}

- (double)pageSize
{
	double returnValue = (double)gtk_adjustment_get_page_size((GtkAdjustment*)[self castedGObject]);

	return returnValue;
}

- (double)stepIncrement
{
	double returnValue = (double)gtk_adjustment_get_step_increment((GtkAdjustment*)[self castedGObject]);

	return returnValue;
}

- (double)upper
{
	double returnValue = (double)gtk_adjustment_get_upper((GtkAdjustment*)[self castedGObject]);

	return returnValue;
}

- (double)value
{
	double returnValue = (double)gtk_adjustment_get_value((GtkAdjustment*)[self castedGObject]);

	return returnValue;
}

- (void)setLower:(double)lower
{
	gtk_adjustment_set_lower((GtkAdjustment*)[self castedGObject], lower);
}

- (void)setPageIncrement:(double)pageIncrement
{
	gtk_adjustment_set_page_increment((GtkAdjustment*)[self castedGObject], pageIncrement);
}

- (void)setPageSize:(double)pageSize
{
	gtk_adjustment_set_page_size((GtkAdjustment*)[self castedGObject], pageSize);
}

- (void)setStepIncrement:(double)stepIncrement
{
	gtk_adjustment_set_step_increment((GtkAdjustment*)[self castedGObject], stepIncrement);
}

- (void)setUpper:(double)upper
{
	gtk_adjustment_set_upper((GtkAdjustment*)[self castedGObject], upper);
}

- (void)setValue:(double)value
{
	gtk_adjustment_set_value((GtkAdjustment*)[self castedGObject], value);
}


@end