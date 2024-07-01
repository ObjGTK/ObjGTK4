/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKConstraintGuide.h"

@implementation OGTKConstraintGuide

- (instancetype)init
{
	GtkConstraintGuide* gobjectValue = GTK_CONSTRAINT_GUIDE(gtk_constraint_guide_new());

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

- (GtkConstraintGuide*)castedGObject
{
	return GTK_CONSTRAINT_GUIDE([self gObject]);
}

- (void)maxSizeWithWidth:(int*)width height:(int*)height
{
	gtk_constraint_guide_get_max_size([self castedGObject], width, height);
}

- (void)minSizeWithWidth:(int*)width height:(int*)height
{
	gtk_constraint_guide_get_min_size([self castedGObject], width, height);
}

- (OFString*)name
{
	const char* gobjectValue = gtk_constraint_guide_get_name([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)natSizeWithWidth:(int*)width height:(int*)height
{
	gtk_constraint_guide_get_nat_size([self castedGObject], width, height);
}

- (GtkConstraintStrength)strength
{
	GtkConstraintStrength returnValue = gtk_constraint_guide_get_strength([self castedGObject]);

	return returnValue;
}

- (void)setMaxSizeWithWidth:(int)width height:(int)height
{
	gtk_constraint_guide_set_max_size([self castedGObject], width, height);
}

- (void)setMinSizeWithWidth:(int)width height:(int)height
{
	gtk_constraint_guide_set_min_size([self castedGObject], width, height);
}

- (void)setName:(OFString*)name
{
	gtk_constraint_guide_set_name([self castedGObject], [name UTF8String]);
}

- (void)setNatSizeWithWidth:(int)width height:(int)height
{
	gtk_constraint_guide_set_nat_size([self castedGObject], width, height);
}

- (void)setStrength:(GtkConstraintStrength)strength
{
	gtk_constraint_guide_set_strength([self castedGObject], strength);
}


@end