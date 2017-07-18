.class public Lmiui/drm/DrmManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/drm/DrmManager$1;,
        Lmiui/drm/DrmManager$DrmNSContext;,
        Lmiui/drm/DrmManager$DrmResult;,
        Lmiui/drm/DrmManager$RightObject;,
        Lmiui/drm/DrmManager$RightObjectCache;,
        Lmiui/drm/DrmManager$TrialLimits;
    }
.end annotation


# static fields
.field private static final ASSET_XPATH:Ljava/lang/String; = "/o-ex:rights/o-ex:agreement/o-ex:asset/o-ex:context/o-dd:uid"

.field private static final DISPLAY_COUNT_XPATH:Ljava/lang/String; = "/o-ex:rights/o-ex:agreement/o-ex:permission/o-dd:display/o-ex:constraint/o-dd:count"

.field private static final IMEI_EVERYONE:Ljava/lang/String; = "-1"

.field private static final IMEI_PREFIX:Ljava/lang/String; = "d"

.field private static final INDIVIDUAL_XPATH:Ljava/lang/String; = "/o-ex:rights/o-ex:agreement/o-ex:permission/o-dd:execute/o-ex:constraint/oma-dd:individual/o-ex:context/o-dd:uid"

.field private static final ITEM_SEPARATOR:Ljava/lang/String; = ","

.field private static final PAIR_SEPARATOR:Ljava/lang/String; = ":"

.field private static final PUBLIC_KEY_E:Ljava/lang/String; = "10001"

.field private static final PUBLIC_KEY_M:Ljava/lang/String; = "a2ebd07cfae9a72345fc3c95d80cf5a21a55bf553fbab3025c82747ba4d53d1f9b02f46c20b5520585a910732698b165f0ecf7bd9ce5402e27c646cd0c5d34cff92b184d6a477e156a7d3503b756cc3e8531fb26c0da0ca051ab531c7f9f2a040a06642cadb698882c048630030b73edbbd62da73f7027065443c6e2558edfbd"

.field private static final SUPPORT_AD:Ljava/lang/String; = "support_ad"

.field public static final TAG:Ljava/lang/String; = "drm"

.field private static final TIME_END_XPATH:Ljava/lang/String; = "/o-ex:rights/o-ex:agreement/o-ex:permission/o-dd:execute/o-ex:constraint/o-dd:datetime/o-dd:end"

.field private static final TIME_START_XPATH:Ljava/lang/String; = "/o-ex:rights/o-ex:agreement/o-ex:permission/o-dd:execute/o-ex:constraint/o-dd:datetime/o-dd:start"

.field private static final USER_EVERYONE:Ljava/lang/String; = "-1"

.field private static final USER_PREFIX:Ljava/lang/String; = "m"

.field private static mRightsCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lmiui/drm/DrmManager$RightObjectCache;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lmiui/drm/DrmManager$1;

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lmiui/drm/DrmManager$1;-><init>(IFZ)V

    sput-object v0, Lmiui/drm/DrmManager;->mRightsCache:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static convertHexStringToBytes(Ljava/lang/String;)[B
    .locals 5

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    new-array v0, v2, [B

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    div-int/lit8 v2, v1, 0x2

    add-int/lit8 v3, v1, 0x2

    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static exportFatalLog(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    :try_start_0
    new-instance v1, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lmiui/content/res/ThemeResources;->THEME_MAGIC_PATH:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "drm.log"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v4

    const-wide/32 v6, 0x19000

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "recreate log file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "create log file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "export error message into "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v4, Ljava/io/FileWriter;

    const/4 v5, 0x1

    invoke-direct {v4, v1, v5}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    invoke-direct {v3, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lmiui/drm/DrmManager;->getContextInfo()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    invoke-virtual {v3}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v3, :cond_2

    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_2
    :goto_0
    move-object v2, v3

    :cond_3
    :goto_1
    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v0

    :goto_2
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v2, :cond_3

    :try_start_4
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1

    :catchall_0
    move-exception v4

    :goto_3
    if-eqz v2, :cond_4

    :try_start_5
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    :cond_4
    :goto_4
    throw v4

    :catch_3
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_4

    :catchall_1
    move-exception v4

    move-object v2, v3

    goto :goto_3

    :catch_4
    move-exception v0

    move-object v2, v3

    goto :goto_2
.end method

.method private static getContextInfo()Ljava/lang/String;
    .locals 4

    const-string/jumbo v0, "%s %s_%s %s"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    sget-object v2, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    sget-object v2, Landroid/os/Build$VERSION;->INCREMENTAL:Ljava/lang/String;

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v2

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getEncodedImei(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lmiui/drm/DrmManager;->getOriginImei(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, ""

    return-object v1

    :cond_0
    invoke-static {v0}, Lmiui/util/HashUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMorePreciseDrmResult(Lmiui/drm/DrmManager$DrmResult;Lmiui/drm/DrmManager$DrmResult;)Lmiui/drm/DrmManager$DrmResult;
    .locals 1

    invoke-virtual {p0, p1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-gez v0, :cond_0

    :goto_0
    return-object p0

    :cond_0
    move-object p0, p1

    goto :goto_0
.end method

.method private static getOriginImei(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-static {}, Lmiui/telephony/TelephonyManagerUtil;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v1, ""

    return-object v1

    :cond_0
    return-object v0
.end method

.method private static getTime(Ljava/lang/String;)J
    .locals 5

    const-wide/16 v2, 0x0

    :try_start_0
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v4, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v1, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    :goto_0
    return-wide v2

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    const-wide/16 v2, -0x1

    goto :goto_0
.end method

.method public static getTrialLimits(Ljava/io/File;)Lmiui/drm/DrmManager$TrialLimits;
    .locals 6

    const/4 v1, 0x0

    invoke-static {p0}, Lmiui/drm/DrmManager;->parseRightsFile(Ljava/io/File;)Lmiui/drm/DrmManager$RightObject;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lmiui/drm/DrmManager$TrialLimits;

    iget-wide v2, v0, Lmiui/drm/DrmManager$RightObject;->startTime:J

    iget-wide v4, v0, Lmiui/drm/DrmManager$RightObject;->endTime:J

    invoke-direct {v1, v2, v3, v4, v5}, Lmiui/drm/DrmManager$TrialLimits;-><init>(JJ)V

    return-object v1

    :cond_0
    return-object v1
.end method

.method public static isLegal(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)Lmiui/drm/DrmManager$DrmResult;
    .locals 2

    sget-object v0, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    return-object v0

    invoke-static {p1}, Lmiui/util/HashUtils;->getSHA1(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lmiui/drm/DrmManager;->isLegal(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Lmiui/drm/DrmManager$DrmResult;

    move-result-object v1

    return-object v1
.end method

.method public static isLegal(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Lmiui/drm/DrmManager$DrmResult;
    .locals 10

    sget-object v0, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    return-object v0

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    sget-object v4, Lmiui/drm/DrmManager$DrmResult;->DRM_ERROR_RIGHT_FILE_NOT_EXISTS:Lmiui/drm/DrmManager$DrmResult;

    return-object v4

    :cond_0
    sget-object v1, Lmiui/drm/DrmManager$DrmResult;->DRM_ERROR_UNKNOWN:Lmiui/drm/DrmManager$DrmResult;

    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {p2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v5

    const/4 v4, 0x0

    array-length v6, v5

    :goto_0
    if-ge v4, v6, :cond_2

    aget-object v0, v5, v4

    const-string/jumbo v7, "drm"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "checking asset "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " with "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Lmiui/drm/DrmManager;->parseRightsFile(Ljava/io/File;)Lmiui/drm/DrmManager$RightObject;

    move-result-object v2

    invoke-static {p0, p1, v2}, Lmiui/drm/DrmManager;->isLegal(Landroid/content/Context;Ljava/lang/String;Lmiui/drm/DrmManager$RightObject;)Lmiui/drm/DrmManager$DrmResult;

    move-result-object v3

    sget-object v7, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    if-ne v3, v7, :cond_1

    sget-object v4, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    return-object v4

    :cond_1
    invoke-static {v1, v3}, Lmiui/drm/DrmManager;->getMorePreciseDrmResult(Lmiui/drm/DrmManager$DrmResult;Lmiui/drm/DrmManager$DrmResult;)Lmiui/drm/DrmManager$DrmResult;

    move-result-object v1

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    return-object v1

    :cond_3
    const-string/jumbo v4, "drm"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "checking asset "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " with "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p2}, Lmiui/drm/DrmManager;->parseRightsFile(Ljava/io/File;)Lmiui/drm/DrmManager$RightObject;

    move-result-object v2

    invoke-static {p0, p1, v2}, Lmiui/drm/DrmManager;->isLegal(Landroid/content/Context;Ljava/lang/String;Lmiui/drm/DrmManager$RightObject;)Lmiui/drm/DrmManager$DrmResult;

    move-result-object v4

    return-object v4
.end method

.method private static isLegal(Landroid/content/Context;Ljava/lang/String;Lmiui/drm/DrmManager$RightObject;)Lmiui/drm/DrmManager$DrmResult;
    .locals 16

    sget-object v0, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    return-object v0

    if-nez p2, :cond_0

    sget-object v11, Lmiui/drm/DrmManager$DrmResult;->DRM_ERROR_RIGHT_OBJECT_IS_NULL:Lmiui/drm/DrmManager$DrmResult;

    return-object v11

    :cond_0
    move-object/from16 v0, p2

    iget-wide v12, v0, Lmiui/drm/DrmManager$RightObject;->startTime:J

    const-wide/16 v14, 0x0

    cmp-long v11, v12, v14

    if-ltz v11, :cond_1

    move-object/from16 v0, p2

    iget-wide v12, v0, Lmiui/drm/DrmManager$RightObject;->endTime:J

    const-wide/16 v14, 0x0

    cmp-long v11, v12, v14

    if-gez v11, :cond_2

    :cond_1
    sget-object v11, Lmiui/drm/DrmManager$DrmResult;->DRM_ERROR_TIME_NOT_MATCH:Lmiui/drm/DrmManager$DrmResult;

    return-object v11

    :cond_2
    move-object/from16 v0, p2

    iget-wide v12, v0, Lmiui/drm/DrmManager$RightObject;->endTime:J

    const-wide/16 v14, 0x0

    cmp-long v11, v12, v14

    if-lez v11, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    move-object/from16 v0, p2

    iget-wide v12, v0, Lmiui/drm/DrmManager$RightObject;->startTime:J

    cmp-long v11, v4, v12

    if-ltz v11, :cond_3

    move-object/from16 v0, p2

    iget-wide v12, v0, Lmiui/drm/DrmManager$RightObject;->endTime:J

    cmp-long v11, v4, v12

    if-lez v11, :cond_4

    :cond_3
    sget-object v11, Lmiui/drm/DrmManager$DrmResult;->DRM_ERROR_TIME_NOT_MATCH:Lmiui/drm/DrmManager$DrmResult;

    return-object v11

    :cond_4
    const/4 v8, 0x0

    move-object/from16 v0, p2

    iget-object v11, v0, Lmiui/drm/DrmManager$RightObject;->assets:Ljava/util/List;

    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    const/4 v8, 0x1

    :cond_6
    if-nez v8, :cond_7

    const-string/jumbo v11, "drm"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "right object has no definition for asset "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lmiui/drm/DrmManager;->exportFatalLog(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v11, Lmiui/drm/DrmManager$DrmResult;->DRM_ERROR_ASSET_NOT_MATCH:Lmiui/drm/DrmManager$DrmResult;

    return-object v11

    :cond_7
    move-object/from16 v0, p2

    iget-object v11, v0, Lmiui/drm/DrmManager$RightObject;->imeis:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-nez v11, :cond_8

    const-string/jumbo v11, "drm"

    const-string/jumbo v12, "right object does not have any imeis"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v11, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    return-object v11

    :cond_8
    invoke-static/range {p0 .. p0}, Lmiui/drm/DrmManager;->getOriginImei(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-static/range {p0 .. p0}, Lmiui/drm/DrmManager;->getEncodedImei(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_c

    const-string/jumbo v11, "drm"

    const-string/jumbo v12, "the imei retrieved is empty"

    invoke-static {v11, v12}, Lmiui/drm/DrmManager;->exportFatalLog(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    :goto_0
    move-object/from16 v0, p2

    iget-object v11, v0, Lmiui/drm/DrmManager$RightObject;->imeis:Ljava/util/List;

    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_a
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_d

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_b

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_b

    const-string/jumbo v11, "-1"

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_a

    :cond_b
    const-string/jumbo v11, "drm"

    const-string/jumbo v12, "right object has matched imei"

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v11, Lmiui/drm/DrmManager$DrmResult;->DRM_SUCCESS:Lmiui/drm/DrmManager$DrmResult;

    return-object v11

    :cond_c
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_9

    const-string/jumbo v11, "drm"

    const-string/jumbo v12, "the imei encoded is empty"

    invoke-static {v11, v12}, Lmiui/drm/DrmManager;->exportFatalLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_d
    const-string/jumbo v11, "drm"

    const-string/jumbo v12, "right object does not have matched imei"

    invoke-static {v11, v12}, Lmiui/drm/DrmManager;->exportFatalLog(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v11, Lmiui/drm/DrmManager$DrmResult;->DRM_ERROR_IMEI_NOT_MATCH:Lmiui/drm/DrmManager$DrmResult;

    return-object v11
.end method

.method public static isPermanentRights(Ljava/io/File;)Z
    .locals 1

    const/4 v0, 0x1

    return v0

    invoke-static {p0}, Lmiui/drm/DrmManager;->parseRightsFile(Ljava/io/File;)Lmiui/drm/DrmManager$RightObject;

    move-result-object v0

    invoke-static {v0}, Lmiui/drm/DrmManager;->isPermanentRights(Lmiui/drm/DrmManager$RightObject;)Z

    move-result v0

    return v0
.end method

.method private static isPermanentRights(Lmiui/drm/DrmManager$RightObject;)Z
    .locals 6

    const/4 v0, 0x1

    return v0

    const-wide/16 v4, 0x0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    iget-wide v2, p0, Lmiui/drm/DrmManager$RightObject;->startTime:J

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    iget-wide v2, p0, Lmiui/drm/DrmManager$RightObject;->endTime:J

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private static isRightsFileLegal(Ljava/io/File;)Z
    .locals 17

    const/4 v9, 0x0

    :try_start_0
    new-instance v10, Ljava/io/BufferedReader;

    new-instance v15, Ljava/io/FileReader;

    move-object/from16 v0, p0

    invoke-direct {v15, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v10, v15}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v10}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_8
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catch_0
    move-exception v4

    move-object v9, v10

    :goto_1
    :try_start_2
    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v9, :cond_0

    :try_start_3
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5

    :cond_0
    :goto_2
    const/4 v15, 0x0

    return v15

    :cond_1
    :try_start_4
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v2, 0x0

    const/4 v13, 0x0

    const/4 v8, 0x0

    const/4 v7, 0x0

    const/4 v14, -0x1

    const/4 v6, -0x1

    const-string/jumbo v15, "<o-ex:rights.*?>"

    invoke-static {v15}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v15

    if-eqz v15, :cond_2

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->end()I

    move-result v14

    const-string/jumbo v15, "</o-ex:rights>"

    invoke-virtual {v3, v15}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v6

    :cond_2
    const/4 v15, -0x1

    if-eq v14, v15, :cond_3

    const/4 v15, -0x1

    if-eq v6, v15, :cond_3

    invoke-virtual {v3, v14, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :cond_3
    const-string/jumbo v15, "<o-ex:rights.*?o-ex:id=\""

    invoke-static {v15}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v15

    if-eqz v15, :cond_4

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->end()I

    move-result v14

    :cond_4
    const-string/jumbo v15, "<o-ex:rights.*?o-ex:id=\".*?\""

    invoke-static {v15}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->find()Z

    move-result v15

    if-eqz v15, :cond_5

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->end()I

    move-result v15

    add-int/lit8 v6, v15, -0x1

    :cond_5
    const/4 v15, -0x1

    if-eq v14, v15, :cond_6

    const/4 v15, -0x1

    if-eq v6, v15, :cond_6

    invoke-virtual {v3, v14, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    :cond_6
    if-eqz v2, :cond_8

    if-eqz v13, :cond_8

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v13}, Lmiui/drm/DrmManager;->convertHexStringToBytes(Ljava/lang/String;)[B

    move-result-object v12

    const-string/jumbo v15, "a2ebd07cfae9a72345fc3c95d80cf5a21a55bf553fbab3025c82747ba4d53d1f9b02f46c20b5520585a910732698b165f0ecf7bd9ce5402e27c646cd0c5d34cff92b184d6a477e156a7d3503b756cc3e8531fb26c0da0ca051ab531c7f9f2a040a06642cadb698882c048630030b73edbbd62da73f7027065443c6e2558edfbd"

    const-string/jumbo v16, "10001"

    invoke-static/range {v15 .. v16}, Lmiui/util/RSAUtils;->getPublicKey(Ljava/lang/String;Ljava/lang/String;)Ljava/security/PublicKey;

    move-result-object v15

    invoke-static {v1, v15, v12}, Lmiui/util/RSAUtils;->verify([BLjava/security/PublicKey;[B)Z
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_8
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-result v15

    if-eqz v10, :cond_7

    :try_start_5
    invoke-virtual {v10}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    :cond_7
    :goto_3
    return v15

    :catch_1
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_3

    :cond_8
    if-eqz v10, :cond_9

    :try_start_6
    invoke-virtual {v10}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    :cond_9
    :goto_4
    move-object v9, v10

    goto/16 :goto_2

    :catch_2
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_4

    :catch_3
    move-exception v5

    :goto_5
    :try_start_7
    invoke-virtual {v5}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    if-eqz v9, :cond_0

    :try_start_8
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    goto/16 :goto_2

    :catch_4
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    goto/16 :goto_2

    :catch_5
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    goto/16 :goto_2

    :catchall_0
    move-exception v15

    :goto_6
    if-eqz v9, :cond_a

    :try_start_9
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    :cond_a
    :goto_7
    throw v15

    :catch_6
    move-exception v4

    invoke-virtual {v4}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_7

    :catchall_1
    move-exception v15

    move-object v9, v10

    goto :goto_6

    :catch_7
    move-exception v4

    goto/16 :goto_1

    :catch_8
    move-exception v5

    move-object v9, v10

    goto :goto_5
.end method

.method public static isSupportAd(Landroid/content/Context;)Z
    .locals 3

    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string/jumbo v2, "support_ad"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public static isSupportAd(Ljava/io/File;)Z
    .locals 2

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p0}, Lmiui/drm/DrmManager;->parseRightsFile(Ljava/io/File;)Lmiui/drm/DrmManager$RightObject;

    move-result-object v0

    iget-boolean v1, v0, Lmiui/drm/DrmManager$RightObject;->adSupport:Z

    return v1

    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method private static parseRightsFile(Ljava/io/File;)Lmiui/drm/DrmManager$RightObject;
    .locals 30

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v19

    sget-object v25, Lmiui/drm/DrmManager;->mRightsCache:Ljava/util/Map;

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lmiui/drm/DrmManager$RightObjectCache;

    if-eqz v6, :cond_0

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->lastModified()J

    move-result-wide v26

    iget-wide v0, v6, Lmiui/drm/DrmManager$RightObjectCache;->lastModified:J

    move-wide/from16 v28, v0

    cmp-long v25, v26, v28

    if-nez v25, :cond_0

    iget-object v0, v6, Lmiui/drm/DrmManager$RightObjectCache;->ro:Lmiui/drm/DrmManager$RightObject;

    move-object/from16 v25, v0

    return-object v25

    :cond_0
    invoke-static/range {p0 .. p0}, Lmiui/drm/DrmManager;->isRightsFileLegal(Ljava/io/File;)Z

    move-result v25

    if-nez v25, :cond_1

    const/16 v25, 0x0

    return-object v25

    :cond_1
    new-instance v20, Lmiui/drm/DrmManager$RightObject;

    const/16 v25, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lmiui/drm/DrmManager$RightObject;-><init>(Lmiui/drm/DrmManager$RightObject;)V

    new-instance v6, Lmiui/drm/DrmManager$RightObjectCache;

    const/16 v25, 0x0

    move-object/from16 v0, v25

    invoke-direct {v6, v0}, Lmiui/drm/DrmManager$RightObjectCache;-><init>(Lmiui/drm/DrmManager$RightObjectCache;)V

    move-object/from16 v0, v20

    iput-object v0, v6, Lmiui/drm/DrmManager$RightObjectCache;->ro:Lmiui/drm/DrmManager$RightObject;

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->lastModified()J

    move-result-wide v26

    move-wide/from16 v0, v26

    iput-wide v0, v6, Lmiui/drm/DrmManager$RightObjectCache;->lastModified:J

    sget-object v25, Lmiui/drm/DrmManager;->mRightsCache:Ljava/util/Map;

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-interface {v0, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v15

    const/16 v25, 0x1

    move/from16 v0, v25

    invoke-virtual {v15, v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    invoke-virtual {v15}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object v9

    invoke-static {}, Ljavax/xml/xpath/XPathFactory;->newInstance()Ljavax/xml/xpath/XPathFactory;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljavax/xml/xpath/XPathFactory;->newXPath()Ljavax/xml/xpath/XPath;

    move-result-object v23

    new-instance v25, Lmiui/drm/DrmManager$DrmNSContext;

    const/16 v26, 0x0

    invoke-direct/range {v25 .. v26}, Lmiui/drm/DrmManager$DrmNSContext;-><init>(Lmiui/drm/DrmManager$DrmNSContext;)V

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Ljavax/xml/xpath/XPath;->setNamespaceContext(Ljavax/xml/namespace/NamespaceContext;)V

    const-string/jumbo v25, "/o-ex:rights/o-ex:agreement/o-ex:asset/o-ex:context/o-dd:uid"

    sget-object v26, Ljavax/xml/xpath/XPathConstants;->NODESET:Ljavax/xml/namespace/QName;

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-interface {v0, v1, v9, v2}, Ljavax/xml/xpath/XPath;->evaluate(Ljava/lang/String;Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/w3c/dom/NodeList;

    if-eqz v4, :cond_5

    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v25

    if-lez v25, :cond_5

    const/16 v16, 0x0

    :goto_0
    invoke-interface {v4}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v25

    move/from16 v0, v16

    move/from16 v1, v25

    if-ge v0, v1, :cond_5

    move/from16 v0, v16

    invoke-interface {v4, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v25

    check-cast v25, Lorg/w3c/dom/Element;

    invoke-interface/range {v25 .. v25}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v25, ":"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v25, v0

    const/16 v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_3

    move-object/from16 v0, v20

    iget-object v0, v0, Lmiui/drm/DrmManager$RightObject;->assets:Ljava/util/List;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aget-object v26, v18, v26

    const-string/jumbo v27, ","

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v26 .. v26}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v26

    invoke-interface/range {v25 .. v26}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_2
    :goto_1
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    :cond_3
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v25, v0

    const/16 v26, 0x2

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_2

    move-object/from16 v0, v20

    iget-object v0, v0, Lmiui/drm/DrmManager$RightObject;->assets:Ljava/util/List;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aget-object v26, v18, v26

    invoke-interface/range {v25 .. v26}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, v20

    iget-object v0, v0, Lmiui/drm/DrmManager$RightObject;->assets:Ljava/util/List;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    aget-object v26, v18, v26

    const-string/jumbo v27, ","

    invoke-virtual/range {v26 .. v27}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v26 .. v26}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v26

    invoke-interface/range {v25 .. v26}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/xml/xpath/XPathExpressionException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_3

    goto :goto_1

    :catch_0
    move-exception v12

    invoke-virtual {v12}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_4
    :goto_2
    return-object v20

    :cond_5
    :try_start_1
    const-string/jumbo v25, "/o-ex:rights/o-ex:agreement/o-ex:permission/o-dd:execute/o-ex:constraint/oma-dd:individual/o-ex:context/o-dd:uid"

    sget-object v26, Ljavax/xml/xpath/XPathConstants;->NODESET:Ljavax/xml/namespace/QName;

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-interface {v0, v1, v9, v2}, Ljavax/xml/xpath/XPath;->evaluate(Ljava/lang/String;Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/w3c/dom/NodeList;

    if-eqz v17, :cond_8

    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v25

    if-lez v25, :cond_8

    const/16 v16, 0x0

    :goto_3
    invoke-interface/range {v17 .. v17}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v25

    move/from16 v0, v16

    move/from16 v1, v25

    if-ge v0, v1, :cond_8

    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v25

    check-cast v25, Lorg/w3c/dom/Element;

    invoke-interface/range {v25 .. v25}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v25, "d"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_7

    move-object/from16 v0, v20

    iget-object v0, v0, Lmiui/drm/DrmManager$RightObject;->imeis:Ljava/util/List;

    move-object/from16 v25, v0

    const-string/jumbo v26, "d"

    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->length()I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v26

    invoke-interface/range {v25 .. v26}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    :goto_4
    add-int/lit8 v16, v16, 0x1

    goto :goto_3

    :cond_7
    const-string/jumbo v25, "m"

    move-object/from16 v0, v25

    invoke-virtual {v7, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v25

    if-eqz v25, :cond_6

    move-object/from16 v0, v20

    iget-object v0, v0, Lmiui/drm/DrmManager$RightObject;->users:Ljava/util/List;

    move-object/from16 v25, v0

    const-string/jumbo v26, "m"

    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->length()I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v26

    invoke-interface/range {v25 .. v26}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljavax/xml/xpath/XPathExpressionException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_3

    goto :goto_4

    :catch_1
    move-exception v14

    invoke-virtual {v14}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_2

    :cond_8
    :try_start_2
    const-string/jumbo v25, "/o-ex:rights/o-ex:agreement/o-ex:permission/o-dd:execute/o-ex:constraint/o-dd:datetime/o-dd:start"

    sget-object v26, Ljavax/xml/xpath/XPathConstants;->NODESET:Ljavax/xml/namespace/QName;

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-interface {v0, v1, v9, v2}, Ljavax/xml/xpath/XPath;->evaluate(Ljava/lang/String;Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lorg/w3c/dom/NodeList;

    if-eqz v22, :cond_9

    invoke-interface/range {v22 .. v22}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v25

    if-lez v25, :cond_9

    const/16 v25, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v25

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v25

    check-cast v25, Lorg/w3c/dom/Element;

    invoke-interface/range {v25 .. v25}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lmiui/drm/DrmManager;->getTime(Ljava/lang/String;)J

    move-result-wide v26

    move-wide/from16 v0, v26

    move-object/from16 v2, v20

    iput-wide v0, v2, Lmiui/drm/DrmManager$RightObject;->startTime:J

    :cond_9
    const-string/jumbo v25, "/o-ex:rights/o-ex:agreement/o-ex:permission/o-dd:execute/o-ex:constraint/o-dd:datetime/o-dd:end"

    sget-object v26, Ljavax/xml/xpath/XPathConstants;->NODESET:Ljavax/xml/namespace/QName;

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-interface {v0, v1, v9, v2}, Ljavax/xml/xpath/XPath;->evaluate(Ljava/lang/String;Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lorg/w3c/dom/NodeList;

    if-eqz v21, :cond_a

    invoke-interface/range {v21 .. v21}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v25

    if-lez v25, :cond_a

    const/16 v25, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v25

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v25

    check-cast v25, Lorg/w3c/dom/Element;

    invoke-interface/range {v25 .. v25}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lmiui/drm/DrmManager;->getTime(Ljava/lang/String;)J

    move-result-wide v26

    move-wide/from16 v0, v26

    move-object/from16 v2, v20

    iput-wide v0, v2, Lmiui/drm/DrmManager$RightObject;->endTime:J

    :cond_a
    const-string/jumbo v25, "/o-ex:rights/o-ex:agreement/o-ex:permission/o-dd:display/o-ex:constraint/o-dd:count"

    sget-object v26, Ljavax/xml/xpath/XPathConstants;->NODESET:Ljavax/xml/namespace/QName;

    move-object/from16 v0, v23

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-interface {v0, v1, v9, v2}, Ljavax/xml/xpath/XPath;->evaluate(Ljava/lang/String;Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/w3c/dom/NodeList;

    if-eqz v8, :cond_4

    invoke-interface {v8}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v25

    if-lez v25, :cond_4

    const/16 v25, 0x0

    move/from16 v0, v25

    invoke-interface {v8, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v25

    check-cast v25, Lorg/w3c/dom/Element;

    invoke-interface/range {v25 .. v25}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Integer;->intValue()I

    move-result v25

    if-lez v25, :cond_b

    const/16 v25, 0x1

    :goto_5
    move/from16 v0, v25

    move-object/from16 v1, v20

    iput-boolean v0, v1, Lmiui/drm/DrmManager$RightObject;->adSupport:Z
    :try_end_2
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljavax/xml/xpath/XPathExpressionException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_3

    goto/16 :goto_2

    :catch_2
    move-exception v10

    invoke-virtual {v10}, Ljava/lang/Throwable;->printStackTrace()V

    goto/16 :goto_2

    :cond_b
    const/16 v25, 0x0

    goto :goto_5

    :catch_3
    move-exception v11

    invoke-virtual {v11}, Ljava/lang/Throwable;->printStackTrace()V

    goto/16 :goto_2

    :catch_4
    move-exception v13

    invoke-virtual {v13}, Ljavax/xml/xpath/XPathException;->printStackTrace()V

    goto/16 :goto_2
.end method

.method public static setSupportAd(Landroid/content/Context;Z)V
    .locals 3

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string/jumbo v2, "support_ad"

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
