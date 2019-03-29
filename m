Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1378686ywb;
        Thu, 28 Mar 2019 21:01:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKBVwPSXs4oU5lJq/9hpzdwvDaflnO/u6/lvAzmkvvmDiBasio3T9mBc5nq7R1wM9ScE4o
X-Received: by 2002:a17:902:7896:: with SMTP id q22mr47644443pll.66.1553832087506;
        Thu, 28 Mar 2019 21:01:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553832087; cv=none;
        d=google.com; s=arc-20160816;
        b=K5awegSlx6BFNhkivVygh5KssURqMNqVLGyJPFcUvOp1tzdbx1do+9IYIvaTO604PQ
         mkBkrce9ctwNnn7pdacRv8kZd2gsNmDJ+cz4lzAPFlCyMPARvP7KllNGfGhX5jNEUy64
         JOsg6ITUdGVVQtkg8kTWx2r8XPckMrwFUgv942Y8Ircx3V6Zao5paNTSbsoOyQQ6FQXk
         fzi5gGBkDM/DKfE4sbYhCGqBh+gIvdai9ZgfkqcKuMvIhIrJ8ZOI3NYjIPcCLyAO2rUg
         aua29ufDrFc3PwmhxdEpQjnkXUfrgrCm+nT5/EomsKkeg/WVqzLTxy0bUE792G7JJphQ
         PQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=a08+zTzCTxnoQVz/SCtdqFGh0xkuoqNsJkKB95JZbm0=;
        b=t7Y2hxb6psvrwOdzsa5S30fdM2C9Wj2QII494wILDtC2tQ5RvosDD1O1Fek0OVSTCK
         i3OPX7x5evGqimNGEoGxeex6kQF6z5zDJK1ZUCW8iBMUab3wEL7NjcV/qt1O9+L8JWpy
         Gu1fne2c9uxnFRX+Y8ynYMWPNW1VQnUQNY90v2oEfedkQ2ti1LIIIvrYsbxskUkCIthB
         fR0i73BbKjVsOMTK7Y7+2LXDBqUlihH9Oq4KxuxF1K05Bpk++TJ4khdF7IxlE8GJVV3s
         JzhIhKHX8MEU4xwToL1CkeNPk0TRaaloHd9WyHvPpo/aJhPwPdezeCyJtiLy7WtY6JE1
         z5Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id g75si881216pfg.49.2019.03.28.21.01.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 21:01:26 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BEE6E81E;
	Fri, 29 Mar 2019 04:01:26 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F03C6E822;
 Fri, 29 Mar 2019 04:01:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Mar 2019 21:01:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129648588"
Received: from vca-bj120.bj.intel.com ([10.240.192.119])
 by orsmga008.jf.intel.com with ESMTP; 28 Mar 2019 21:01:23 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 8/8] drm/i915/gvt: GVTg support context submission pv
 optimization
Date: Fri, 29 Mar 2019 09:32:44 -0400
Message-Id: <1553866364-111114-9-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
References: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyu.z.wang@intel.com,
 joonas.lahtinen@linux.intel.com, hang.yuan@intel.com, min.he@intel.com,
 zhiyuan.lv@intel.com, chris@chris-wilson.co.uk, zhi.a.wang@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aW1wbGVtZW50ZWQgY29udGV4dCBzdWJtaXNzaW9uIHB2IG9wdGltaXphaXRvbiB3aXRoaW4gR1ZU
Zy4KCkdWVGcgdG8gcmVhZCBjb250ZXh0IHN1Ym1pc3Npb24gZGF0YSAoZWxzcF9kYXRhKSBmcm9t
IHRoZSBzaGFyZWRfcGFnZQpkaXJlY3RseSB3aXRob3V0IHRyYXAgY29zdCBhbmQgZWxpbWluYXRl
IGV4ZWNsaXN0IEhXIGJlaGF2aW9yIGVtdWxhdGlvbgp3aXRob3V0IGluamVjdGluZyBjb250ZXh0
IHN3aXRjaCBpbnRlcnJ1cHQgdG8gZ3Vlc3QgdW5kZXIgUFYKc3VibWlzaXNvbiBtZWNoYW5pc20u
Cgp2MDogUkZDCnYxOiByZWJhc2UKdjI6IHJlYmFzZQp2MzogcmVwb3J0IHB2IGNvbnRleHQgc3Vi
bWlzc2lvbiBjYXAgYW5kIGhhbmRsZSBWR1RfRzJWX0VMU1BfU1VCTUlUCmcydiBwdiBub3RpZmlj
YXRpb24uCnY0OiBlbGltaW5hdGUgZXhlY2xpc3QgSFcgZW11bGF0aW9uIGFuZCBkb24ndCBpbmpl
Y3QgY29udGV4dCBzd2l0Y2gKaW50ZXJydXB0IHRvIGd1ZXN0IHVuZGVyIFBWIHN1Ym1pc2lzb24g
bWVjaGFuaXNtLgoKU2lnbmVkLW9mZi1ieTogWGlhb2xpbiBaaGFuZyA8eGlhb2xpbi56aGFuZ0Bp
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2V4ZWNsaXN0LmMgfCAgNiAr
KysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgMzIgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMg
ICAgIHwgIDEgKwogMyBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2V4ZWNsaXN0LmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvZXhlY2xpc3QuYwppbmRleCAxYTkzNDcyLi5lNjhmMWQ0YiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2V4ZWNsaXN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2V4ZWNsaXN0LmMKQEAgLTM4Miw2ICszODIsOSBAQCBzdGF0aWMgaW50IHByZXBh
cmVfZXhlY2xpc3Rfd29ya2xvYWQoc3RydWN0IGludGVsX3ZncHVfd29ya2xvYWQgKndvcmtsb2Fk
KQogCWludCByaW5nX2lkID0gd29ya2xvYWQtPnJpbmdfaWQ7CiAJaW50IHJldDsKIAorCWlmIChW
R1BVX1BWQ0FQKHZncHUsIFBWX1NVQk1JU1NJT04pKQorCQlyZXR1cm4gMDsKKwogCWlmICghd29y
a2xvYWQtPmVtdWxhdGVfc2NoZWR1bGVfaW4pCiAJCXJldHVybiAwOwogCkBAIC00MjksNiArNDMy
LDkgQEAgc3RhdGljIGludCBjb21wbGV0ZV9leGVjbGlzdF93b3JrbG9hZChzdHJ1Y3QgaW50ZWxf
dmdwdV93b3JrbG9hZCAqd29ya2xvYWQpCiAJCWdvdG8gb3V0OwogCX0KIAorCWlmIChWR1BVX1BW
Q0FQKHZncHUsIFBWX1NVQk1JU1NJT04pKQorCQlnb3RvIG91dDsKKwogCXJldCA9IGVtdWxhdGVf
ZXhlY2xpc3RfY3R4X3NjaGVkdWxlX291dChleGVjbGlzdCwgJndvcmtsb2FkLT5jdHhfZGVzYyk7
CiBvdXQ6CiAJaW50ZWxfdmdwdV91bnBpbl9tbSh3b3JrbG9hZC0+c2hhZG93X21tKTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKaW5kZXggMmI0YzY4Ni4uY2JiYTc3YyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKQEAgLTExODIsNiArMTE4MiwzNSBAQCBzdGF0aWMgaW50
IHB2aW5mb19tbWlvX3JlYWQoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBv
ZmZzZXQsCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgaW50ZWxfdmdwdV9nMnZfcHZfZWxz
cF9zdWJtaXQoc3RydWN0IGludGVsX3ZncHUgKnZncHUpCit7CisJc3RydWN0IGludGVsX3ZncHVf
ZXhlY2xpc3QgKmV4ZWNsaXN0OworCXUzMiByaW5nX2lkX29mZjsKKwlpbnQgcmluZ19pZDsKKwl1
MzIgZGVzY3Nfb2ZmOworCisJaW50IHJldCA9IC1FSU5WQUw7CisKKwlpZiAoIVZHUFVfUFZDQVAo
dmdwdSwgUFZfU1VCTUlTU0lPTikpCisJCXJldHVybiByZXQ7CisKKwlyaW5nX2lkX29mZiA9IG9m
ZnNldG9mKHN0cnVjdCBndnRfc2hhcmVkX3BhZ2UsIHJpbmdfaWQpOworCWlmIChpbnRlbF9ndnRf
cmVhZF9zaGFyZWRfcGFnZSh2Z3B1LCByaW5nX2lkX29mZiwgJnJpbmdfaWQsIDQpKQorCQlyZXR1
cm4gcmV0OworCisJaWYgKFdBUk5fT04ocmluZ19pZCA8IDAgfHwgcmluZ19pZCA+PSBJOTE1X05V
TV9FTkdJTkVTKSkKKwkJcmV0dXJuIHJldDsKKworCWV4ZWNsaXN0ID0gJnZncHUtPnN1Ym1pc3Np
b24uZXhlY2xpc3RbcmluZ19pZF07CisKKwlkZXNjc19vZmYgPSBvZmZzZXRvZihzdHJ1Y3QgZ3Z0
X3NoYXJlZF9wYWdlLCBkZXNjcyk7CisJaWYgKGludGVsX2d2dF9yZWFkX3NoYXJlZF9wYWdlKHZn
cHUsIGRlc2NzX29mZiwKKwkJCSZleGVjbGlzdC0+ZWxzcF9kd29yZHMuZGF0YSwgOCAqIEVYRUNM
SVNUX01BWF9QT1JUUykpCisJCXJldHVybiByZXQ7CisKKwlyZXR1cm4gaW50ZWxfdmdwdV9zdWJt
aXRfZXhlY2xpc3QodmdwdSwgcmluZ19pZCk7Cit9CisKIHN0YXRpYyBpbnQgaGFuZGxlX2cydl9u
b3RpZmljYXRpb24oc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGludCBub3RpZmljYXRpb24pCiB7
CiAJaW50ZWxfZ3Z0X2d0dF90eXBlX3Qgcm9vdF9lbnRyeV90eXBlID0gR1RUX1RZUEVfUFBHVFRf
Uk9PVF9MNF9FTlRSWTsKQEAgLTEyMjEsNiArMTI1MCw5IEBAIHN0YXRpYyBpbnQgaGFuZGxlX2cy
dl9ub3RpZmljYXRpb24oc3RydWN0IGludGVsX3ZncHUgKnZncHUsIGludCBub3RpZmljYXRpb24p
CiAJY2FzZSBWR1RfRzJWX1BQR1RUX0w0X0NMRUFSOgogCQlyZXQgPSBpbnRlbF92Z3B1X2cydl9w
dl9wcGd0dF9jbGVhcl80bHZsKHZncHUsIHBkcHMpOwogCQlicmVhazsKKwljYXNlIFZHVF9HMlZf
UFZfU1VCTUlTU0lPTjoKKwkJcmV0ID0gaW50ZWxfdmdwdV9nMnZfcHZfZWxzcF9zdWJtaXQodmdw
dSk7CisJCWJyZWFrOwogCWNhc2UgVkdUX0cyVl9FWEVDTElTVF9DT05URVhUX0NSRUFURToKIAlj
YXNlIFZHVF9HMlZfRVhFQ0xJU1RfQ09OVEVYVF9ERVNUUk9ZOgogCWNhc2UgMToJLyogUmVtb3Zl
IHRoaXMgaW4gZ3Vlc3QgZHJpdmVyLiAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L3ZncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMKaW5kZXggYmM3
Mzg3ZS4uYzcxYWFmNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5jCkBAIC01MSw2ICs1MSw3IEBA
IHZvaWQgcG9wdWxhdGVfcHZpbmZvX3BhZ2Uoc3RydWN0IGludGVsX3ZncHUgKnZncHUpCiAKIAlp
ZiAoIWludGVsX3Z0ZF9hY3RpdmUoKSkKIAkJdmdwdV92cmVnX3QodmdwdSwgdmd0aWZfcmVnKHB2
X2NhcHMpKSA9IFBWX1BQR1RUX1VQREFURTsKKwl2Z3B1X3ZyZWdfdCh2Z3B1LCB2Z3RpZl9yZWco
cHZfY2FwcykpIHw9IFBWX1NVQk1JU1NJT047CiAKIAl2Z3B1X3ZyZWdfdCh2Z3B1LCB2Z3RpZl9y
ZWcoYXZhaWxfcnMubWFwcGFibGVfZ21hZHIuYmFzZSkpID0KIAkJdmdwdV9hcGVydHVyZV9nbWFk
cl9iYXNlKHZncHUpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
