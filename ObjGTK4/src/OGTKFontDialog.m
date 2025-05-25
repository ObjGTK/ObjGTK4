/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFontDialog.h"

#import <OGio/OGCancellable.h>
#import "OGTKFilter.h"
#import "OGTKWindow.h"
#import <OGPango/OGPangoFontFace.h>
#import <OGPango/OGPangoFontFamily.h>
#import <OGPango/OGPangoFontMap.h>

@implementation OGTKFontDialog

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FONT_DIALOG;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_FONT_DIALOG);
	return gObjectClass;
}

+ (instancetype)fontDialog
{
	GtkFontDialog* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_font_dialog_new(), GTK_TYPE_FONT_DIALOG, GtkFontDialog);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKFontDialog* wrapperObject;
	@try {
		wrapperObject = [[OGTKFontDialog alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFontDialog*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_FONT_DIALOG, GtkFontDialog);
}

- (void)chooseFaceWithParent:(OGTKWindow*)parent initialValue:(OGPangoFontFace*)initialValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_font_dialog_choose_face((GtkFontDialog*)[self castedGObject], [parent castedGObject], [initialValue castedGObject], [cancellable castedGObject], callback, userData);
}

- (OGPangoFontFace*)chooseFaceFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	PangoFontFace* gobjectValue = gtk_font_dialog_choose_face_finish((GtkFontDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGPangoFontFace* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)chooseFamilyWithParent:(OGTKWindow*)parent initialValue:(OGPangoFontFamily*)initialValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_font_dialog_choose_family((GtkFontDialog*)[self castedGObject], [parent castedGObject], [initialValue castedGObject], [cancellable castedGObject], callback, userData);
}

- (OGPangoFontFamily*)chooseFamilyFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	PangoFontFamily* gobjectValue = gtk_font_dialog_choose_family_finish((GtkFontDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err unrefGObject:gobjectValue];

	OGPangoFontFamily* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (void)chooseFontWithParent:(OGTKWindow*)parent initialValue:(PangoFontDescription*)initialValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_font_dialog_choose_font((GtkFontDialog*)[self castedGObject], [parent castedGObject], initialValue, [cancellable castedGObject], callback, userData);
}

- (void)chooseFontAndFeaturesWithParent:(OGTKWindow*)parent initialValue:(PangoFontDescription*)initialValue cancellable:(OGCancellable*)cancellable callback:(GAsyncReadyCallback)callback userData:(gpointer)userData
{
	gtk_font_dialog_choose_font_and_features((GtkFontDialog*)[self castedGObject], [parent castedGObject], initialValue, [cancellable castedGObject], callback, userData);
}

- (bool)chooseFontAndFeaturesFinishWithResult:(GAsyncResult*)result fontDesc:(PangoFontDescription**)fontDesc fontFeatures:(char**)fontFeatures language:(PangoLanguage**)language
{
	GError* err = NULL;

	bool returnValue = (bool)gtk_font_dialog_choose_font_and_features_finish((GtkFontDialog*)[self castedGObject], result, fontDesc, fontFeatures, language, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (PangoFontDescription*)chooseFontFinishWithResult:(GAsyncResult*)result
{
	GError* err = NULL;

	PangoFontDescription* returnValue = (PangoFontDescription*)gtk_font_dialog_choose_font_finish((GtkFontDialog*)[self castedGObject], result, &err);

	[OGErrorException throwForError:err];

	return returnValue;
}

- (OGTKFilter*)filter
{
	GtkFilter* gobjectValue = gtk_font_dialog_get_filter((GtkFontDialog*)[self castedGObject]);

	OGTKFilter* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OGPangoFontMap*)fontMap
{
	PangoFontMap* gobjectValue = gtk_font_dialog_get_font_map((GtkFontDialog*)[self castedGObject]);

	OGPangoFontMap* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (PangoLanguage*)language
{
	PangoLanguage* returnValue = (PangoLanguage*)gtk_font_dialog_get_language((GtkFontDialog*)[self castedGObject]);

	return returnValue;
}

- (bool)modal
{
	bool returnValue = (bool)gtk_font_dialog_get_modal((GtkFontDialog*)[self castedGObject]);

	return returnValue;
}

- (OFString*)title
{
	const char* gobjectValue = gtk_font_dialog_get_title((GtkFontDialog*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setFilter:(OGTKFilter*)filter
{
	gtk_font_dialog_set_filter((GtkFontDialog*)[self castedGObject], [filter castedGObject]);
}

- (void)setFontMap:(OGPangoFontMap*)fontmap
{
	gtk_font_dialog_set_font_map((GtkFontDialog*)[self castedGObject], [fontmap castedGObject]);
}

- (void)setLanguage:(PangoLanguage*)language
{
	gtk_font_dialog_set_language((GtkFontDialog*)[self castedGObject], language);
}

- (void)setModal:(bool)modal
{
	gtk_font_dialog_set_modal((GtkFontDialog*)[self castedGObject], modal);
}

- (void)setTitle:(OFString*)title
{
	gtk_font_dialog_set_title((GtkFontDialog*)[self castedGObject], [title UTF8String]);
}


@end