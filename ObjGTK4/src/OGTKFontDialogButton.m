/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFontDialogButton.h"

#import "OGTKFontDialog.h"

@implementation OGTKFontDialogButton

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FONT_DIALOG_BUTTON;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_FONT_DIALOG_BUTTON);
	return gObjectClass;
}

+ (instancetype)fontDialogButtonWithDialog:(OGTKFontDialog*)dialog
{
	GtkFontDialogButton* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_font_dialog_button_new([dialog castedGObject]), GTK_TYPE_FONT_DIALOG_BUTTON, GtkFontDialogButton);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKFontDialogButton* wrapperObject;
	@try {
		wrapperObject = [[OGTKFontDialogButton alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFontDialogButton*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_FONT_DIALOG_BUTTON, GtkFontDialogButton);
}

- (OGTKFontDialog*)dialog
{
	GtkFontDialog* gobjectValue = gtk_font_dialog_button_get_dialog((GtkFontDialogButton*)[self castedGObject]);

	OGTKFontDialog* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (PangoFontDescription*)fontDesc
{
	PangoFontDescription* returnValue = (PangoFontDescription*)gtk_font_dialog_button_get_font_desc((GtkFontDialogButton*)[self castedGObject]);

	return returnValue;
}

- (OFString*)fontFeatures
{
	const char* gobjectValue = gtk_font_dialog_button_get_font_features((GtkFontDialogButton*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (PangoLanguage*)language
{
	PangoLanguage* returnValue = (PangoLanguage*)gtk_font_dialog_button_get_language((GtkFontDialogButton*)[self castedGObject]);

	return returnValue;
}

- (GtkFontLevel)level
{
	GtkFontLevel returnValue = (GtkFontLevel)gtk_font_dialog_button_get_level((GtkFontDialogButton*)[self castedGObject]);

	return returnValue;
}

- (bool)useFont
{
	bool returnValue = (bool)gtk_font_dialog_button_get_use_font((GtkFontDialogButton*)[self castedGObject]);

	return returnValue;
}

- (bool)useSize
{
	bool returnValue = (bool)gtk_font_dialog_button_get_use_size((GtkFontDialogButton*)[self castedGObject]);

	return returnValue;
}

- (void)setDialog:(OGTKFontDialog*)dialog
{
	gtk_font_dialog_button_set_dialog((GtkFontDialogButton*)[self castedGObject], [dialog castedGObject]);
}

- (void)setFontDesc:(const PangoFontDescription*)fontDesc
{
	gtk_font_dialog_button_set_font_desc((GtkFontDialogButton*)[self castedGObject], fontDesc);
}

- (void)setFontFeatures:(OFString*)fontFeatures
{
	gtk_font_dialog_button_set_font_features((GtkFontDialogButton*)[self castedGObject], [fontFeatures UTF8String]);
}

- (void)setLanguage:(PangoLanguage*)language
{
	gtk_font_dialog_button_set_language((GtkFontDialogButton*)[self castedGObject], language);
}

- (void)setLevel:(GtkFontLevel)level
{
	gtk_font_dialog_button_set_level((GtkFontDialogButton*)[self castedGObject], level);
}

- (void)setUseFont:(bool)useFont
{
	gtk_font_dialog_button_set_use_font((GtkFontDialogButton*)[self castedGObject], useFont);
}

- (void)setUseSize:(bool)useSize
{
	gtk_font_dialog_button_set_use_size((GtkFontDialogButton*)[self castedGObject], useSize);
}


@end