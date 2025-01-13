/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCellRendererText.h"

@implementation OGTKCellRendererText

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CELL_RENDERER_TEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)cellRendererText
{
	GtkCellRendererText* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_cell_renderer_text_new(), GtkCellRendererText, GtkCellRendererText);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKCellRendererText* wrapperObject;
	@try {
		wrapperObject = [[OGTKCellRendererText alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCellRendererText*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkCellRendererText, GtkCellRendererText);
}

- (void)setFixedHeightFromFontWithNumberOfRows:(int)numberOfRows
{
	gtk_cell_renderer_text_set_fixed_height_from_font([self castedGObject], numberOfRows);
}


@end