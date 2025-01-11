/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKATContext.h"

#import <OGdk4/OGdkDisplay.h>

@implementation OGTKATContext

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_AT_CONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (instancetype)aTContextCreateWithAccessibleRole:(GtkAccessibleRole)accessibleRole accessible:(GtkAccessible*)accessible display:(OGdkDisplay*)display
{
	GtkATContext* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_at_context_create(accessibleRole, accessible, [display castedGObject]), GtkATContext, GtkATContext);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKATContext* wrapperObject;
	@try {
		wrapperObject = [[OGTKATContext alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkATContext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkATContext, GtkATContext);
}

- (GtkAccessible*)accessible
{
	GtkAccessible* returnValue = (GtkAccessible*)gtk_at_context_get_accessible([self castedGObject]);

	return returnValue;
}

- (GtkAccessibleRole)accessibleRole
{
	GtkAccessibleRole returnValue = (GtkAccessibleRole)gtk_at_context_get_accessible_role([self castedGObject]);

	return returnValue;
}


@end