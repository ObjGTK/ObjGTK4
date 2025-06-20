/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStackSidebar.h"

#import "OGTKStack.h"

@implementation OGTKStackSidebar

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STACK_SIDEBAR;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_STACK_SIDEBAR);
	return gObjectClass;
}

+ (instancetype)stackSidebar
{
	GtkStackSidebar* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_stack_sidebar_new(), GTK_TYPE_STACK_SIDEBAR, GtkStackSidebar);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKStackSidebar* wrapperObject;
	@try {
		wrapperObject = [[OGTKStackSidebar alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkStackSidebar*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_STACK_SIDEBAR, GtkStackSidebar);
}

- (OGTKStack*)stack
{
	GtkStack* gobjectValue = gtk_stack_sidebar_get_stack((GtkStackSidebar*)[self castedGObject]);

	OGTKStack* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setStack:(OGTKStack*)stack
{
	gtk_stack_sidebar_set_stack((GtkStackSidebar*)[self castedGObject], [stack castedGObject]);
}


@end