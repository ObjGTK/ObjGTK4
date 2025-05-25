/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKInscription.h"

@implementation OGTKInscription

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_INSCRIPTION;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_INSCRIPTION);
	return gObjectClass;
}

+ (instancetype)inscriptionWithText:(OFString*)text
{
	GtkInscription* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_inscription_new([text UTF8String]), GTK_TYPE_INSCRIPTION, GtkInscription);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKInscription* wrapperObject;
	@try {
		wrapperObject = [[OGTKInscription alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkInscription*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_INSCRIPTION, GtkInscription);
}

- (PangoAttrList*)attributes
{
	PangoAttrList* returnValue = (PangoAttrList*)gtk_inscription_get_attributes((GtkInscription*)[self castedGObject]);

	return returnValue;
}

- (guint)minChars
{
	guint returnValue = (guint)gtk_inscription_get_min_chars((GtkInscription*)[self castedGObject]);

	return returnValue;
}

- (guint)minLines
{
	guint returnValue = (guint)gtk_inscription_get_min_lines((GtkInscription*)[self castedGObject]);

	return returnValue;
}

- (guint)natChars
{
	guint returnValue = (guint)gtk_inscription_get_nat_chars((GtkInscription*)[self castedGObject]);

	return returnValue;
}

- (guint)natLines
{
	guint returnValue = (guint)gtk_inscription_get_nat_lines((GtkInscription*)[self castedGObject]);

	return returnValue;
}

- (OFString*)text
{
	const char* gobjectValue = gtk_inscription_get_text((GtkInscription*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkInscriptionOverflow)textOverflow
{
	GtkInscriptionOverflow returnValue = (GtkInscriptionOverflow)gtk_inscription_get_text_overflow((GtkInscription*)[self castedGObject]);

	return returnValue;
}

- (PangoWrapMode)wrapMode
{
	PangoWrapMode returnValue = (PangoWrapMode)gtk_inscription_get_wrap_mode((GtkInscription*)[self castedGObject]);

	return returnValue;
}

- (float)xalign
{
	float returnValue = (float)gtk_inscription_get_xalign((GtkInscription*)[self castedGObject]);

	return returnValue;
}

- (float)yalign
{
	float returnValue = (float)gtk_inscription_get_yalign((GtkInscription*)[self castedGObject]);

	return returnValue;
}

- (void)setAttributesWithAttrs:(PangoAttrList*)attrs
{
	gtk_inscription_set_attributes((GtkInscription*)[self castedGObject], attrs);
}

- (void)setMarkup:(OFString*)markup
{
	gtk_inscription_set_markup((GtkInscription*)[self castedGObject], [markup UTF8String]);
}

- (void)setMinChars:(guint)minChars
{
	gtk_inscription_set_min_chars((GtkInscription*)[self castedGObject], minChars);
}

- (void)setMinLines:(guint)minLines
{
	gtk_inscription_set_min_lines((GtkInscription*)[self castedGObject], minLines);
}

- (void)setNatChars:(guint)natChars
{
	gtk_inscription_set_nat_chars((GtkInscription*)[self castedGObject], natChars);
}

- (void)setNatLines:(guint)natLines
{
	gtk_inscription_set_nat_lines((GtkInscription*)[self castedGObject], natLines);
}

- (void)setText:(OFString*)text
{
	gtk_inscription_set_text((GtkInscription*)[self castedGObject], [text UTF8String]);
}

- (void)setTextOverflow:(GtkInscriptionOverflow)overflow
{
	gtk_inscription_set_text_overflow((GtkInscription*)[self castedGObject], overflow);
}

- (void)setWrapMode:(PangoWrapMode)wrapMode
{
	gtk_inscription_set_wrap_mode((GtkInscription*)[self castedGObject], wrapMode);
}

- (void)setXalign:(float)xalign
{
	gtk_inscription_set_xalign((GtkInscription*)[self castedGObject], xalign);
}

- (void)setYalign:(float)yalign
{
	gtk_inscription_set_yalign((GtkInscription*)[self castedGObject], yalign);
}


@end