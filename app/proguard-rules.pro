# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /home/marcel/Android/Sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

#Line numbers
-renamesourcefileattribute SourceFile
-keepattributes SourceFile,LineNumberTable

#NetGuard
-keepnames class eu.faircode.netguard.** { *; }

#JNI
-keepclasseswithmembernames class * {
    native <methods>;
}

#JNI callbacks
-keep class eu.faircode.netguard.Allowed { *; }
-keep class eu.faircode.netguard.Packet { *; }
-keep class eu.faircode.netguard.ResourceRecord { *; }
-keep class eu.faircode.netguard.Usage { *; }
-keep class eu.faircode.netguard.ServiceSinkhole {
    void nativeExit(java.lang.String);
    void nativeError(int, java.lang.String);
    void logPacket(eu.faircode.netguard.Packet);
    void dnsResolved(eu.faircode.netguard.ResourceRecord);
    boolean isDomainBlocked(java.lang.String);
    eu.faircode.netguard.Allowed isAddressAllowed(eu.faircode.netguard.Packet);
    void accountUsage(eu.faircode.netguard.Usage);
}

#Support library
-keep class android.support.v7.widget.** { *; }
-dontwarn android.support.v4.**

#Picasso
-dontwarn com.squareup.okhttp.**

#AdMob
-dontwarn com.google.android.gms.internal.**

# Platform calls Class.forName on types which do not exist on Android to determine platform.
-dontnote retrofit2.Platform
# Platform used when running on Java 8 VMs. Will not be used at runtime.
-dontwarn retrofit2.Platform$Java8
# Retain generic type information for use by reflection by converters and adapters.
-keepattributes Signature
# Retain declared checked exceptions for use by a Proxy instance.
-keepattributes Exceptions
-dontwarn okio.**


# ORMLite

-keepattributes *DatabaseField*
-keepattributes *DatabaseTable*
-keepattributes *SerializedName*
-keep class com.j256.**
-keepclassmembers class com.j256.** { *; }
-keep enum com.j256.**
-keepclassmembers enum com.j256.** { *; }
-keep interface com.j256.**
-keepclassmembers interface com.j256.** { *; }
-dontwarn com.j256.**


-dontwarn java.lang.invoke.**