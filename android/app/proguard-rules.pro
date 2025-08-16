# Proguard rules for Google Mobile Ads SDK
-keep public class com.google.android.gms.ads.** {
   public *;
}

-keep public class com.google.ads.** {
   public *;
}

# Keep the Google Mobile Ads SDK resources. This might be needed if you see resource-not-found errors related to ads.
# -keepresources com.google.android.gms.ads.**

# If you use mediation, you might need to add rules for specific mediation adapters.
# e.g., for AdColony:
# -keep class com.jirbo.adcolony.** { *; }
# -dontwarn com.jirbo.adcolony.**
