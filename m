Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp4184990ywa;
        Wed, 20 Feb 2019 00:25:03 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYKEiU7aMnlbUwfFPAmfBi6ta942q5VUgRhU50ikY1bZmgdN239pJpuSO2Lrd73u260EOPJ
X-Received: by 2002:a17:902:27e6:: with SMTP id i35mr35040367plg.222.1550651103057;
        Wed, 20 Feb 2019 00:25:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550651103; cv=none;
        d=google.com; s=arc-20160816;
        b=M6DSlldzr9Rt9ufo24NibHhYWGb7mVpi/ANSQHCRNAnJInm5yuEYfftyTaDCA+b8NL
         WIZ4t7MxvdGlCJuZix+Nj0e83KzgHFUjTEMTL7L7eDYkjsCbk3VG1hogEeIUlk0XHqq0
         PRshHddAEeG6B2DmVYG7J7LRsflSvC2toB1MmCE/6PcPGFoGbV2/gV3bQ0V09QrMHuLd
         CBx/oBGR5ABsK92TJ+zauPJwV5zggMum1wzO/74S3UQW9iBSrOwJcXyajyKHD0xX7qmz
         1u3DscSRoN2EFRe7VaA64Wf60K7XUELtDJMPvcwNXRKaSUrLtljsjyGRO+3h4satI1m4
         mr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=xAmdbJgjRyBh0wVuhoV+ECVHXApwc269sV/guzTiby0=;
        b=rNuawk2wc4dw7hCAwQRFdBDsbNLi1h9ESipnZXmI3n7R0VWxsCw5KXP7WQfcc6xMWC
         qsUhRLvW1Nle43CZDmXGFAaxtTYTPLsaP+G/WGT5v8Wuiw3YqETbK9LbYomfZEau5611
         r8Z2YMhgPrtsyqWVeq94FGlnFNeZZwV289Ko/U6G11jz9vSWACqUkAvTayrw2ED5QyFf
         o3VfwDfwlngm+rSYbLDbis0PMldUAkHICi9NT8VU/mmJY2c418n0cMhVkwWv4+J5XEdP
         9n31E32C/R9mG6cWLSE6IlmGtkXk3OxcbBi5qEjYR+OIH/Jo+lUCG9R3fViO0UzaVcEq
         xnpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id v9si16679460pgb.170.2019.02.20.00.25.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Feb 2019 00:25:03 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28889891EB;
	Wed, 20 Feb 2019 08:25:02 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F27891EB
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Feb 2019 08:25:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2019 00:25:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,390,1544515200"; d="scan'208";a="127827966"
Received: from debian-skl.sh.intel.com ([10.239.13.15])
 by orsmga003.jf.intel.com with ESMTP; 20 Feb 2019 00:24:58 -0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: Fix MI_FLUSH_DW parsing with correct index
 check
Date: Wed, 20 Feb 2019 16:25:04 +0800
Message-Id: <20190220082504.15132-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190218064653.26020-1-zhenyuw@linux.intel.com>
References: <20190218064653.26020-1-zhenyuw@linux.intel.com>
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
Cc: "Zhao, Yan Y" <yan.y.zhao@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

V2hlbiBNSV9GTFVTSF9EVyBwb3N0IHdyaXRlIGh3IHN0YXR1cyBwYWdlIGluIGluZGV4IG1vZGUs
IHRoZSBpbmRleAp2YWx1ZSBpcyBpbiBkd29yZCBzdGVwIGFuZCB0dXJuZWQgaW50byBhZGRyZXNz
IG9mZnNldCBpbiBjbWQgZHdvcmQxLgpBcyBzdGF0dXMgcGFnZSBzaXplIGlzIDRLLCBzbyBjYW4n
dCBleGNlZWQgdGhhdC4KClRoaXMgZml4ZWQgdXBwZXIgYm91bmQgY2hlY2sgaW4gY21kIHBhcnNl
ciBjb2RlIHdoaWNoIGluY29ycmVjdGx5CnN0b3BwZWQgVk0gZm9yIHJlYXNvbiBvZiBpbnZhbGlk
IE1JX0ZMVVNIX0RXIHdyaXRlIGluZGV4LgoKdjI6Ci0gRml4IHVwcGVyIGJvdW5kIGFzIDRLIHBh
Z2Ugc2l6ZSBiZWNhdXNlIGluZGV4IHZhbHVlIGlzIGFkZHJlc3Mgb2Zmc2V0LgoKRml4ZXM6IGJl
MWRhNzA3MGFlYSAoImRybS9pOTE1L2d2dDogdkdQVSBjb21tYW5kIHNjYW5uZXIiKQpDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZyAjIHY0LjEwKwpDYzogIlpoYW8sIFlhbiBZIiA8eWFuLnkuemhh
b0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFpoZW55dSBXYW5nIDx6aGVueXV3QGxpbnV4Lmlu
dGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKaW5kZXggMzViNGVjM2Y3NjE4Li4zNTkyZDA0YzMz
YjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwpAQCAtMTQ0MSw3ICsxNDQx
LDcgQEAgc3RhdGljIGlubGluZSBpbnQgY21kX2FkZHJlc3NfYXVkaXQoc3RydWN0IHBhcnNlcl9l
eGVjX3N0YXRlICpzLAogCX0KIAogCWlmIChpbmRleF9tb2RlKQl7Ci0JCWlmIChndWVzdF9nbWEg
Pj0gSTkxNV9HVFRfUEFHRV9TSVpFIC8gc2l6ZW9mKHU2NCkpIHsKKwkJaWYgKGd1ZXN0X2dtYSA+
PSBJOTE1X0dUVF9QQUdFX1NJWkUpIHsKIAkJCXJldCA9IC1FRkFVTFQ7CiAJCQlnb3RvIGVycjsK
IAkJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXY=
