/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFontDialog.h"

#import "OGTKWindow.h"
#import "OGTKFilter.h"
#import <OGPango/OGPangoFontFace.h>
#import <OGPango/OGPangoFontMap.h>
#import <OGPango/OGPangoFontFamily.h>
#import <OGio/OGCancellable.h>

@implementation OGTKFontDialog

- (instancetype)init
{
	GtkFontDialog* gobjectValue = GTK_FONT_DIALOG(gtk_font_dialog_new());

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

- (GtkFontDialog*)castedGObject
{
	return GTK_FONT_DIALOG([self gObject]);
}

- (void)chooseFaceWithParent:(OGTKWindow*)parent initialValue:(OGPangoFontFace*)initialValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_font_dialog_choose_face([self castedGObject], [parent castedGObject], [initialValue castedGObject], [cancellable castedGObject], callback, userData);
}

- (OGPangoFontFace*)chooseFaceFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	PangoFontFace* gobjectValue = PANGO_FONT_FACE(gtk_font_dialog_choose_face_finish([self castedGObject], result, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGPangoFontFace* returnValue = [OGPangoFontFace withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)chooseFamilyWithParent:(OGTKWindow*)parent initialValue:(OGPangoFontFamily*)initialValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_font_dialog_choose_family([self castedGObject], [parent castedGObject], [initialValue castedGObject], [cancellable castedGObject], callback, userData);
}

- (OGPangoFontFamily*)chooseFamilyFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	PangoFontFamily* gobjectValue = PANGO_FONT_FAMILY(gtk_font_dialog_choose_family_finish([self castedGObject], result, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

	OGPangoFontFamily* returnValue = [OGPangoFontFamily withGObject:gobjectValue];
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)chooseFontWithParent:(OGTKWindow*)parent initialValue:(PangoFontDescription*)initialValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_font_dialog_choose_font([self castedGObject], [parent castedGObject], initialValue, [cancellable castedGObject], callback, userData);
}

- (void)chooseFontAndFeaturesWithParent:(OGTKWindow*)parent initialValue:(PangoFontDescription*)initialValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_font_dialog_choose_font_and_features([self castedGObject], [parent castedGObject], initialValue, [cancellable castedGObject], callback, userData);
}

- (bool)chooseFontAndFeaturesFinishWithResult:(GAsyncResult*)result fontDesc:(PangoFontDescription**)fontDesc fontFeatures:(char**)fontFeatures language:(PangoLanguage**)language
{
	GError* err = NULL;

	bool returnValue = gtk_font_dialog_choose_font_and_features_finish([self castedGObject], result, fontDesc, fontFeatures, language, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (PangoFontDescription*)chooseFontFinish:(GAsyncResult*)result
{
	GError* err = NULL;

	PangoFontDescription* returnValue = gtk_font_dialog_choose_font_finish([self castedGObject], result, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OGTKFilter*)filter
{
	GtkFilter* gobjectValue = GTK_FILTER(gtk_font_dialog_get_filter([self castedGObject]));

	OGTKFilter* returnValue = [OGTKFilter withGObject:gobjectValue];
	return returnValue;
}

- (OGPangoFontMap*)fontMap
{
	PangoFontMap* gobjectValue = PANGO_FONT_MAP(gtk_font_dialog_get_font_map([self castedGObject]));

	OGPangoFontMap* returnValue = [OGPangoFontMap withGObject:gobjectValue];
	return returnValue;
}

- (PangoLanguage*)language
{
	PangoLanguage* returnValue = gtk_font_dialog_get_language([self castedGObject]);

	return returnValue;
}

- (bool)modal
{
	bool returnValue = gtk_font_dialog_get_modal([self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_font_dialog_get_title([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setFilter:(OGTKFilter*)filter
{
	gtk_font_dialog_set_filter([self castedGObject], [filter castedGObject]);
}

- (void)setFontMap:(OGPangoFontMap*)fontmap
{
	gtk_font_dialog_set_font_map([self castedGObject], [fontmap castedGObject]);
}

- (void)setLanguage:(PangoLanguage*)language
{
	gtk_font_dialog_set_language([self castedGObject], language);
}

- (void)setModal:(bool)modal
{
	gtk_font_dialog_set_modal([self castedGObject], modal);
}

- (void)setTitle:(OFString*)title
{
	gtk_font_dialog_set_title([self castedGObject], [title UTF8String]);
}


@end