/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKWindowHandle.h"

@implementation OGTKWindowHandle

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_WINDOW_HANDLE;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_WINDOW_HANDLE);
	return gObjectClass;
}

+ (instancetype)windowHandle
{
	GtkWindowHandle* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_window_handle_new(), GTK_TYPE_WINDOW_HANDLE, GtkWindowHandle);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKWindowHandle* wrapperObject;
	@try {
		wrapperObject = [[OGTKWindowHandle alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkWindowHandle*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_WINDOW_HANDLE, GtkWindowHandle);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_window_handle_get_child((GtkWindowHandle*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_window_handle_set_child((GtkWindowHandle*)[self castedGObject], [child castedGObject]);
}


@end