/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAppChooserWidget.h"

@implementation OGTKAppChooserWidget

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_APP_CHOOSER_WIDGET;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_APP_CHOOSER_WIDGET);
	return gObjectClass;
}

+ (instancetype)appChooserWidgetWithContentType:(OFString*)contentType
{
	GtkAppChooserWidget* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_app_chooser_widget_new([contentType UTF8String]), GTK_TYPE_APP_CHOOSER_WIDGET, GtkAppChooserWidget);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKAppChooserWidget* wrapperObject;
	@try {
		wrapperObject = [[OGTKAppChooserWidget alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkAppChooserWidget*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_APP_CHOOSER_WIDGET, GtkAppChooserWidget);
}

- (OFString*)defaultText
{
	const char* gobjectValue = gtk_app_chooser_widget_get_default_text((GtkAppChooserWidget*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (bool)showAll
{
	bool returnValue = (bool)gtk_app_chooser_widget_get_show_all((GtkAppChooserWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)showDefault
{
	bool returnValue = (bool)gtk_app_chooser_widget_get_show_default((GtkAppChooserWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)showFallback
{
	bool returnValue = (bool)gtk_app_chooser_widget_get_show_fallback((GtkAppChooserWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)showOther
{
	bool returnValue = (bool)gtk_app_chooser_widget_get_show_other((GtkAppChooserWidget*)[self castedGObject]);

	return returnValue;
}

- (bool)showRecommended
{
	bool returnValue = (bool)gtk_app_chooser_widget_get_show_recommended((GtkAppChooserWidget*)[self castedGObject]);

	return returnValue;
}

- (void)setDefaultText:(OFString*)text
{
	gtk_app_chooser_widget_set_default_text((GtkAppChooserWidget*)[self castedGObject], [text UTF8String]);
}

- (void)setShowAllWithSetting:(bool)setting
{
	gtk_app_chooser_widget_set_show_all((GtkAppChooserWidget*)[self castedGObject], setting);
}

- (void)setShowDefaultWithSetting:(bool)setting
{
	gtk_app_chooser_widget_set_show_default((GtkAppChooserWidget*)[self castedGObject], setting);
}

- (void)setShowFallbackWithSetting:(bool)setting
{
	gtk_app_chooser_widget_set_show_fallback((GtkAppChooserWidget*)[self castedGObject], setting);
}

- (void)setShowOtherWithSetting:(bool)setting
{
	gtk_app_chooser_widget_set_show_other((GtkAppChooserWidget*)[self castedGObject], setting);
}

- (void)setShowRecommendedWithSetting:(bool)setting
{
	gtk_app_chooser_widget_set_show_recommended((GtkAppChooserWidget*)[self castedGObject], setting);
}


@end