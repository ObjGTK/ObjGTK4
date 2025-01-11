/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKConstraintGuide.h"

@implementation OGTKConstraintGuide

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CONSTRAINT_GUIDE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)constraintGuide
{
	GtkConstraintGuide* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_constraint_guide_new(), GtkConstraintGuide, GtkConstraintGuide);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKConstraintGuide* wrapperObject;
	@try {
		wrapperObject = [[OGTKConstraintGuide alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkConstraintGuide*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkConstraintGuide, GtkConstraintGuide);
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
	GtkConstraintStrength returnValue = (GtkConstraintStrength)gtk_constraint_guide_get_strength([self castedGObject]);

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