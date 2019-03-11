Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp1030414ywb;
        Sun, 10 Mar 2019 21:57:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzuGRZd68LZcL/riFSJ3UKpN4v4s9PVYdWKaQ9N178DbqaxTk/dbvT/IiLKVbMyrmk3rhmv
X-Received: by 2002:a65:4348:: with SMTP id k8mr28564389pgq.289.1552280251131;
        Sun, 10 Mar 2019 21:57:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552280251; cv=none;
        d=google.com; s=arc-20160816;
        b=J9L5pbEUXye2FOQn4w+GPf9f3HjWZ92PL4eQwWJw9eP5EQFqc36XWBabv5m1qq+9Ok
         VCEWFsWRVekKTYwduO8kiCmoprlr8zW5IVMmDbqw7hr/T+OZRoO9FM8yD9awpVxDFRyy
         20MfslM1nECFTu40OFr8BpdjhK+7I4uYtPVhU5YoAERWQpRYJkkdagtLipHZF+NOsuE5
         dlje1xbiUjwjQbeHzHxd3MSUJxW7kTuxLzgVBVb06TNRSvOImqD7jb7pQI+eztsTakYD
         2OPY3xvOnq/APVb/B9PMtut8dyBbUHmQltOIblcfuXyTpGsVh2bf/0wNCnpEL4XAEQFT
         tLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=JXpK0RY1JZel6qyg9NkM72TaWfcTzojfKwtCx9jT4IA=;
        b=ngfzybQIpSRV3XPumb9S6NaDm+gsZLwvqay8RgOFACkJFFCyOi8JDclYIvVvLBhoY2
         onVwZUFPzlUAcdGHRI42q9E9t6NYNlZiTAvuyGjKDfCiwTzZgOSqNhL7gdd5Ghrb3Yw8
         h30foZn2T0B4A7PAfIfPA/FAPc/Gx6n8qgz68BrGXAwzkZRNIZjIkjvziYkBZxK0H40A
         9FEv2RNAWgIMGVsMjO5YCq0ZFSxkiWes1SDymY46Dn+kwffynInb3IQIhdM8c8EMFKcu
         w8FBPs00X5J1lw8RoJPzTnMtmoQVMw369DuYcxGqezMThmjm0kabjhrJaLRcGW0xNBhj
         XxFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id n7si4256853pgp.400.2019.03.10.21.57.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2019 21:57:31 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FA589B00;
	Mon, 11 Mar 2019 04:57:30 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A4A89B00
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 11 Mar 2019 04:57:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2019 21:57:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,466,1544515200"; d="scan'208";a="125839519"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga006.jf.intel.com with ESMTP; 10 Mar 2019 21:57:27 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v6 2/2] drm/i915/gvt: call common mmio rw routine for vreg
 update in lri cmd parser
Date: Mon, 11 Mar 2019 00:52:00 -0400
Message-Id: <20190311045200.20014-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190311014214.14057-1-yan.y.zhao@intel.com>
References: <20190311014214.14057-1-yan.y.zhao@intel.com>
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

aW4gY21kIHBhcnNlciwgd2hlbiB0aGVyZSdzIGEgbmVlZCB0byB1cGRhdGUgdnJlZ3MgYWNjb3Jk
aW5nIHRvIGNvbW1hbmRzCmJlaW5nIHBhcnNlZCwKZG8gbm90IGNyZWF0ZSBhIHNlcGFyYXRlIGZ1
bmN0aW9uIGludGVsX3ZncHVfbWFza19tbWlvX3dyaXRlKCksCmJ1dCBjYWxsIGludGVsX3ZncHVf
bW1pb19yZWdfcncoKSB0byBrZWVwIGNvbnNpc3RlbnQgd2l0aCBoYW5kbGluZwpiZWhhdmlvciBm
b3IgQ1BVIHJlYWQvd3JpdGUgb2YgbW1pby4KClRoaXMgcGF0Y2ggaXMgYSBjb2RlIHJlZmluZW1l
bnQgdG8KY29tbWl0IDZjZWYyMWExOTY0OSAoImRybS9pOTE1L2d2dDogdXBkYXRlIHZyZWcgb24g
aW5oaWJpdCBjb250ZXh0IGxyaQpjb21tYW5kIikKCnY2OiB1cGRhdGUgY29tbWl0IG1lc3NhZ2Ug
KHpoZW55dSB3YW5nKQp2NTogcmVtb3ZlIGludGVsX3ZncHVfbWFza19tbWlvX3dyaXRlIGluIG1t
aW8uaAp2NDogY2hlY2sgcmV0dXJuIHZhbHVlIG9mIGludGVsX3ZncHVfbW1pb19yZWdfcncoKQoK
U2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMgfCAxMSArKysrKy0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgICB8IDI0IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW8uaCAgICAgICB8ICAyIC0tCiAzIGZp
bGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKaW5kZXggMzU5MmQwNGMzM2IyLi4yNmE2YmZjNzA2NWMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2VyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwpAQCAtOTA5LDEzICs5MDksMTIg
QEAgc3RhdGljIGludCBjbWRfcmVnX2hhbmRsZXIoc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpz
LAogCQkJcy0+d29ya2xvYWQtPnJpbmdfY29udGV4dF9ncGEgKyAxMiwgJmN0eF9zcl9jdGwsIDQp
OwogCQkvKiBjaGVjayBpbmhpYml0IGNvbnRleHQgKi8KIAkJaWYgKGN0eF9zcl9jdGwgJiAxKSB7
CisJCQlpbnQgcmV0ID0gMDsKIAkJCXUzMiBkYXRhID0gY21kX3ZhbChzLCBpbmRleCArIDEpOwot
Ci0JCQlpZiAoaW50ZWxfZ3Z0X21taW9faGFzX21vZGVfbWFzayhzLT52Z3B1LT5ndnQsIG9mZnNl
dCkpCi0JCQkJaW50ZWxfdmdwdV9tYXNrX21taW9fd3JpdGUodmdwdSwKLQkJCQkJCQlvZmZzZXQs
ICZkYXRhLCA0KTsKLQkJCWVsc2UKLQkJCQl2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0KSA9IGRhdGE7
CisJCQlyZXQgPSBpbnRlbF92Z3B1X21taW9fcmVnX3J3KHMtPnZncHUsIG9mZnNldCwKKwkJCQkJ
JmRhdGEsIDQsIGZhbHNlKTsKKwkJCWlmIChyZXQpCisJCQkJcmV0dXJuIHJldDsKIAkJfQogCX0K
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwppbmRleCA1NGJkMGIwMzMyOTguLjU0NTE1
NGFmOTNlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKQEAgLTM0MDEsMzAgKzM0
MDEsNiBAQCBpbnQgaW50ZWxfdmdwdV9kZWZhdWx0X21taW9fd3JpdGUoc3RydWN0IGludGVsX3Zn
cHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsCiAJcmV0dXJuIDA7CiB9CiAKLS8qKgotICog
aW50ZWxfdmdwdV9tYXNrX21taW9fd3JpdGUgLSB3cml0ZSBtYXNrIHJlZ2lzdGVyCi0gKiBAdmdw
dTogYSB2R1BVCi0gKiBAb2Zmc2V0OiBhY2Nlc3Mgb2Zmc2V0Ci0gKiBAcF9kYXRhOiB3cml0ZSBk
YXRhIGJ1ZmZlcgotICogQGJ5dGVzOiBhY2Nlc3MgZGF0YSBsZW5ndGgKLSAqCi0gKiBSZXR1cm5z
OgotICogWmVybyBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBjb2RlIGlmIGZhaWxlZC4KLSAq
LwotaW50IGludGVsX3ZncHVfbWFza19tbWlvX3dyaXRlKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1
LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAotCQl2b2lkICpwX2RhdGEsIHVuc2lnbmVkIGludCBieXRl
cykKLXsKLQl1MzIgbWFzaywgb2xkX3ZyZWc7Ci0KLQlvbGRfdnJlZyA9IHZncHVfdnJlZyh2Z3B1
LCBvZmZzZXQpOwotCXdyaXRlX3ZyZWcodmdwdSwgb2Zmc2V0LCBwX2RhdGEsIGJ5dGVzKTsKLQlt
YXNrID0gdmdwdV92cmVnKHZncHUsIG9mZnNldCkgPj4gMTY7Ci0JdmdwdV92cmVnKHZncHUsIG9m
ZnNldCkgPSAob2xkX3ZyZWcgJiB+bWFzaykgfAotCQkJCSh2Z3B1X3ZyZWcodmdwdSwgb2Zmc2V0
KSAmIG1hc2spOwotCi0JcmV0dXJuIDA7Ci19Ci0KIC8qKgogICogaW50ZWxfZ3Z0X2luX2ZvcmNl
X25vbnByaXZfd2hpdGVsaXN0IC0gaWYgYSBtbWlvIGlzIGluIHdoaXRlbGlzdCB0byBiZQogICog
Zm9yY2Utbm9wcml2IHJlZ2lzdGVyCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvbW1pby5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW8uaAppbmRleCA1ODc0ZjFj
YjQzMDYuLjJhOGFlODg5ODI2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L21taW8uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5oCkBAIC0xMDAsNiAr
MTAwLDQgQEAgYm9vbCBpbnRlbF9ndnRfaW5fZm9yY2Vfbm9ucHJpdl93aGl0ZWxpc3Qoc3RydWN0
IGludGVsX2d2dCAqZ3Z0LAogaW50IGludGVsX3ZncHVfbW1pb19yZWdfcncoc3RydWN0IGludGVs
X3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsCiAJCQkgICB2b2lkICpwZGF0YSwgdW5z
aWduZWQgaW50IGJ5dGVzLCBib29sIGlzX3JlYWQpOwogCi1pbnQgaW50ZWxfdmdwdV9tYXNrX21t
aW9fd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQsCi0J
CQkJICB2b2lkICpwX2RhdGEsIHVuc2lnbmVkIGludCBieXRlcyk7CiAjZW5kaWYKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwt
Z3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQt
ZGV2
