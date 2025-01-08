/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcutController.h"

#import "OGTKShortcut.h"

@implementation OGTKShortcutController

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUT_CONTROLLER;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)init
{
	GtkShortcutController* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_shortcut_controller_new(), GtkShortcutController, GtkShortcutController);

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

- (instancetype)initWithModelForModel:(GListModel*)model
{
	GtkShortcutController* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_shortcut_controller_new_for_model(model), GtkShortcutController, GtkShortcutController);

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
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkShortcutController, GtkShortcutController);
}

- (void)addShortcut:(OGTKShortcut*)shortcut
{
	gtk_shortcut_controller_add_shortcut([self castedGObject], [shortcut castedGObject]);
}

- (GdkModifierType)mnemonicsModifiers
{
	GdkModifierType returnValue = (GdkModifierType)gtk_shortcut_controller_get_mnemonics_modifiers([self castedGObject]);

	return returnValue;
}

- (GtkShortcutScope)scope
{
	GtkShortcutScope returnValue = (GtkShortcutScope)gtk_shortcut_controller_get_scope([self castedGObject]);

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