/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellAreaBox.h"

#import "OGTKCellRenderer.h"

@implementation OGTKCellAreaBox

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CELL_AREA_BOX;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)cellAreaBox
{
	GtkCellAreaBox* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_cell_area_box_new(), GtkCellAreaBox, GtkCellAreaBox);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCellAreaBox* wrapperObject;
	@try {
		wrapperObject = [[OGTKCellAreaBox alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCellAreaBox*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkCellAreaBox, GtkCellAreaBox);
}

- (int)spacing
{
	int returnValue = (int)gtk_cell_area_box_get_spacing([self castedGObject]);

	return returnValue;
}

- (void)packEndWithRenderer:(OGTKCellRenderer*)renderer expand:(bool)expand align:(bool)align fixed:(bool)fixed
{
	gtk_cell_area_box_pack_end([self castedGObject], [renderer castedGObject], expand, align, fixed);
}

- (void)packStartWithRenderer:(OGTKCellRenderer*)renderer expand:(bool)expand align:(bool)align fixed:(bool)fixed
{
	gtk_cell_area_box_pack_start([self castedGObject], [renderer castedGObject], expand, align, fixed);
}

- (void)setSpacing:(int)spacing
{
	gtk_cell_area_box_set_spacing([self castedGObject], spacing);
}


@end