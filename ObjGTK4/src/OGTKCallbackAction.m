/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKCallbackAction.h"

@implementation OGTKCallbackAction

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_CALLBACK_ACTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_CALLBACK_ACTION);
	return gObjectClass;
}

+ (instancetype)callbackActionWithCallback:(GtkShortcutFunc)callback data:(gpointer)data destroy:(GDestroyNotify)destroy
{
	GtkCallbackAction* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_callback_action_new(callback, data, destroy), GTK_TYPE_CALLBACK_ACTION, GtkCallbackAction);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKCallbackAction* wrapperObject;
	@try {
		wrapperObject = [[OGTKCallbackAction alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkCallbackAction*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_CALLBACK_ACTION, GtkCallbackAction);
}


@end