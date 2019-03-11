Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp930410ywb;
        Sun, 10 Mar 2019 18:47:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2sr3QOIOoDluYAtyE/K/UQ4Q0J3loCDrvFl6lqiQZEWmD4FJVEdZA5pSX1AYnI+1Zd9m6
X-Received: by 2002:a17:902:ba8d:: with SMTP id k13mr31730151pls.15.1552268867547;
        Sun, 10 Mar 2019 18:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552268867; cv=none;
        d=google.com; s=arc-20160816;
        b=S5wK5tt4GkwLYY2ZGI0sH2gynSRjpkLSP2t5xjjYuVAQBDG4vbuqXJD8er3gTG7Mdj
         anPb9easSSzHRP/iQdydWeMQDtwGBl4+kj8DxJPu9h5LhPKXZBpprn+WytpEl+UiTgV1
         BlvIxMs5AN0FazHaok005EHiXolTzZizjHsSqh5Pvh63AExug3TFQn2pHWuZ85PxocKc
         Muk/AcNyFIdcySttCyTlgttUeI8AUegNkB+d6GHkGJUmbbLA0lDSHRODLDpuEVR2fbba
         ss6Xm2cT7Erca94XCQf3dxyhYL+fmIvkehDCCivrke79Db6dbrEJlAJHbG2YiZkRGCgH
         26oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=rLDXPdUeTkBs4SVT0VQ2rzHjzRVCCElAtfeXrefiJfA=;
        b=DUZqsMSMCVDpc89tajOgC0Wy3RCAkjqGpKlHAqHK6xgvQjYDi+q8cqnH0Lk8fFU1Xf
         SjBRcA9vnZ0NwLUed0OMNNujn9SyevZgl3CSauOO//2m1Syn0E/U/iI2yYBYnI8XqJbx
         hsZc/Qa5g74Fu2AUy1LBTH2RFVLP+scjdTEoeHZKcV1j+AH7ej+0EVLppcLub1FHQrAR
         EZ2Bgx1nt4Vhjp26W5EDhtqMKTD3o1iWVXabDS7BgIwoVy/NBfaNUEijoohl0DmJ3sBw
         5jJl0EGoLhn62HBDQ7vy6w0KdHC6poEK22+Qw6cjRKh+G0h/bTvyiS8vH6ccE2VOEJWa
         Ht3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 17si1005838pgy.154.2019.03.10.18.47.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2019 18:47:47 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289A7899B0;
	Mon, 11 Mar 2019 01:47:47 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F79899B0
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 11 Mar 2019 01:47:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2019 18:47:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,466,1544515200"; d="scan'208";a="306063507"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga005.jf.intel.com with ESMTP; 10 Mar 2019 18:47:44 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v5 2/2] drm/i915/gvt: code refine of lri cmd parser
Date: Sun, 10 Mar 2019 21:42:14 -0400
Message-Id: <20190311014214.14057-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190311014045.13977-1-yan.y.zhao@intel.com>
References: <20190311014045.13977-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

ZG8gbm90IGNyZWF0ZSBhIHNlcGFyYXRlIGZ1bmN0aW9uIGludGVsX3ZncHVfbWFza19tbWlvX3dy
aXRlKCkKYnV0IHVzZSBpbnRlbF92Z3B1X21taW9fcmVnX3J3KCkgZm9yIGNvbnNpc3RlbmN5LgoK
Rml4ZXM6CmNvbW1pdCA2Y2VmMjFhMTk2NDkgKCJkcm0vaTkxNS9ndnQ6IHVwZGF0ZSB2cmVnIG9u
IGluaGliaXQgY29udGV4dCBscmkKY29tbWFuZCIpCgp2NTogcmVtb3ZlIGludGVsX3ZncHVfbWFz
a19tbWlvX3dyaXRlIGluIG1taW8uaAp2NDogY2hlY2sgcmV0dXJuIHZhbHVlIG9mIGludGVsX3Zn
cHVfbW1pb19yZWdfcncoKQoKU2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50
ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMgfCAxMSAr
KysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgICB8IDI0IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW8uaCAg
ICAgICB8ICAyIC0tCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKaW5kZXggMzU5MmQwNGMz
M2IyLi4yNmE2YmZjNzA2NWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9j
bWRfcGFyc2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwpA
QCAtOTA5LDEzICs5MDksMTIgQEAgc3RhdGljIGludCBjbWRfcmVnX2hhbmRsZXIoc3RydWN0IHBh
cnNlcl9leGVjX3N0YXRlICpzLAogCQkJcy0+d29ya2xvYWQtPnJpbmdfY29udGV4dF9ncGEgKyAx
MiwgJmN0eF9zcl9jdGwsIDQpOwogCQkvKiBjaGVjayBpbmhpYml0IGNvbnRleHQgKi8KIAkJaWYg
KGN0eF9zcl9jdGwgJiAxKSB7CisJCQlpbnQgcmV0ID0gMDsKIAkJCXUzMiBkYXRhID0gY21kX3Zh
bChzLCBpbmRleCArIDEpOwotCi0JCQlpZiAoaW50ZWxfZ3Z0X21taW9faGFzX21vZGVfbWFzayhz
LT52Z3B1LT5ndnQsIG9mZnNldCkpCi0JCQkJaW50ZWxfdmdwdV9tYXNrX21taW9fd3JpdGUodmdw
dSwKLQkJCQkJCQlvZmZzZXQsICZkYXRhLCA0KTsKLQkJCWVsc2UKLQkJCQl2Z3B1X3ZyZWcodmdw
dSwgb2Zmc2V0KSA9IGRhdGE7CisJCQlyZXQgPSBpbnRlbF92Z3B1X21taW9fcmVnX3J3KHMtPnZn
cHUsIG9mZnNldCwKKwkJCQkJJmRhdGEsIDQsIGZhbHNlKTsKKwkJCWlmIChyZXQpCisJCQkJcmV0
dXJuIHJldDsKIAkJfQogCX0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwppbmRleCA1
NGJkMGIwMzMyOTguLjU0NTE1NGFmOTNlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2hhbmRsZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJz
LmMKQEAgLTM0MDEsMzAgKzM0MDEsNiBAQCBpbnQgaW50ZWxfdmdwdV9kZWZhdWx0X21taW9fd3Jp
dGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsCiAJcmV0dXJu
IDA7CiB9CiAKLS8qKgotICogaW50ZWxfdmdwdV9tYXNrX21taW9fd3JpdGUgLSB3cml0ZSBtYXNr
IHJlZ2lzdGVyCi0gKiBAdmdwdTogYSB2R1BVCi0gKiBAb2Zmc2V0OiBhY2Nlc3Mgb2Zmc2V0Ci0g
KiBAcF9kYXRhOiB3cml0ZSBkYXRhIGJ1ZmZlcgotICogQGJ5dGVzOiBhY2Nlc3MgZGF0YSBsZW5n
dGgKLSAqCi0gKiBSZXR1cm5zOgotICogWmVybyBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBj
b2RlIGlmIGZhaWxlZC4KLSAqLwotaW50IGludGVsX3ZncHVfbWFza19tbWlvX3dyaXRlKHN0cnVj
dCBpbnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAotCQl2b2lkICpwX2RhdGEs
IHVuc2lnbmVkIGludCBieXRlcykKLXsKLQl1MzIgbWFzaywgb2xkX3ZyZWc7Ci0KLQlvbGRfdnJl
ZyA9IHZncHVfdnJlZyh2Z3B1LCBvZmZzZXQpOwotCXdyaXRlX3ZyZWcodmdwdSwgb2Zmc2V0LCBw
X2RhdGEsIGJ5dGVzKTsKLQltYXNrID0gdmdwdV92cmVnKHZncHUsIG9mZnNldCkgPj4gMTY7Ci0J
dmdwdV92cmVnKHZncHUsIG9mZnNldCkgPSAob2xkX3ZyZWcgJiB+bWFzaykgfAotCQkJCSh2Z3B1
X3ZyZWcodmdwdSwgb2Zmc2V0KSAmIG1hc2spOwotCi0JcmV0dXJuIDA7Ci19Ci0KIC8qKgogICog
aW50ZWxfZ3Z0X2luX2ZvcmNlX25vbnByaXZfd2hpdGVsaXN0IC0gaWYgYSBtbWlvIGlzIGluIHdo
aXRlbGlzdCB0byBiZQogICogZm9yY2Utbm9wcml2IHJlZ2lzdGVyCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21t
aW8uaAppbmRleCA1ODc0ZjFjYjQzMDYuLjJhOGFlODg5ODI2NSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L21taW8uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
bW1pby5oCkBAIC0xMDAsNiArMTAwLDQgQEAgYm9vbCBpbnRlbF9ndnRfaW5fZm9yY2Vfbm9ucHJp
dl93aGl0ZWxpc3Qoc3RydWN0IGludGVsX2d2dCAqZ3Z0LAogaW50IGludGVsX3ZncHVfbW1pb19y
ZWdfcncoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsCiAJCQkg
ICB2b2lkICpwZGF0YSwgdW5zaWduZWQgaW50IGJ5dGVzLCBib29sIGlzX3JlYWQpOwogCi1pbnQg
aW50ZWxfdmdwdV9tYXNrX21taW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2ln
bmVkIGludCBvZmZzZXQsCi0JCQkJICB2b2lkICpwX2RhdGEsIHVuc2lnbmVkIGludCBieXRlcyk7
CiAjZW5kaWYKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pbnRlbC1ndnQtZGV2
