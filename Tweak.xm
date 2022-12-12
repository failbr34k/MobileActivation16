#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <Security/Security.h>
#import "mad16.h"
#import "substrate.h"
#import "SecKeyPriv.h"
#import "SecItemPriv.h"

/*!
 @enum SecKeySystemKeyType
 @abstract Defines types of builtin attestation keys.
*/
typedef CF_ENUM(int, SecKeySystemKeyType)
{
    kSecKeySystemKeyTypeSIK = 0x0,
    kSecKeySystemKeyTypeGID = 0x1,
    kSecKeySystemKeyTypeUIKCommitted = 0x2,
    kSecKeySystemKeyTypeUIKProposed  = 0x3,
    kSecKeySystemKeyTypeSecureElement = 0x4,
    kSecKeySystemKeyTypeDAKCommited = 0x7,
    kSecKeySystemKeyTypeDAKProposed = 0x8,
    kSecKeySystemKeyTypeHAVEnc = 0x9
};

/*!
@function SecKeyCopySystemKey
@abstract Returns a copy of a builtin attestation key.

@param keyType Type of the requested builtin key.
@param error An optional pointer to a CFErrorRef. This value is set if an error occurred.

@result On success a SecKeyRef containing the requested key is returned, on failure it returns NULL.
*/
extern SecKeyRef SecKeyCopySystemKey(SecKeySystemKeyType keyType, CFErrorRef *error);

%hook MALog
- (struct anonymous_type_3 * )logHandle { %log; struct anonymous_type_3 *  r = %orig; NSLog(@" = %p", r); return r; }
- (NSObject<OS_dispatch_queue> * )queue { %log; NSObject<OS_dispatch_queue> *  r = %orig; NSLog(@" = 0x%llx", (uint64_t)r); return r; }
+ (id)getSharedInstance { %log; id r = %orig; NSLog(@" = %@", r); return r; }
- (id)init { %log; id r = %orig; NSLog(@" = %@", r); return r; }
- (void)logMessage:(id)v1 toSyslog:(bool)v2 { %log; %orig; }
%end

%hook DataArk
//- (void)setStore:(NSMutableDictionary * )store { %log; %orig; }
//- (NSMutableDictionary * )store { %log; NSMutableDictionary *  r = %orig; NSLog(@" = %@", r); return r; }
- (NSString * )path { %log; NSString *  r = %orig; NSLog(@"path = %@", r); return r; }
- (void)setQueue:(NSObject<OS_dispatch_queue> * )queue { %log; %orig; }
- (NSObject<OS_dispatch_queue> * )queue { %log; NSObject<OS_dispatch_queue> *  r = %orig; NSLog(@"queue = 0x%llx", (uint64_t)r); return r; }
- (id)initWithPath:(id)v1 { %log; id r = %orig; NSLog(@"%@ initWithPath:%@", r, v1); return r; }
- (id)init { %log; id r = %orig; NSLog(@"init = %@", r); return r; }
%end

%hook MACollectionInterface
- (SecKeyRef)signingKey { %log; SecKeyRef r = %orig; CFDictionaryRef attributes = SecKeyCopyAttributes(r);  NSLog(@"\nsigning key = %p\nattributes:\n%@", r, attributes); return r; }
- (DataArk * )dark { %log; DataArk *  r = %orig; NSLog(@"dark = %@", r); return r; }
+ (id)copyIngestURL { %log; id r = %orig; NSLog(@"copyIngestURL = %@", r); return r; }
- (id)initWithContext:(id)v1 { %log; id r = %orig; NSLog(@"%@ initWithContext = %@", r, v1); return r; }
- (id)collectSigningAttestation:(id *)v1 { %log; id r = %orig; NSLog(@"collectSigningAttestation = %@", r); return r; }
- (id)collectSIK:(id *)v1 { %log; id r = %orig; NSLog(@"collectSIK = %@", r); return r; }
- (id)collectPCRT:(id *)v1 { %log; id r = %orig; NSLog(@"collectPCRT = %@", r); return r; }
- (id)signingKeyPublicKeyWithError:(id *)v1 { %log; id r = %orig; NSLog(@"signingKeyPublicKeyWithError = %@", r); return r; }
- (id)signatureForData:(id)v1 error:(id *)v2 { %log; id r = %orig; NSLog(@"signatureForData = %@", r); return r; }
- (id)copyIngestHeaders:(id)v1 withError:(id *)v2 { %log; id r = %orig; NSLog(@"copyIngestHeaders = %@", r); return r; }
- (id)copyIngestData:(id *)v1 { %log; id r = %orig; NSLog(@"copyIngestData = %@", r); return r; }
- (bool)processSUInfo:(id)v1 withError:(id *)v2 { %log; bool r = %orig; NSLog(@"%d processSUInfo = %@", r, v1); return r; }
%end

%hook GestaltHlpr
+ (id)getSharedInstance { %log; id r = %orig; NSLog(@"getSharedInstance = %@", r); return r; }
- (id)copyAnswer:(CFStringRef)v1 { %log; id r = %orig; NSLog(@"%@ copyAnswer = %@", v1, r); return r; }
- (bool)getBoolAnswer:(CFStringRef)v1 { %log; bool r = %orig; NSLog(@"%@ getBoolAnswer = %d", v1, r); return r; }
- (void)addAGestaltKey:(CFStringRef)v1 toDictionary:(CFDictionaryRef)v2 required:(bool)v3 errors:(id)v4 { %log; %orig; }
- (id)copyDeviceIDInfo:(id *)v1 { %log; id r = %orig; NSLog(@"copyDeviceIDInfo = %@", r); return r; }
- (id)copyDeviceInfo:(id *)v1 { %log; id r = %orig; NSLog(@"copyDeviceInfo = %@", r); return r; }
- (id)copyRegulatoryImagesInfo:(id *)v1 { %log; id r = %orig; NSLog(@"copyRegulatoryImagesInfo = %@", r); return r; }
- (void)updateRecertInfo:(id)v1 errors:(id *)v2 { %log; %orig; }
%end

%hook DeviceType
- (NSString * )product_type { %log; NSString *  r = %orig; NSLog(@"product_type = %@", r); return r; }
- (NSString * )device_class { %log; NSString *  r = %orig; NSLog(@"device_class = %@", r); return r; }
- (NSString * )hardware_model { %log; NSString *  r = %orig; NSLog(@"hardware_model = %@", r); return r; }
- (NSString * )soc_generation { %log; NSString *  r = %orig; NSLog(@"soc_generation = %@", r); return r; }
- (bool )device_supports_dcrt_oob { %log; bool  r = %orig; NSLog(@"device_supports_dcrt_oob = %d", r); return r; }
- (bool )is_prodfused_demoted { %log; bool  r = %orig; NSLog(@"is_prodfused_demoted = %d", r); return r; }
- (bool )is_devfused_undemoted { %log; bool  r = %orig; NSLog(@"is_devfused_undemoted = %d", r); return r; }
- (bool )is_dev_board { %log; bool  r = %orig; NSLog(@"is_dev_board = %d", r); return r; }
- (bool )is_fpga { %log; bool  r = %orig; NSLog(@"is_fpga = %d", r); return r; }
- (bool )is_ipod { %log; bool  r = %orig; NSLog(@"is_ipod = %d", r); return r; }
- (bool )is_ipad { %log; bool  r = %orig; NSLog(@"is_ipad = %d", r); return r; }
- (bool )is_iphone { %log; bool  r = %orig; NSLog(@"is_iphone = %d", r); return r; }
- (bool )is_audio_accessory { %log; bool  r = %orig; NSLog(@"is_audio_accessory = %d", r); return r; }
- (bool )has_baseband { %log; bool  r = %orig; NSLog(@"has_baseband = %d", r); return r; }
- (bool )should_hactivate { %log; bool  r = %orig; NSLog(@"should_hactivate = %d", r); return r; }
- (bool )is_internal_build { %log; bool  r = %orig; NSLog(@"is_internal_build = %d", r); return r; }
- (bool )has_internal_diagnostics { %log; bool  r = %orig; NSLog(@"has_internal_diagnostics = %d", r); return r; }
- (bool )is_virtual_machine { %log; bool  r = %orig; NSLog(@"is_virtual_machine = %d", r); return r; }
+ (id)sharedInstance { %log; id r = %orig; NSLog(@"sharedInstance = %@", r); return r; }
- (id)init { %log; id r = %orig; NSLog(@"init = %@", r); return r; }
- (id)copyDeviceTreeProperty:(id)v1 key:(id)v2 { %log; id r = %orig; NSLog(@"copyDeviceTreeProperty = %@", r); return r; }
- (bool)vmmPresent { %log; bool r = %orig; NSLog(@"vmmPresent = %d", r); return r; }
- (id)copyBootSessionUUID { %log; id r = %orig; NSLog(@"copyBootSessionUUID = %@", r); return r; }
- (id)copyBootArgs { %log; id r = %orig; NSLog(@"copyBootArgs = %@", r); return r; }
- (id)copyDeviceTreeInt:(id)v1 key:(id)v2 defaultValue:(int)v3 { %log; id r = %orig; NSLog(@"copyDeviceTreeInt = %@", r); return r; }
- (id)copyDeviceTreeString:(id)v1 key:(id)v2 defaultValue:(id)v3 { %log; id r = %orig; NSLog(@"copyDeviceTreeString = %@", r); return r; }
- (bool)runningInRAMDisk { %log; bool r = %orig; NSLog(@"runningInRAMDisk = %d", r); return r; }
%end

%hook MobileRecertifyEngine
- (void)setDark:(DataArk * )dark { %log; %orig; }
- (DataArk * )dark { %log; DataArk *  r = %orig; NSLog(@" = %@", r); return r; }
- (void)setQueue:(NSObject<OS_dispatch_queue> * )queue { %log; %orig; }
- (NSObject<OS_dispatch_queue> * )queue { %log; NSObject<OS_dispatch_queue> *  r = %orig; NSLog(@"queue = 0x%llx", (uint64_t)r); return r; }
- (id)initWithQueue:(id)v1 dark:(id)v2 { %log; id r = %orig; NSLog(@"%@ initWithQueue:%@ dark:%@", r, v1, v2); return r; }
- (id)createRecertInfoWithDataArk:(id)v1 alcoholBlob:(struct NACContextOpaque_ *)v2 options:(id)v3 error:(NSError *)v4 { %log; id r = %orig; NSLog(@" = %@", r); return r; }
- (void)recertifyDevice:(void (^)(NSDictionary*, NSError*))v1 { %log; %orig; }
%end

%hook MATelephonyInfo
- (NSString * )phoneNumber { %log; NSString *  r = %orig; NSLog(@"phoneNumber = %@", r); return r; }
- (NSString * )phoneNumberTwo { %log; NSString *  r = %orig; NSLog(@"phoneNumberTwo = %@", r); return r; }
- (NSString * )simStatus { %log; NSString *  r = %orig; NSLog(@"simStatus = %@", r); return r; }
- (NSString * )simStatusTwo { %log; NSString *  r = %orig; NSLog(@"simStatusTwo = %@", r); return r; }
- (NSNumber * )connectionAvailability { %log; NSNumber *  r = %orig; NSLog(@"connectionAvailability = %@", r); return r; }
- (NSNumber * )connectionAvailabilityTwo { %log; NSNumber *  r = %orig; NSLog(@"connectionAvailabilityTwo = %@", r); return r; }
- (struct CoreTelephonyClient * )telephonyClient { %log; struct CoreTelephonyClient *  r = %orig; NSLog(@"telephonyClient = %@", r); return r; }
- (NSObject<OS_dispatch_queue> * )queue { %log; NSObject<OS_dispatch_queue> *  r = %orig; NSLog(@"queue = 0x%llx", (uint64_t)r); return r; }
- (NSError * )lastPhoneNumberError { %log; NSError *  r = %orig; NSLog(@"lastPhoneNumberError = %@", r); return r; }
- (NSError * )lastPhoneNumberTwoError { %log; NSError *  r = %orig; NSLog(@"lastPhoneNumberTwoError = %@", r); return r; }
- (NSError * )lastSimStatusError { %log; NSError *  r = %orig; NSLog(@"lastSimStatusError = %@", r); return r; }
- (NSError * )lastSimStatusTwoError { %log; NSError *  r = %orig; NSLog(@"lastSimStatusTwoError = %@", r); return r; }
- (NSError * )lastConnectionAvailabilityError { %log; NSError *  r = %orig; NSLog(@"lastConnectionAvailabilityError = %@", r); return r; }
- (NSError * )lastConnectionAvailabilityTwoError { %log; NSError *  r = %orig; NSLog(@"lastConnectionAvailabilityTwoError = %@", r); return r; }
- (bool )dualSIMCapable { %log; bool  r = %orig; NSLog(@"dualSIMCapable = %d", r); return r; }
- (void * )otaActivationAssertion { %log; void *  r = %orig; NSLog(@"otaActivationAssertion = %p", r); return r; }
- (NSUInteger)hash { %log; NSUInteger r = %orig; NSLog(@"hash = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; NSLog(@"superclass = %@", r); return r; }
- (NSString * )description { %log; NSString *  r = %orig; NSLog(@"description = %@", r); return r; }
- (NSString * )debugDescription { %log; NSString *  r = %orig; NSLog(@"debugDescription = %@", r); return r; }
+ (id)sharedInstance { %log; id r = %orig; NSLog(@"sharedInstance = %@", r); return r; }
- (id)init { %log; id r = %orig; NSLog(@"init = %@", r); return r; }
- (bool)setCellularBootstrapAssertion:(bool)v1 withError:(NSError *)v2 { %log; bool r = %orig; NSLog(@"setCellularBootstrapAssertion = %d", r); return r; }
- (bool)setOTAActivationAssertion:(bool)v1 withError:(NSError *)v2 { %log; bool r = %orig; NSLog(@"%d setOTAActivationAssertion:%d withError:%@", r, v1, v2); return r; }
- (bool)bootstrapDataServiceAvailableWithError:(NSError *)v1 { %log; bool r = %orig; NSLog(@"bootstrapDataServiceAvailableWithError = %d", r); return r; }
- (id)copyPhoneNumberWithSlotID:(long long)v1 error:(NSError *)v2 { %log; id r = %orig; NSLog(@"copyPhoneNumberWithSlotID = %@", r); return r; }
- (id)copySIMStatusWithSlotID:(long long)v1 error:(NSError *)v2 { %log; id r = %orig; NSLog(@"copySIMStatusWithSlotID = %@", r); return r; }
- (id)copyConnectionAvailabilityWithSlotID:(long long)v1 error:(NSError *)v2 { %log; id r = %orig; NSLog(@"copyConnectionAvailabilityWithSlotID = %@", r); return r; }
- (id)_copySIMStatusWithSlotID:(long long)v1 error:(NSError *)v2 { %log; id r = %orig; NSLog(@"_copySIMStatusWithSlotID = %@", r); return r; }
- (id)_copyPhoneNumberWithSlotID:(long long)v1 error:(NSError *)v2 { %log; id r = %orig; NSLog(@"_copyPhoneNumberWithSlotID = %@", r); return r; }
- (id)_copyConnectionAvailabilityWithSlotID:(long long)v1 error:(NSError *)v2 { %log; id r = %orig; NSLog(@" _copyConnectionAvailabilityWithSlotID= %@", r); return r; }
- (void)phoneNumberChanged:(id)v1 { %log; %orig; }
- (void)simStatusDidChange:(id)v1 status:(id)v2 { %log; %orig; }
- (void)connectionAvailability:(id)v1 availableConnections:(id)v2 { %log; %orig; }
%end

%hook MobileActivationDaemon
- (void)setDark:(DataArk * )dark { %log; %orig; }
- (DataArk * )dark { %log; DataArk *  r = %orig; NSLog(@"dark = %@", r); return r; }
- (struct PSCSessionInternal_ * )session { %log; struct PSCSessionInternal_ *  r = %orig; NSLog(@"session = %p", r); return r; }
- (NSData * )sessionHelloMessage { %log; NSData *  r = %orig; NSLog(@"sessionHelloMessage = %@", r); return r; }
- (NSString * )activationNonce { %log; NSString *  r = %orig; NSLog(@"activationNonce = %@", r); return r; }
- (void)setActivationSessionClientName:(NSString * )activationSessionClientName { %log; %orig; }
- (NSString * )activationSessionClientName { %log; NSString *  r = %orig; NSLog(@"activationSessionClientName = %@", r); return r; }
- (void)setRecertNonce:(NSString * )recertNonce { %log; %orig; }
- (NSString * )recertNonce { %log; NSString *  r = %orig; NSLog(@"recertNonce = %@", r); return r; }
- (bool )isHostConnection { %log; bool  r = %orig; NSLog(@"isHostConnection = %d", r); return r; }
- (unsigned long long )hash { %log; unsigned long long  r = %orig; NSLog(@"hash = %llu", r); return r; }
- (Class )superclass { %log; Class  r = %orig; NSLog(@"superclass = %@", r); return r; }
- (NSString * )description { %log; NSString *  r = %orig; NSLog(@"description = %@", r); return r; }
- (NSString * )debugDescription { %log; NSString *  r = %orig; NSLog(@"debugDescription = %@", r); return r; }
- (id)initWithContext:(id)v1 Queue:(id)v2 { %log; id r = %orig; NSLog(@"%@ initWithContext:%@ queue:%@", r, v1, v2); return r; }
- (id)callingProcessName { %log; id r = %orig; NSLog(@"callingProcessName = %@", r); return r; }
- (bool)isEntitled:(id)v1 { %log; bool r = %orig; NSLog(@"isEntitled = %d", r); return r; }
- (id)valueForEntitlement:(id)v1 { %log; id r = %orig; NSLog(@"valueForEntitlement = %@", r); return r; }
- (id)copyUCRTVersionInfoWithError:(id *)v1 { %log; id r = %orig; NSLog(@"copyUCRTVersionInfoWithError = %@", r); return r; }
- (bool)handleSessionResponse:(id)v1 withError:(id *)v2 { %log; bool r = %orig; NSLog(@"%d handleSessionResponse:%@", r, v1); return r; }
- (bool)validateActivationDataSignature:(id)v1 activationSignature:(id)v2 withError:(id *)v3 { %log; bool r = %orig; NSLog(@"validateActivationDataSignature = %d", r); return r; }
- (void)getActivationStateWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)performMigrationWithCompletion:(id)v1 completion:(void (^)(NSDictionary *, NSError*))v2 { %log; %orig; }
- (void)copyAutomaticTimeEnabledWithCompletion:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)copyRTCResetCountWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)copyMonotonicClockWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)deactivateDeviceWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)createTunnel1ActivationInfo:(id)v1 options:(id)v2 withCompletionBlock:(void (^)(NSDictionary *, NSError*))v3 { %log; %orig; }
- (void)createTunnel1SessionInfoWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)createActivationInfoWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)handleActivationInfo:(id)v1 withCompletionBlock:(void (^)(NSDictionary *, NSError*))v2 { %log; %orig; }
- (void)copyUCRTWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)copyPCRTTokenWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)isDeviceBrickedWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)getActivationBuildWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)requestDeviceReactivationWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)copyActivationRecordWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)unbrickDeviceWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)recertifyDeviceWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)handleActivationInfoWithSession:(id)v1 activationSignature:(id)v2 completionBlock:(void (^)(NSDictionary *, NSError*))v3 { %log; %orig; }
- (void)issueClientCertificateLegacy:(id)v1 WithCompletionBlock:(void (^)(NSDictionary *, NSError*))v2 { %log; %orig; }
- (void)issueClientCertificateWithReferenceKey:(id)v1 options:(id)v2 completion:(void (^)(NSDictionary *, NSError*))v3 { %log; %orig; }
- (void)copyAttestationDictionaryWithCompletionBlock:(id)v1 options:(id)v2 completion:(void (^)(NSDictionary *, NSError*))v3 { %log; %orig; }
- (void)isInFieldCollectedWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)updateBasebandTicket:(id)v1 baaCertData:(id)v2 baaIntermediateCert:(id)v3 options:(id)v4 withCompletionBlock:(void (^)(NSDictionary *, NSError*))v5 { %log; %orig; }
- (void)copyDCRTWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)getDCRTStateWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)issueDCRT:(id)v1 withCompletionBlock:(void (^)(NSDictionary *, NSError*))v2 { %log; %orig; }
- (void)copyLegacyDeviceIdentityWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)deleteLegacyDeviceIdentityWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
- (void)copyUCRTVersionInfoWithCompletionBlock:(void (^)(NSDictionary *, NSError*))v1 { %log; %orig; }
%end

SecKeyRef (*orig_SecKeyCopySystemKey)(SecKeySystemKeyType keyType, CFErrorRef* error);
SecKeyRef my_SecKeyCopySystemKey(SecKeySystemKeyType keyType, CFErrorRef* error)
{
    NSLog(@"SecKeyCopySystemKey was called");
    SecKeyRef r = orig_SecKeyCopySystemKey(keyType, error);
    NSLog(@"SecKeyCopySystemKey: %@\ntype:%d error: %@", r, keyType, error);
    CFDictionaryRef attributes = SecKeyCopyAttributes(r);
    NSLog(@"Key attributes: %@ ", attributes);
    return r;   
}

SecKeyRef (*orig_SecKeyCreateRandomKey)(CFDictionaryRef parameters, CFErrorRef *error);
SecKeyRef my_SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
    NSLog(@"SecKeyCreateRandomKey was called");
    SecKeyRef r = orig_SecKeyCreateRandomKey(parameters, error);
    NSLog(@"SecKeyCreateRandomKey: %@\nerror: %@", parameters,  error);
    CFDictionaryRef attributes = SecKeyCopyAttributes(r);
    NSLog(@"Key attributes: %@ ", attributes);

    return r;
}

CFDataRef (*orig_SecKeyCreateAttestation)(SecKeyRef key, SecKeyRef keyToAttest, CFErrorRef * error);
CFDataRef my_SecKeyCreateAttestation(SecKeyRef key, SecKeyRef keyToAttest, CFErrorRef * error)
{
    NSLog(@"SecKeyCreateAttestation was called");
    CFDataRef r = orig_SecKeyCreateAttestation(key, keyToAttest, error);
    CFDictionaryRef keyAttributes = SecKeyCopyAttributes(key);
    CFDictionaryRef keyToAttestAttributes = SecKeyCopyAttributes(keyToAttest);
    NSLog(@"Key attributes: %@ ", keyAttributes);
    NSLog(@"Key to attests attributes %@ ", keyToAttestAttributes);
    NSLog(@"SecKeyCreateAttestation: %@ ", r);
    return r;
}

%ctor {
    %init();
    MSHookFunction(SecKeyCreateAttestation, my_SecKeyCreateAttestation, &orig_SecKeyCreateAttestation);
    MSHookFunction(SecKeyCopySystemKey, my_SecKeyCopySystemKey, &orig_SecKeyCopySystemKey);
    MSHookFunction(SecKeyCreateRandomKey, my_SecKeyCreateRandomKey, &orig_SecKeyCreateRandomKey);
}