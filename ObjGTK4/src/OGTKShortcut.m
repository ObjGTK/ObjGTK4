/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcut.h"

#import "OGTKShortcutAction.h"
#import "OGTKShortcutTrigger.h"

@implementation OGTKShortcut

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SHORTCUT);
	return gObjectClass;
}

+ (instancetype)shortcutWithTrigger:(OGTKShortcutTrigger*)trigger action:(OGTKShortcutAction*)action
{
	GtkShortcut* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_shortcut_new([trigger castedGObject], [action castedGObject]), GTK_TYPE_SHORTCUT, GtkShortcut);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKShortcut* wrapperObject;
	@try {
		wrapperObject = [[OGTKShortcut alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkShortcut*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SHORTCUT, GtkShortcut);
}

- (OGTKShortcutAction*)action
{
	GtkShortcutAction* gobjectValue = gtk_shortcut_get_action((GtkShortcut*)[self castedGObject]);

	OGTKShortcutAction* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GVariant*)arguments
{
	GVariant* returnValue = (GVariant*)gtk_shortcut_get_arguments((GtkShortcut*)[self castedGObject]);

	return returnValue;
}

- (OGTKShortcutTrigger*)trigger
{
	GtkShortcutTrigger* gobjectValue = gtk_shortcut_get_trigger((GtkShortcut*)[self castedGObject]);

	OGTKShortcutTrigger* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setAction:(OGTKShortcutAction*)action
{
	gtk_shortcut_set_action((GtkShortcut*)[self castedGObject], [action castedGObject]);
}

- (void)setArgumentsWithArgs:(GVariant*)args
{
	gtk_shortcut_set_arguments((GtkShortcut*)[self castedGObject], args);
}

- (void)setTrigger:(OGTKShortcutTrigger*)trigger
{
	gtk_shortcut_set_trigger((GtkShortcut*)[self castedGObject], [trigger castedGObject]);
}


@end