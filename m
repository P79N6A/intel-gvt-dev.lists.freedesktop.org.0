Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp7711413ywe;
        Thu, 7 Mar 2019 23:32:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzPpEyngqKNU6odbG539S4tJbbYDCtFHWZTJ5C6jWCv7ZQjkFVVqHAgoFLSLOqjWyxSKj6g
X-Received: by 2002:a63:c0e:: with SMTP id b14mr15479252pgl.236.1552030335805;
        Thu, 07 Mar 2019 23:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552030335; cv=none;
        d=google.com; s=arc-20160816;
        b=D1L1MiUMiDyG65igXS70jEWkiNFD7qrKmzsyHT3szs3JhMlwDvAUBtXSCp8SCtNFGn
         +fctVtVZAHl9GFzaTFvD7uuGliqS18wAR1gTU/wSQFUFn0wR4dSm7TLWKYkTasknDs9V
         1EVbrZJe81RSXhky0GgL+UyyLzHVuWI4ws5/Dtbzv2lDXd+7gkGVvPb9zlJatDiwSd2A
         Txv0k7qACoK0xFg0hNYiNXObzT5gImRPbGXi4aOK5SnmS2/Q8tsQ9+oaoYwJ1C11UdXo
         OcBigMt1ZtJShQ1jW6J/WChHNYKT+tXlJTpcWGniRJeD1T5MfzrlpbX+AYNc8dTh2L8z
         ZlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=ogB6scWBZi0G9lHTPYrZDiKSr8GMCewhOewV9Nk8Peg=;
        b=YPZjCAkEe1tRygbYKUeX1ZbVUfJleDGiP8aXDOlhZIAtPMcMBuEZNbRLkKbfvc+b5r
         fJJWDqqhJHdEwpYruu3ZrcPHx8VKCSNxTPV3S/Bk/M79YjjazAx4UbqSoU0FToRa3oJh
         AgJoLlLzUpiKzY2ViN7mf9jYyae7FgvTLYS7QDKq0Uu2uUCMwLSQSmrsXHHNYRwj9wDy
         okApjNJgnWu15U1yIQiJqktwV84SLZ4SIoIUI1mkxWSub02BSwQ21ItbiLddKeT/0cpi
         3dFysGAY2x6FUGmIOH123Afm+KLqEGraef+75UMtNGpZ/PwersXMPLvJJJcHBkNKadae
         Dr8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id k190si5986817pgd.288.2019.03.07.23.32.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2019 23:32:15 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A73D89338;
	Fri,  8 Mar 2019 07:32:15 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66AE89338
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 07:32:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Mar 2019 23:32:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,455,1544515200"; d="scan'208";a="326683675"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga005.fm.intel.com with ESMTP; 07 Mar 2019 23:32:13 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/gvt: remove the unused sreg
Date: Fri,  8 Mar 2019 02:26:51 -0500
Message-Id: <20190308072651.27063-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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

Y29kZSBjbGVhbnVwLiBzcmVnIGlzIG5vdCB1c2VkIG5vdy4gcmVtb3ZlIGl0IGZvciBjb2RlIGNs
ZWFubmVzcy4KCnYyOiBkbyBub3QgYWxsb2NhdGUgbWVtb3J5IGZvciBzcmVnLiAobWluIGhlKQoK
U2lnbmVkLW9mZi1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCAgICAgIHwgNSAtLS0tLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2hhbmRsZXJzLmMgfCA1ICstLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
bW1pby5jICAgICB8IDggKystLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
Z3Z0LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmgKaW5kZXggZWY3MTBlMjU5NzI2
Li5hNGZkOTc5YjNkYWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmgKQEAgLTk0LDcgKzk0LDYgQEAg
c3RydWN0IGludGVsX3ZncHVfZmVuY2UgewogCiBzdHJ1Y3QgaW50ZWxfdmdwdV9tbWlvIHsKIAl2
b2lkICp2cmVnOwotCXZvaWQgKnNyZWc7CiB9OwogCiAjZGVmaW5lIElOVEVMX0dWVF9NQVhfQkFS
X05VTSA0CkBAIC00NDcsMTAgKzQ0Niw2IEBAIHZvaWQgaW50ZWxfdmdwdV93cml0ZV9mZW5jZShz
dHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwKIAkoKih1NjQgKikodmdwdS0+bW1pby52cmVnICsgaTkx
NV9tbWlvX3JlZ19vZmZzZXQocmVnKSkpCiAjZGVmaW5lIHZncHVfdnJlZzY0KHZncHUsIG9mZnNl
dCkgXAogCSgqKHU2NCAqKSh2Z3B1LT5tbWlvLnZyZWcgKyAob2Zmc2V0KSkpCi0jZGVmaW5lIHZn
cHVfc3JlZ190KHZncHUsIHJlZykgXAotCSgqKHUzMiAqKSh2Z3B1LT5tbWlvLnNyZWcgKyBpOTE1
X21taW9fcmVnX29mZnNldChyZWcpKSkKLSNkZWZpbmUgdmdwdV9zcmVnKHZncHUsIG9mZnNldCkg
XAotCSgqKHUzMiAqKSh2Z3B1LT5tbWlvLnNyZWcgKyAob2Zmc2V0KSkpCiAKICNkZWZpbmUgZm9y
X2VhY2hfYWN0aXZlX3ZncHUoZ3Z0LCB2Z3B1LCBpZCkgXAogCWlkcl9mb3JfZWFjaF9lbnRyeSgo
JihndnQpLT52Z3B1X2lkciksICh2Z3B1KSwgKGlkKSkgXApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFu
ZGxlcnMuYwppbmRleCBiNWMwYWMwNDkyNWYuLjU0YmQwYjAzMzI5OCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2hhbmRsZXJzLmMKQEAgLTM0ODksMTIgKzM0ODksMTEgQEAgaW50IGludGVsX3ZncHVf
bW1pb19yZWdfcncoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZzZXQs
CiAJCXJldHVybiBtbWlvX2luZm8tPnJlYWQodmdwdSwgb2Zmc2V0LCBwZGF0YSwgYnl0ZXMpOwog
CWVsc2UgewogCQl1NjQgcm9fbWFzayA9IG1taW9faW5mby0+cm9fbWFzazsKLQkJdTMyIG9sZF92
cmVnID0gMCwgb2xkX3NyZWcgPSAwOworCQl1MzIgb2xkX3ZyZWcgPSAwOwogCQl1NjQgZGF0YSA9
IDA7CiAKIAkJaWYgKGludGVsX2d2dF9tbWlvX2hhc19tb2RlX21hc2soZ3Z0LCBtbWlvX2luZm8t
Pm9mZnNldCkpIHsKIAkJCW9sZF92cmVnID0gdmdwdV92cmVnKHZncHUsIG9mZnNldCk7Ci0JCQlv
bGRfc3JlZyA9IHZncHVfc3JlZyh2Z3B1LCBvZmZzZXQpOwogCQl9CiAKIAkJaWYgKGxpa2VseSgh
cm9fbWFzaykpCkBAIC0zNTE2LDggKzM1MTUsNiBAQCBpbnQgaW50ZWxfdmdwdV9tbWlvX3JlZ19y
dyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdW5zaWduZWQgaW50IG9mZnNldCwKIAogCQkJdmdw
dV92cmVnKHZncHUsIG9mZnNldCkgPSAob2xkX3ZyZWcgJiB+bWFzaykKIAkJCQkJfCAodmdwdV92
cmVnKHZncHUsIG9mZnNldCkgJiBtYXNrKTsKLQkJCXZncHVfc3JlZyh2Z3B1LCBvZmZzZXQpID0g
KG9sZF9zcmVnICYgfm1hc2spCi0JCQkJCXwgKHZncHVfc3JlZyh2Z3B1LCBvZmZzZXQpICYgbWFz
ayk7CiAJCX0KIAl9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlv
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5jCmluZGV4IGVkNGRmMmY2ZDYwYi4u
ZjQzZDI3MDA1YmU2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pby5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvLmMKQEAgLTIzOSw3ICsyMzksNiBA
QCB2b2lkIGludGVsX3ZncHVfcmVzZXRfbW1pbyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgYm9v
bCBkbWxyKQogCiAJaWYgKGRtbHIpIHsKIAkJbWVtY3B5KHZncHUtPm1taW8udnJlZywgbW1pbywg
aW5mby0+bW1pb19zaXplKTsKLQkJbWVtY3B5KHZncHUtPm1taW8uc3JlZywgbW1pbywgaW5mby0+
bW1pb19zaXplKTsKIAogCQl2Z3B1X3ZyZWdfdCh2Z3B1LCBHRU42X0dUX1RIUkVBRF9TVEFUVVNf
UkVHKSA9IDA7CiAKQEAgLTI4MCw3ICsyNzksNiBAQCB2b2lkIGludGVsX3ZncHVfcmVzZXRfbW1p
byhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgYm9vbCBkbWxyKQogCQkgKiB0b3VjaGVkCiAJCSAq
LwogCQltZW1jcHkodmdwdS0+bW1pby52cmVnLCBtbWlvLCBHVlRfR0VOOF9NTUlPX1JFU0VUX09G
RlNFVCk7Ci0JCW1lbWNweSh2Z3B1LT5tbWlvLnNyZWcsIG1taW8sIEdWVF9HRU44X01NSU9fUkVT
RVRfT0ZGU0VUKTsKIAl9CiAKIH0KQEAgLTI5NiwxMiArMjk0LDEwIEBAIGludCBpbnRlbF92Z3B1
X2luaXRfbW1pbyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkKIHsKIAljb25zdCBzdHJ1Y3QgaW50
ZWxfZ3Z0X2RldmljZV9pbmZvICppbmZvID0gJnZncHUtPmd2dC0+ZGV2aWNlX2luZm87CiAKLQl2
Z3B1LT5tbWlvLnZyZWcgPSB2emFsbG9jKGFycmF5X3NpemUoaW5mby0+bW1pb19zaXplLCAyKSk7
CisJdmdwdS0+bW1pby52cmVnID0gdnphbGxvYyhhcnJheV9zaXplKGluZm8tPm1taW9fc2l6ZSwg
MSkpOwogCWlmICghdmdwdS0+bW1pby52cmVnKQogCQlyZXR1cm4gLUVOT01FTTsKIAotCXZncHUt
Pm1taW8uc3JlZyA9IHZncHUtPm1taW8udnJlZyArIGluZm8tPm1taW9fc2l6ZTsKLQogCWludGVs
X3ZncHVfcmVzZXRfbW1pbyh2Z3B1LCB0cnVlKTsKIAogCXJldHVybiAwOwpAQCAtMzE1LDUgKzMx
MSw1IEBAIGludCBpbnRlbF92Z3B1X2luaXRfbW1pbyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSkK
IHZvaWQgaW50ZWxfdmdwdV9jbGVhbl9tbWlvKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQogewog
CXZmcmVlKHZncHUtPm1taW8udnJlZyk7Ci0JdmdwdS0+bW1pby52cmVnID0gdmdwdS0+bW1pby5z
cmVnID0gTlVMTDsKKwl2Z3B1LT5tbWlvLnZyZWcgPSBOVUxMOwogfQotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2
IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
