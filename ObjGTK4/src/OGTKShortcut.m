/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKShortcut.h"

#import "OGTKShortcutAction.h"
#import "OGTKShortcutTrigger.h"

@implementation OGTKShortcut

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_SHORTCUT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithTrigger:(OGTKShortcutTrigger*)trigger action:(OGTKShortcutAction*)action
{
	GtkShortcut* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_shortcut_new([trigger castedGObject], [action castedGObject]), GtkShortcut, GtkShortcut);

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

- (GtkShortcut*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkShortcut, GtkShortcut);
}

- (OGTKShortcutAction*)action
{
	GtkShortcutAction* gobjectValue = gtk_shortcut_get_action([self castedGObject]);

	OGTKShortcutAction* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (GVariant*)arguments
{
	GVariant* returnValue = (GVariant*)gtk_shortcut_get_arguments([self castedGObject]);

	return returnValue;
}

- (OGTKShortcutTrigger*)trigger
{
	GtkShortcutTrigger* gobjectValue = gtk_shortcut_get_trigger([self castedGObject]);

	OGTKShortcutTrigger* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setAction:(OGTKShortcutAction*)action
{
	gtk_shortcut_set_action([self castedGObject], [action castedGObject]);
}

- (void)setArguments:(GVariant*)args
{
	gtk_shortcut_set_arguments([self castedGObject], args);
}

- (void)setTrigger:(OGTKShortcutTrigger*)trigger
{
	gtk_shortcut_set_trigger([self castedGObject], [trigger castedGObject]);
}


@end