/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2025 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGPangoCoverage.h"

@implementation OGPangoCoverage

+ (void)load
{
	GType gtypeToAssociate = pango_coverage_get_type();

	if (gtypeToAssociate == 0)
		return;

	g_type_set_qdata(gtypeToAssociate, [super wrapperQuark], [self class]);
}

+ (OGPangoCoverage*)fromBytes:(guchar*)bytes nbytes:(int)nbytes
{
	PangoCoverage* gobjectValue = pango_coverage_from_bytes(bytes, nbytes);

	OGPangoCoverage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

+ (instancetype)coverage
{
	PangoCoverage* gobjectValue = G_TYPE_CHECK_INSTANCE_CAST(pango_coverage_new(), PangoCoverage, PangoCoverage);

	if OF_UNLIKELY(!gobjectValue)
		@throw [OGObjectGObjectToWrapCreationFailedException exception];

	OGPangoCoverage* wrapperObject;
	@try {
		wrapperObject = [[OGPangoCoverage alloc] initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[wrapperObject release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return [wrapperObject autorelease];
}

- (PangoCoverage*)castedGObject
{
	return G_TYPE_CHECK_INSTANCE_CAST([self gObject], PangoCoverage, PangoCoverage);
}

- (OGPangoCoverage*)copy
{
	PangoCoverage* gobjectValue = pango_coverage_copy([self castedGObject]);

	OGPangoCoverage* returnValue = OGWrapperClassAndObjectForGObject(gobjectValue);
	g_object_unref(gobjectValue);

	return returnValue;
}

- (PangoCoverageLevel)getWithIndex:(int)index
{
	PangoCoverageLevel returnValue = (PangoCoverageLevel)pango_coverage_get([self castedGObject], index);

	return returnValue;
}

- (void)maxWithOther:(OGPangoCoverage*)other
{
	pango_coverage_max([self castedGObject], [other castedGObject]);
}

- (void)setWithIndex:(int)index level:(PangoCoverageLevel)level
{
	pango_coverage_set([self castedGObject], index, level);
}

- (void)toBytes:(guchar**)bytes nbytes:(int*)nbytes
{
	pango_coverage_to_bytes([self castedGObject], bytes, nbytes);
}


@end