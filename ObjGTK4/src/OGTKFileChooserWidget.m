/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFileChooserWidget.h"

@implementation OGTKFileChooserWidget

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FILE_CHOOSER_WIDGET;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithAction:(GtkFileChooserAction)action
{
	GtkFileChooserWidget* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_file_chooser_widget_new(action), GtkFileChooserWidget, GtkFileChooserWidget);

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

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

- (GtkFileChooserWidget*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkFileChooserWidget, GtkFileChooserWidget);
}


@end