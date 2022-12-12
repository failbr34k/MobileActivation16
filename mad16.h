#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <Security/Security.h>
#import "CFRuntime.h"

struct anonymous_type_3 {
    void * field_1;
    char * field_2;
    char * field_3;
    long long field_4;
    unsigned int field_5;
    int field_6;
    int field_7;
    int field_8;
    int field_9;
};

struct PSCSessionInternal_ {
};


@protocol CoreTelephonyClientDataDelegate<NSObject>

@optional
- (void)connectionStateChanged:(id)v1 connection:(int)v2 dataConnectionStatusInfo:(id)v3;
- (void)connectionActivationError:(id)v1 connection:(int)v2 error:(int)v3;
- (void)anbrActivationState:(id)v1 enabled:(bool)v2;
- (void)anbrBitrateRecommendation:(id)v1 bitrate:(id)v2 direction:(int)v3;
- (void)preferredDataSimChanged:(id)v1;
- (void)preferredDataServiceDescriptorChanged:(id)v1;
- (void)currentDataSimChanged:(id)v1;
- (void)currentDataServiceDescriptorChanged:(id)v1;
- (void)servingNetworkChanged:(id)v1;
- (void)connectionAvailability:(id)v1 availableConnections:(id)v2;
- (void)dataStatus:(id)v1 dataStatusInfo:(id)v2;
- (void)regDataModeChanged:(id)v1 dataMode:(int)v2;
- (void)dataSettingsChanged:(id)v1;
- (void)internetConnectionStateChanged:(id)v1;
- (void)internetConnectionActivationError:(int)v1;
- (void)internetDataStatusBasic:(id)v1;
- (void)internetDataStatus:(id)v1;
- (void)internetConnectionAvailability:(bool)v1;
- (void)tetheringStatus:(id)v1;
- (void)tetheringStatus:(id)v1 connectionType:(int)v2;
- (void)serviceDisconnection:(id)v1 status:(id)v2;
- (void)dataRoamingSettingsChanged:(id)v1 status:(bool)v2;
@end


/*****************************************************************/

@protocol CoreTelephonyClientSubscriberDelegate<NSObject>

@optional
- (void)simStatusDidChange:(id)v1 status:(id)v2;
- (void)simLockSaveRequestDidComplete:(id)v1 success:(bool)v2;
- (void)simPinEntryErrorDidOccur:(id)v1 status:(id)v2;
- (void)simPukEntryErrorDidOccur:(id)v1 status:(id)v2;
- (void)simPinChangeRequestDidComplete:(id)v1 success:(bool)v2;
- (void)authTokenChanged:(id)v1;
- (void)shortLabelsDidChange;
- (void)subscriberCountryCodeDidChange:(id)v1;
- (void)userDefaultVoiceSlotDidChange:(id)v1;
- (void)prlVersionDidChange:(id)v1 version:(id)v2;
- (void)didDetectSimDeactivation:(id)v1 info:(id)v2;
@end


/*****************************************************************/

@protocol CoreTelephonyClientSuppServicesDelegate<NSObject>

@optional
- (void)suppServicesEvent:(id)v1 event:(int)v2 settingsType:(int)v3 data:(NSData*)v4;
- (void)spcUnlockSuccessful:(id)v1;
- (void)phoneBookSelected:(id)v1;
- (void)phoneBookFetched:(id)v1;
- (void)phoneBookWritten:(id)v1;
- (void)phoneBookError:(id)v1;
- (void)phoneNumberAvailable:(id)v1;
- (void)phoneNumberChanged:(id)v1;
- (void)suppServicesStarted:(id)v1;
- (void)suppServicesCompleted:(id)v1;
- (void)suppServicesError:(id)v1 error:(id)v2;
@end


/*****************************************************************/

@protocol MobileActivationProtocol<NSObject>
- (void)getActivationStateWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)copyUCRTVersionInfoWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)performMigrationWithCompletion:(id)v1 completion:(void (^)(NSDictionary*, NSError*))v2;
- (void)copyAutomaticTimeEnabledWithCompletion:(void (^)(NSDictionary*, NSError*))v1;
- (void)copyRTCResetCountWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)copyMonotonicClockWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)createTunnel1ActivationInfo:(id)v1 options:(id)v2 withCompletionBlock:(void (^)(NSDictionary*, NSError*))v3;
- (void)createTunnel1SessionInfoWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)createActivationInfoWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)handleActivationInfo:(id)v1 withCompletionBlock:(void (^)(NSDictionary*, NSError*))v2;
- (void)copyUCRTWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)copyPCRTTokenWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)isDeviceBrickedWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)deactivateDeviceWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)requestDeviceReactivationWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)getActivationBuildWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)copyActivationRecordWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)unbrickDeviceWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)recertifyDeviceWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)handleActivationInfoWithSession:(id)v1 activationSignature:(id)v2 completionBlock:(void (^)(NSDictionary*, NSError*))v3;
- (void)issueClientCertificateLegacy:(id)v1 WithCompletionBlock:(void (^)(NSDictionary*, NSError*))v2;
- (void)issueClientCertificateWithReferenceKey:(id)v1 options:(id)v2 completion:(void (^)(NSDictionary*, NSError*))v3;
- (void)copyAttestationDictionaryWithCompletionBlock:(id)v1 options:(id)v2 completion:(void (^)(NSDictionary*, NSError*))v3;
- (void)isInFieldCollectedWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)updateBasebandTicket:(id)v1 baaCertData:(id)v2 baaIntermediateCert:(id)v3 options:(id)v4 withCompletionBlock:(void (^)(NSDictionary*, NSError*))v5;
- (void)getDCRTStateWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)copyDCRTWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)issueDCRT:(id)v1 withCompletionBlock:(void (^)(NSDictionary*, NSError*))v2;
- (void)copyLegacyDeviceIdentityWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)deleteLegacyDeviceIdentityWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
@end



@interface MALog : NSObject {
    struct anonymous_type_2 * _logHandle;
    NSObject<OS_dispatch_queue> * _queue;
}
@property (nonatomic) struct anonymous_type_3 * logHandle;
@property (retain,nonatomic) NSObject<OS_dispatch_queue> * queue;
+ (id)getSharedInstance;
- (id)init;
- (void)dealloc;
- (void)deleteExpiredLogFiles;
- (void)logMessage:(id)v1 toSyslog:(bool)v2;
@end


/*****************************************************************/

@interface DataArk : NSObject {
    NSMutableDictionary * _store;
    NSMutableDictionary * _set_notifications;
    NSMutableDictionary * _change_notifications;
    NSMutableDictionary * _remove_notifications;
    NSString * _path;
    NSObject<OS_dispatch_queue> * _queue;
}
@property (retain,nonatomic) NSMutableDictionary * store;
@property (retain,nonatomic) NSMutableDictionary * set_notifications;
@property (retain,nonatomic) NSMutableDictionary * change_notifications;
@property (retain,nonatomic) NSMutableDictionary * remove_notifications;
@property (retain,nonatomic) NSString * path;
@property (retain,nonatomic) NSObject<OS_dispatch_queue> * queue;
- (id)initWithPath:(id)v1;
- (id)init;
- (void)postNotification:(id)v1;
@end


/*****************************************************************/

@interface MACollectionInterface : NSObject {
    bool _collectionLibraryLoaded;
    SecKeyRef _signingKey;
    DataArk * _dark;
}
@property (readonly) SecKeyRef signingKey;
@property (nonatomic) bool collectionLibraryLoaded;
@property (readonly,nonatomic) DataArk * dark;
+ (id)copyIngestURL;
- (id)initWithContext:(id)v1;
- (void)dealloc;
- (id)collectSigningAttestation:(NSError *)v1;
- (id)collectSIK:(NSError *)v1;
- (id)collectPCRT:(NSError *)v1;
- (id)signingKeyPublicKeyWithError:(NSError *)v1;
- (id)signatureForData:(id)v1 error:(NSError *)v2;
- (id)copyIngestHeaders:(id)v1 withError:(NSError *)v2;
- (id)copyIngestData:(NSError *)v1;
- (bool)processSUInfo:(id)v1 withError:(NSError *)v2;
@end


/*****************************************************************/

@interface GestaltHlpr : NSObject
+ (id)getSharedInstance;
- (id)copyAnswer:(CFStringRef)v1;
- (bool)getBoolAnswer:(CFStringRef)v1;
- (void)addAGestaltKey:(CFStringRef)v1 toDictionary:(CFDictionaryRef)v2 required:(bool)v3 errors:(id)v4;
- (id)copyDeviceIDInfo:(NSError *)v1;
- (id)copyDeviceInfo:(NSError *)v1;
- (id)copyRegulatoryImagesInfo:(NSError *)v1;
- (void)updateRecertInfo:(id)v1 errors:(NSError *)v2;
@end


/*****************************************************************/

@interface DeviceType : NSObject {
    bool _device_supports_dcrt_oob;
    bool _is_prodfused_demoted;
    bool _is_devfused_undemoted;
    bool _is_dev_board;
    bool _is_fpga;
    bool _is_ipod;
    bool _is_ipad;
    bool _is_iphone;
    bool _is_audio_accessory;
    bool _has_baseband;
    bool _should_hactivate;
    bool _is_internal_build;
    bool _has_internal_diagnostics;
    bool _is_virtual_machine;
    NSString * _product_type;
    NSString * _device_class;
    NSString * _hardware_model;
    NSString * _soc_generation;
}
@property (readonly,copy,nonatomic) NSString * product_type;
@property (readonly,copy,nonatomic) NSString * device_class;
@property (readonly,copy,nonatomic) NSString * hardware_model;
@property (readonly,copy,nonatomic) NSString * soc_generation;
@property (readonly,nonatomic) bool device_supports_dcrt_oob;
@property (readonly,nonatomic) bool is_prodfused_demoted;
@property (readonly,nonatomic) bool is_devfused_undemoted;
@property (readonly,nonatomic) bool is_dev_board;
@property (readonly,nonatomic) bool is_fpga;
@property (readonly,nonatomic) bool is_ipod;
@property (readonly,nonatomic) bool is_ipad;
@property (readonly,nonatomic) bool is_iphone;
@property (readonly,nonatomic) bool is_audio_accessory;
@property (readonly,nonatomic) bool has_baseband;
@property (readonly,nonatomic) bool should_hactivate;
@property (readonly,nonatomic) bool is_internal_build;
@property (readonly,nonatomic) bool has_internal_diagnostics;
@property (readonly,nonatomic) bool is_virtual_machine;
+ (id)sharedInstance;
- (id)init;
- (id)copyDeviceTreeProperty:(id)v1 key:(id)v2;
- (bool)vmmPresent;
- (id)copyBootSessionUUID;
- (id)copyBootArgs;
- (id)copyDeviceTreeInt:(id)v1 key:(id)v2 defaultValue:(int)v3;
- (id)copyDeviceTreeString:(id)v1 key:(id)v2 defaultValue:(id)v3;
- (bool)runningInRAMDisk;
@end



/*****************************************************************/

@interface MobileRecertifyEngine : NSObject {
    DataArk * _dark;
    NSObject<OS_dispatch_queue> * _queue;
}
@property (retain,nonatomic) DataArk * dark;
@property (retain,nonatomic) NSObject<OS_dispatch_queue> * queue;
- (id)initWithQueue:(id)v1 dark:(id)v2;
- (id)createRecertInfoWithDataArk:(id)v1 alcoholBlob:(struct NACContextOpaque_ *)v2 options:(id)v3 error:(NSError *)v4;
- (void)recertifyDevice:(void (^)(NSDictionary*, NSError*))v1;
@end


/*****************************************************************/

@interface MATelephonyInfo : NSObject<CoreTelephonyClientDataDelegate,CoreTelephonyClientSubscriberDelegate,CoreTelephonyClientSuppServicesDelegate> {
    bool _dualSIMCapable;
    NSString * _phoneNumber;
    NSString * _phoneNumberTwo;
    NSString * _simStatus;
    NSString * _simStatusTwo;
    NSNumber * _connectionAvailability;
    NSNumber * _connectionAvailabilityTwo;
    struct CoreTelephonyClient * _telephonyClient;
    NSObject<OS_dispatch_queue> * _queue;
    NSError * _lastPhoneNumberError;
    NSError * _lastPhoneNumberTwoError;
    NSError * _lastSimStatusError;
    NSError * _lastSimStatusTwoError;
    NSError * _lastConnectionAvailabilityError;
    NSError * _lastConnectionAvailabilityTwoError;
    bool _otaActivationAssertion;
}
@property (retain,nonatomic) NSString * phoneNumber;
@property (retain,nonatomic) NSString * phoneNumberTwo;
@property (retain,nonatomic) NSString * simStatus;
@property (retain,nonatomic) NSString * simStatusTwo;
@property (retain,nonatomic) NSNumber * connectionAvailability;
@property (retain,nonatomic) NSNumber * connectionAvailabilityTwo;
@property (atomic) struct CoreTelephonyClient * telephonyClient;
@property (retain,nonatomic) NSObject<OS_dispatch_queue> * queue;
@property (retain,nonatomic) NSError * lastPhoneNumberError;
@property (retain,nonatomic) NSError * lastPhoneNumberTwoError;
@property (retain,nonatomic) NSError * lastSimStatusError;
@property (retain,nonatomic) NSError * lastSimStatusTwoError;
@property (retain,nonatomic) NSError * lastConnectionAvailabilityError;
@property (retain,nonatomic) NSError * lastConnectionAvailabilityTwoError;
@property (nonatomic) bool dualSIMCapable;
@property (nonatomic) bool otaActivationAssertion;
//@property (readonly) unsigned long long hash;
@property (readonly) Class superclass;
@property (readonly,copy) NSString * description;
@property (readonly,copy) NSString * debugDescription;
+ (id)sharedInstance;
- (id)init;
- (bool)setCellularBootstrapAssertion:(bool)v1 withError:(NSError *)v2;
- (bool)setOTAActivationAssertion:(bool)v1 withError:(NSError *)v2;
- (bool)bootstrapDataServiceAvailableWithError:(NSError *)v1;
- (id)copyPhoneNumberWithSlotID:(long long)v1 error:(NSError *)v2;
- (id)copySIMStatusWithSlotID:(long long)v1 error:(NSError *)v2;
- (id)copyConnectionAvailabilityWithSlotID:(long long)v1 error:(NSError *)v2;
- (id)_copySIMStatusWithSlotID:(long long)v1 error:(NSError *)v2;
- (id)_copyPhoneNumberWithSlotID:(long long)v1 error:(NSError *)v2;
- (id)_copyConnectionAvailabilityWithSlotID:(long long)v1 error:(NSError *)v2;
- (void)phoneNumberChanged:(id)v1;
- (void)simStatusDidChange:(id)v1 status:(id)v2;
- (void)connectionAvailability:(id)v1 availableConnections:(id)v2;
@end


/*****************************************************************/

@interface MobileActivationDaemon : NSObject<MobileActivationProtocol> {
    struct PSCSessionInternal_ * _session;
    NSData * _sessionHelloMessage;
    DataArk * _dark;
    NSObject<OS_dispatch_queue> * _sessionQueue;
    NSObject<OS_dispatch_queue> * _xpcQueue;
    NSObject<OS_dispatch_queue> * _creationQueue;
    NSString * _activationNonce;
    NSString * _activationSessionClientName;
    NSString * _recertNonce;
}
@property (retain,nonatomic) DataArk * dark;
@property (readonly,nonatomic) struct PSCSessionInternal_ * session;
@property (readonly,nonatomic) NSData * sessionHelloMessage;
@property (readonly,nonatomic) NSObject<OS_dispatch_queue> * sessionQueue;
@property (readonly,nonatomic) NSObject<OS_dispatch_queue> * xpcQueue;
@property (readonly,nonatomic) NSObject<OS_dispatch_queue> * creationQueue;
@property (retain,nonatomic) NSString * activationNonce;
@property (retain,nonatomic) NSString * activationSessionClientName;
@property (retain,nonatomic) NSString * recertNonce;
@property (readonly,nonatomic) bool isHostConnection;
//@property (readonly) unsigned long long hash;
@property (readonly) Class superclass;
@property (readonly,copy) NSString * description;
@property (readonly,copy) NSString * debugDescription;
- (id)initWithContext:(id)v1 Queue:(id)v2;
- (void)dealloc;
- (void)generateSession;
- (id)callingProcessName;
- (bool)isEntitled:(id)v1;
- (id)valueForEntitlement:(id)v1;
- (bool)listener:(id)v1 shouldAcceptNewConnection:(id)v2;
- (id)copyUCRTVersionInfoWithError:(NSError *)v1;
- (bool)handleSessionResponse:(id)v1 withError:(NSError *)v2;
- (bool)validateActivationDataSignature:(id)v1 activationSignature:(id)v2 withError:(NSError *)v3;
- (void)getActivationStateWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)performMigrationWithCompletion:(id)v1 completion:(void (^)(NSDictionary*, NSError*))v2;
- (void)copyAutomaticTimeEnabledWithCompletion:(void (^)(NSDictionary*, NSError*))v1;
- (void)copyRTCResetCountWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)copyMonotonicClockWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)deactivateDeviceWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)createTunnel1ActivationInfo:(id)v1 options:(id)v2 withCompletionBlock:(void (^)(NSDictionary*, NSError*))v3;
- (void)createTunnel1SessionInfoWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)createActivationInfoWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)handleActivationInfo:(id)v1 withCompletionBlock:(void (^)(NSDictionary*, NSError*))v2;
- (void)copyUCRTWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)copyPCRTTokenWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)isDeviceBrickedWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)getActivationBuildWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)requestDeviceReactivationWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)copyActivationRecordWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)unbrickDeviceWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)recertifyDeviceWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)handleActivationInfoWithSession:(id)v1 activationSignature:(id)v2 completionBlock:(void (^)(NSDictionary*, NSError*))v3;
- (void)issueClientCertificateLegacy:(id)v1 WithCompletionBlock:(void (^)(NSDictionary*, NSError*))v2;
- (void)issueClientCertificateWithReferenceKey:(id)v1 options:(id)v2 completion:(void (^)(NSDictionary*, NSError*))v3;
- (void)copyAttestationDictionaryWithCompletionBlock:(id)v1 options:(id)v2 completion:(void (^)(NSDictionary*, NSError*))v3;
- (void)isInFieldCollectedWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)updateBasebandTicket:(id)v1 baaCertData:(id)v2 baaIntermediateCert:(id)v3 options:(id)v4 withCompletionBlock:(void (^)(NSDictionary*, NSError*))v5;
- (void)copyDCRTWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)getDCRTStateWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)issueDCRT:(id)v1 withCompletionBlock:(void (^)(NSDictionary*, NSError*))v2;
- (void)copyLegacyDeviceIdentityWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)deleteLegacyDeviceIdentityWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
- (void)copyUCRTVersionInfoWithCompletionBlock:(void (^)(NSDictionary*, NSError*))v1;
@end
