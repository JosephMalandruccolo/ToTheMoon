//
//  StoryParser.m
//  ToTheMoon
//
//  Created by Joseph Malandruccolo on 4/5/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//  https://github.com/robertmryan/nsxmlparser-demonstration used as a reference for this class

#import "StoryParser.h"
#import "PageModel.h"

NSString * const xml_class_node = @"page";
NSString * const xml_file_node = @"pages";

@implementation StoryParser




//####################################################################################
// *   @abstract            create an array of PageModel objects in the pages property
// *   @description
//####################################################################################
- (id) init {
    self = [super init];
    
    if (self) {
        _pages = [[NSMutableArray alloc] init];
    }
    
    return self;
}


//####################################################################################
// *   @abstract            determine which type of node we are parsing
// *   @description         three types of nodes are recongizable by this method
// *                            - xml_file_nodes, which represent beginning and end of file
// *                            - xml_class_nodes, which represent beginnning and end of an instance
// *                            - all other nodes, which are class node properties
//####################################################################################
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    
        
    if ([elementName isEqualToString:xml_file_node]) {
        return;
    }
    else if ([elementName isEqualToString:xml_class_node]) {
        self.page  = [[PageModel alloc] init];
    }
    else {
        self.currentElementValue = [[NSMutableString alloc] init];
    }
}


//####################################################################################
// *   @abstract            append the newfound characters to the currentElementValue
// *   @description
//####################################################################################
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (self.currentElementValue) {
        
        // append value to the ad hoc string
        NSLog(@"StoryParser - foundCharacters");
        [self.currentElementValue appendString:string];
    }
}


//####################################################################################
// *   @abstract            
// *   @description
//####################################################################################
- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    
    if ([elementName isEqualToString:xml_file_node]) {
        // We reached the end of the XML document
        return;
    }
    
    if ([elementName isEqualToString:xml_class_node]) {
        
        // We are done with page entry – add the parsed page
        // object to our pages array
        NSLog(@"Add a page to the pages array");
        [self.pages addObject:self.page];
        // release page object
        self.page = nil;
        
    } else {
        
        // The parser hit one of the element values.
        // This syntax is possible because PageModel object
        // property names match the XML user element names
        NSLog(@"Started setting value: %@ for key %@", self.currentElementValue, elementName);
        [self.page setValue:self.currentElementValue forKey:elementName];
        
    }
    
    self.currentElementValue = nil;
}


@end
