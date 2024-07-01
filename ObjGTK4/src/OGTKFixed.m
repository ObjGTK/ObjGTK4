/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFixed.h"

@implementation OGTKFixed

- (instancetype)init
{
	GtkFixed* gobjectValue = GTK_FIXED(gtk_fixed_new());

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

- (GtkFixed*)castedGObject
{
	return GTK_FIXED([self gObject]);
}

- (void)childPositionWithWidget:(OGTKWidget*)widget x:(double*)x y:(double*)y
{
	gtk_fixed_get_child_position([self castedGObject], [widget castedGObject], x, y);
}

- (GskTransform*)childTransform:(OGTKWidget*)widget
{
	GskTransform* returnValue = gtk_fixed_get_child_transform([self castedGObject], [widget castedGObject]);

	return returnValue;
}

- (void)moveWithWidget:(OGTKWidget*)widget x:(double)x y:(double)y
{
	gtk_fixed_move([self castedGObject], [widget castedGObject], x, y);
}

- (void)putWithWidget:(OGTKWidget*)widget x:(double)x y:(double)y
{
	gtk_fixed_put([self castedGObject], [widget castedGObject], x, y);
}

- (void)remove:(OGTKWidget*)widget
{
	gtk_fixed_remove([self castedGObject], [widget castedGObject]);
}

- (void)setChildTransformWithWidget:(OGTKWidget*)widget transform:(GskTransform*)transform
{
	gtk_fixed_set_child_transform([self castedGObject], [widget castedGObject], transform);
}


@end