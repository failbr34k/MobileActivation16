# MobileActivation16
Basic logos logger with Security framework hooks for iOS 16.x MobileActivation.

TO DO:  Set all origial type casts.
        Add logging for all parameters.
        Add additional framework images for comprehensive logging.
       
Notes:  There are new protocols and some of the Daemon class functions have changed.
        There is now a foundation class symbol for coretelephony: @interface MATelephonyInfo.

        Using iPhoneOS16.0b4.sdk:

        Undefined symbols for architecture arm64:
        "_OBJC_CLASS_$_MATelephonyInfo", referenced from:
         objc-class-ref in Tweak.xm.426e3086.o
        ld: symbol(s) not found for architecture arm64

        While initializing MATelephonyInfo class object as such:  
        
        MATelephonyInfo* MATInfo = [[MATelephonyInfo alloc] init];
        struct CoreTelephonyClient * telephonyClient = [MATinfo telephonyClient];
        
        
        I will be updating this git shortly.

-Failbr34k
