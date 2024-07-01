/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutController.h"

#import "OGTKShortcut.h"

@implementation OGTKShortcutController

- (instancetype)init
{
	GtkShortcutController* gobjectValue = GTK_SHORTCUT_CONTROLLER(gtk_shortcut_controller_new());

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (instancetype)initForModel:(GListModel*)model
{
	GtkShortcutController* gobjectValue = GTK_SHORTCUT_CONTROLLER(gtk_shortcut_controller_new_for_model(model));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GtkShortcutController*)castedGObject
{
	return GTK_SHORTCUT_CONTROLLER([self gObject]);
}

- (void)addShortcut:(OGTKShortcut*)shortcut
{
	gtk_shortcut_controller_add_shortcut([self castedGObject], [shortcut castedGObject]);
}

- (GdkModifierType)mnemonicsModifiers
{
	GdkModifierType returnValue = gtk_shortcut_controller_get_mnemonics_modifiers([self castedGObject]);

	return returnValue;
}

- (GtkShortcutScope)scope
{
	GtkShortcutScope returnValue = gtk_shortcut_controller_get_scope([self castedGObject]);

	return returnValue;
}

- (void)removeShortcut:(OGTKShortcut*)shortcut
{
	gtk_shortcut_controller_remove_shortcut([self castedGObject], [shortcut castedGObject]);
}

- (void)setMnemonicsModifiers:(GdkModifierType)modifiers
{
	gtk_shortcut_controller_set_mnemonics_modifiers([self castedGObject], modifiers);
}

- (void)setScope:(GtkShortcutScope)scope
{
	gtk_shortcut_controller_set_scope([self castedGObject], scope);
}


@end