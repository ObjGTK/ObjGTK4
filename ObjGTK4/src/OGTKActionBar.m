/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKActionBar.h"

@implementation OGTKActionBar

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ACTION_BAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)actionBar
{
	GtkActionBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_action_bar_new(), GtkActionBar, GtkActionBar);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKActionBar* wrapperObject;
	@try {
		wrapperObject = [[OGTKActionBar alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkActionBar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkActionBar, GtkActionBar);
}

- (OGTKWidget*)centerWidget
{
	GtkWidget* gobjectValue = gtk_action_bar_get_center_widget([self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)revealed
{
	bool returnValue = (bool)gtk_action_bar_get_revealed([self castedGObject]);

	return returnValue;
}

- (void)packEnd:(OGTKWidget*)child
{
	gtk_action_bar_pack_end([self castedGObject], [child castedGObject]);
}

- (void)packStart:(OGTKWidget*)child
{
	gtk_action_bar_pack_start([self castedGObject], [child castedGObject]);
}

- (void)remove:(OGTKWidget*)child
{
	gtk_action_bar_remove([self castedGObject], [child castedGObject]);
}

- (void)setCenterWidget:(OGTKWidget*)centerWidget
{
	gtk_action_bar_set_center_widget([self castedGObject], [centerWidget castedGObject]);
}

- (void)setRevealed:(bool)revealed
{
	gtk_action_bar_set_revealed([self castedGObject], revealed);
}


@end