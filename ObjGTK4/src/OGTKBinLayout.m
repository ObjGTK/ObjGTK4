/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKBinLayout.h"

@implementation OGTKBinLayout

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_BIN_LAYOUT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)binLayout
{
	GtkBinLayout* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_bin_layout_new(), GtkBinLayout, GtkBinLayout);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKBinLayout* wrapperObject;
	@try {
		wrapperObject = [[OGTKBinLayout alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkBinLayout*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkBinLayout, GtkBinLayout);
}


@end