Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp214538ywb;
        Tue, 19 Mar 2019 20:24:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxK8lHVyUwb2REX/o6A7WBgBjoNxOau3wcFYYs+TawVUvKaCVoVRuheiNDahDfZMagRngL3
X-Received: by 2002:a17:902:a511:: with SMTP id s17mr5993803plq.262.1553052271362;
        Tue, 19 Mar 2019 20:24:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553052271; cv=none;
        d=google.com; s=arc-20160816;
        b=ZdRsnBU4MLSA3zCARRxe3R0TEjJAUcKGmOzct9kQUs/ujiyR1+KvI3judcymiG6CuY
         yqI6YOhQGPlxFFaixggXw0iyjSKfIHYy9CTjRLci53iP59B4k85eBvQOrle6BMN8139+
         MP/CGvQYokdoLCe4gznrcnx3zP5oC7i5xAC1LV2FYNAUP3z46aeGWTptuMj+6qR4GWU7
         17Y140QwAc22zTTZPBDIRk4Fn973JWl6o91/iocUgasxD/5H1fEAPXtXQLcOfLzTsODa
         nmiYfPSgFKBlDNeSVc6IzmUqYtWAHKAoJhLOV0c1fRe7nAhqjpYeoZ4f19ORQJUP3Rdb
         Zvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=eebpC6BXdERHaXscb03zULxyEV9jXDDf4Ec/Iw5FtpQ=;
        b=M5n/CI/b31RJaofhNWpqjAaXvMLt9izgBwPJWDrt2DCyxafCeJ2eeLfp1kZwd53maz
         p9BZL2myX9A1FiOmucB+OnqVtfe2lvQfNIkUQ/xJbocPZ0EKIAXd77CPSQsDuMjAuBur
         WhuZX+woc/e34ut2TRxPobdjsyL32IjemjZdIHB8eAfZ+pM3aSWNXHKaD8IQumjx29my
         vVof8d2X93YECd4XOPH7F/tUHYWbCPaXbef5/ahOeFQnJ1vgrQ2o31FLg5289EjZ3/Ux
         SFPcAoTT41TJQpmDjSlRaJFK/ZFEz7bg/fqxD0TZPaG9sszvmPKk9F1bAg2BkIW7M8Nc
         SRCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id k29si616885pgb.267.2019.03.19.20.24.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 20:24:31 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023B48992E;
	Wed, 20 Mar 2019 03:24:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1863889861
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 03:24:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 20:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,246,1549958400"; d="scan'208";a="215707797"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by orsmga001.jf.intel.com with ESMTP; 19 Mar 2019 20:24:27 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 6/6] drm/i915/gvt: Explicit cast to same type size before
 bitwise operation.
Date: Wed, 20 Mar 2019 11:21:30 +0800
Message-Id: <20190320032130.9817-7-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320032130.9817-1-colin.xu@intel.com>
References: <20190320032130.9817-1-colin.xu@intel.com>
MIME-Version: 1.0
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aW50ZWxfZGV2aWNlX2luZm8tPmVuZ2luZV9tYXNrIGlzIHU4IGJ1dCBlbmdpbmVfbWFzayBpcyB1
bnNpZ25lZCBpbnQuCkNhc3QgdG8gc2FtZSB0eXBlIGJlZm9yZSBiaXR3aXNlIG9wZXJhdGlvbi4K
ClNpZ25lZC1vZmYtYnk6IENvbGluIFh1IDxjb2xpbi54dUBpbnRlbC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9oYW5kbGVycy5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJz
LmMKaW5kZXggNjM0MThjODFlZjE0Li4yNjY2NWI5YzdiMDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9oYW5kbGVycy5jCkBAIC0zMTEsNiArMzExLDcgQEAgc3RhdGljIGludCBtdWxfZm9yY2Vfd2Fr
ZV93cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwKIHN0YXRpYyBpbnQgZ2Ryc3RfbW1pb193
cml0ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50IG9mZnNldCwKIAkJCSAg
ICB2b2lkICpwX2RhdGEsIHVuc2lnbmVkIGludCBieXRlcykKIHsKKwl1bnNpZ25lZCBpbnQgZW5n
aW5lX2NhcHMgPSBJTlRFTF9JTkZPKHZncHUtPmd2dC0+ZGV2X3ByaXYpLT5lbmdpbmVfbWFzazsK
IAl1bnNpZ25lZCBpbnQgZW5naW5lX21hc2sgPSAwOwogCXUzMiBkYXRhOwogCkBAIC0zNDEsNyAr
MzQyLDcgQEAgc3RhdGljIGludCBnZHJzdF9tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2
Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogCQkJZ3Z0X2RiZ19tbWlvKCJ2Z3B1JWQ6IHJlcXVl
c3QgVkNTMiBSZXNldFxuIiwgdmdwdS0+aWQpOwogCQkJZW5naW5lX21hc2sgfD0gQklUKFZDUzEp
OwogCQl9Ci0JCWVuZ2luZV9tYXNrICY9IElOVEVMX0lORk8odmdwdS0+Z3Z0LT5kZXZfcHJpdikt
PmVuZ2luZV9tYXNrOworCQllbmdpbmVfbWFzayAmPSAodW5zaWduZWQgaW50KWVuZ2luZV9jYXBz
OwogCX0KIAogCS8qIHZncHVfbG9jayBhbHJlYWR5IGhvbGQgYnkgZW11bGF0ZSBtbWlvIHIvdyAq
LwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ludGVsLWd2dC1kZXY=
