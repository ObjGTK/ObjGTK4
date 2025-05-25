/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKActionBar.h"

@implementation OGTKActionBar

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_ACTION_BAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_ACTION_BAR);
	return gObjectClass;
}

+ (instancetype)actionBar
{
	GtkActionBar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_action_bar_new(), GTK_TYPE_ACTION_BAR, GtkActionBar);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_ACTION_BAR, GtkActionBar);
}

- (OGTKWidget*)centerWidget
{
	GtkWidget* gobjectValue = gtk_action_bar_get_center_widget((GtkActionBar*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (bool)revealed
{
	bool returnValue = (bool)gtk_action_bar_get_revealed((GtkActionBar*)[self castedGObject]);

	return returnValue;
}

- (void)packEndWithChild:(OGTKWidget*)child
{
	gtk_action_bar_pack_end((GtkActionBar*)[self castedGObject], [child castedGObject]);
}

- (void)packStartWithChild:(OGTKWidget*)child
{
	gtk_action_bar_pack_start((GtkActionBar*)[self castedGObject], [child castedGObject]);
}

- (void)removeWithChild:(OGTKWidget*)child
{
	gtk_action_bar_remove((GtkActionBar*)[self castedGObject], [child castedGObject]);
}

- (void)setCenterWidget:(OGTKWidget*)centerWidget
{
	gtk_action_bar_set_center_widget((GtkActionBar*)[self castedGObject], [centerWidget castedGObject]);
}

- (void)setRevealed:(bool)revealed
{
	gtk_action_bar_set_revealed((GtkActionBar*)[self castedGObject], revealed);
}


@end