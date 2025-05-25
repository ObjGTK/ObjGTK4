/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutController.h"

#import "OGTKShortcut.h"

@implementation OGTKShortcutController

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUT_CONTROLLER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_SHORTCUT_CONTROLLER);
	return gObjectClass;
}

+ (instancetype)shortcutController
{
	GtkShortcutController* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_shortcut_controller_new(), GTK_TYPE_SHORTCUT_CONTROLLER, GtkShortcutController);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKShortcutController* wrapperObject;
	@try {
		wrapperObject = [[OGTKShortcutController alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

+ (instancetype)shortcutControllerForModel:(GListModel*)model
{
	GtkShortcutController* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_shortcut_controller_new_for_model(model), GTK_TYPE_SHORTCUT_CONTROLLER, GtkShortcutController);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKShortcutController* wrapperObject;
	@try {
		wrapperObject = [[OGTKShortcutController alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkShortcutController*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_SHORTCUT_CONTROLLER, GtkShortcutController);
}

- (void)addShortcut:(OGTKShortcut*)shortcut
{
	gtk_shortcut_controller_add_shortcut((GtkShortcutController*)[self castedGObject], [shortcut castedGObject]);
}

- (GdkModifierType)mnemonicsModifiers
{
	GdkModifierType returnValue = (GdkModifierType)gtk_shortcut_controller_get_mnemonics_modifiers((GtkShortcutController*)[self castedGObject]);

	return returnValue;
}

- (GtkShortcutScope)scope
{
	GtkShortcutScope returnValue = (GtkShortcutScope)gtk_shortcut_controller_get_scope((GtkShortcutController*)[self castedGObject]);

	return returnValue;
}

- (void)removeShortcut:(OGTKShortcut*)shortcut
{
	gtk_shortcut_controller_remove_shortcut((GtkShortcutController*)[self castedGObject], [shortcut castedGObject]);
}

- (void)setMnemonicsModifiers:(GdkModifierType)modifiers
{
	gtk_shortcut_controller_set_mnemonics_modifiers((GtkShortcutController*)[self castedGObject], modifiers);
}

- (void)setScope:(GtkShortcutScope)scope
{
	gtk_shortcut_controller_set_scope((GtkShortcutController*)[self castedGObject], scope);
}


@end