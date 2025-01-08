/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFontChooserDialog.h"

#import "OGTKWidget.h"
#import "OGTKWindow.h"

@implementation OGTKFontChooserDialog

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FONT_CHOOSER_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

- (instancetype)initWithTitle:(OFString*)title parent:(OGTKWindow*)parent
{
	GtkFontChooserDialog* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_font_chooser_dialog_new([title UTF8String], [parent castedGObject]), GtkFontChooserDialog, GtkFontChooserDialog);

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

- (GtkFontChooserDialog*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GtkFontChooserDialog, GtkFontChooserDialog);
}


@end