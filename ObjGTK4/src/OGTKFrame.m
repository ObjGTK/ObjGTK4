/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFrame.h"

@implementation OGTKFrame

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_FRAME;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_FRAME);
	return gObjectClass;
}

+ (instancetype)frameWithLabel:(OFString*)label
{
	GtkFrame* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_frame_new([label UTF8String]), GTK_TYPE_FRAME, GtkFrame);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKFrame* wrapperObject;
	@try {
		wrapperObject = [[OGTKFrame alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkFrame*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_FRAME, GtkFrame);
}

- (OGTKWidget*)child
{
	GtkWidget* gobjectValue = gtk_frame_get_child((GtkFrame*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (OFString*)label
{
	const char* gobjectValue = gtk_frame_get_label((GtkFrame*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (float)labelAlign
{
	float returnValue = (float)gtk_frame_get_label_align((GtkFrame*)[self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)labelWidget
{
	GtkWidget* gobjectValue = gtk_frame_get_label_widget((GtkFrame*)[self castedGObject]);

	OGTKWidget* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	return returnValue;
}

- (void)setChild:(OGTKWidget*)child
{
	gtk_frame_set_child((GtkFrame*)[self castedGObject], [child castedGObject]);
}

- (void)setLabel:(OFString*)label
{
	gtk_frame_set_label((GtkFrame*)[self castedGObject], [label UTF8String]);
}

- (void)setLabelAlignWithXalign:(float)xalign
{
	gtk_frame_set_label_align((GtkFrame*)[self castedGObject], xalign);
}

- (void)setLabelWidget:(OGTKWidget*)labelWidget
{
	gtk_frame_set_label_widget((GtkFrame*)[self castedGObject], [labelWidget castedGObject]);
}


@end