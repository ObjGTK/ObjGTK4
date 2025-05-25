/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKIMMulticontext.h"

@implementation OGTKIMMulticontext

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_IM_MULTICONTEXT;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_IM_MULTICONTEXT);
	return gObjectClass;
}

+ (instancetype)iMMulticontext
{
	GtkIMMulticontext* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_im_multicontext_new(), GTK_TYPE_IM_MULTICONTEXT, GtkIMMulticontext);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGTKIMMulticontext* wrapperObject;
	@try {
		wrapperObject = [[OGTKIMMulticontext alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkIMMulticontext*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_IM_MULTICONTEXT, GtkIMMulticontext);
}

- (OFString*)contextId
{
	const char* gobjectValue = gtk_im_multicontext_get_context_id((GtkIMMulticontext*)[self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setContextId:(OFString*)contextId
{
	gtk_im_multicontext_set_context_id((GtkIMMulticontext*)[self castedGObject], [contextId UTF8String]);
}


@end