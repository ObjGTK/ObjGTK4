/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKStackSwitcher.h"

#import "OGTKStack.h"

@implementation OGTKStackSwitcher

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_STACK_SWITCHER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)stackSwitcher
{
	GtkStackSwitcher* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_stack_switcher_new(), GtkStackSwitcher, GtkStackSwitcher);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKStackSwitcher* wrapperObject;
	@try {
		wrapperObject = [[OGTKStackSwitcher alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkStackSwitcher*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkStackSwitcher, GtkStackSwitcher);
}

- (OGTKStack*)stack
{
	GtkStack* gobjectValue = gtk_stack_switcher_get_stack([self castedGObject]);

	OGTKStack* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setStack:(OGTKStack*)stack
{
	gtk_stack_switcher_set_stack([self castedGObject], [stack castedGObject]);
}


@end