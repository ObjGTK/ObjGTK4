/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKEditableLabel.h"

@implementation OGTKEditableLabel

static GTypeClass *gObjectClass = NULL;

+ (void)load
{
	GType gtypeToAssociate = GTK_TYPE_EDITABLE_LABEL;

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (GTypeClass*)gObjectClass
{
	if(gObjectClass != NULL)
		return gObjectClass;

	gObjectClass = g_type_class_ref(GTK_TYPE_EDITABLE_LABEL);
	return gObjectClass;
}

+ (instancetype)editableLabelWithStr:(OFString*)str
{
	GtkEditableLabel* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(gtk_editable_label_new([str UTF8String]), GTK_TYPE_EDITABLE_LABEL, GtkEditableLabel);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	// Class is derived from GInitiallyUnowned, so this reference is floating. Own it:
	g_object_ref_sink(gobjectValue);

	OGTKEditableLabel* wrapperObject;
	@try {
		wrapperObject = [[OGTKEditableLabel alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (GtkEditableLabel*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], GTK_TYPE_EDITABLE_LABEL, GtkEditableLabel);
}

- (bool)editing
{
	bool returnValue = (bool)gtk_editable_label_get_editing((GtkEditableLabel*)[self castedGObject]);

	return returnValue;
}

- (void)startEditing
{
	gtk_editable_label_start_editing((GtkEditableLabel*)[self castedGObject]);
}

- (void)stopEditingWithCommit:(bool)commit
{
	gtk_editable_label_stop_editing((GtkEditableLabel*)[self castedGObject], commit);
}


@end