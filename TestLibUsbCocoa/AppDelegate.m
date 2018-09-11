//
//  AppDelegate.m
//  TestLibUsbCocoa
//
//  Created by Michael Edgcumbe on 9/10/18.
//  Copyright © 2018 Michael Edgcumbe. All rights reserved.
//

#import "AppDelegate.h"
#include <stdio.h>
#include <libusb-1.0/libusb.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (int)listUSB {
    struct libusb_device **devs;
    struct libusb_device_descriptor info;
    unsigned count,i;
    
    int rv=0;
    // init USB lib (this is the 1.0 lib)
    if (libusb_init(NULL)<0)
    {
        printf("Can't open libusb\n");
        return 1;
    }
    // get list of devices and counts
    count=libusb_get_device_list(NULL,&devs);
    if (count<=0)
    {
        printf("Error enumerating devices\n");
        return 2;
    }
    // walk the list, read descriptors, and dump some output from each
    for (i=0;i<count;i++)
    {
        libusb_get_device_descriptor(devs[i],&info);
        printf("VID=%04x PID=%04x\n",info.idVendor,info.idProduct);
    }
    
    libusb_free_device_list(devs,1);
    libusb_exit(NULL);
    return rv;
}

@end
