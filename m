Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp269885ywe;
        Thu, 28 Feb 2019 00:28:21 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbpWOZoVCRkblJghXtAgO+siLljJBEPpMQDESFeowv2bqhjEoq0L5WejyHgoo+XJT/0qCf0
X-Received: by 2002:a17:902:63:: with SMTP id 90mr6541524pla.122.1551342501014;
        Thu, 28 Feb 2019 00:28:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551342501; cv=none;
        d=google.com; s=arc-20160816;
        b=kbZAQmH/4rEE9AcH9nmC8ACK33WQ0OYZXq5TcwsH1ZReqBU/r2GfmvsY5NnghtmIRR
         juIft6JzgzrrNVxOgzwzkyyehsd86J2KVQmXwhVJ+EFX2cEKO0lxBpFFV8CDYK9ZKSQk
         DYLjcOzQC/paeI3gBeB8oITCWd6EbnqC4iw0NZeJf1JYePf12bAYjeIyKmgfenQijs8X
         9UxyRAa8/F7qe92WQM0pbnty3l97wVYhz3Qf5gqfSjWIEJGNp1adwiQGdP7jRI+DbOqo
         o+vK8xe3rK27XfE46y0ExKfkUdd9Q+1gQcYm91tlXhiV35LmXJmDgcVWcLA9lNE4giN0
         vTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=7oAAY7ZPcE0k2/lbwv6EnziRnvtAcENxEPexvaN1mBY=;
        b=TjfuBhw0wrrpZ/3bCl4pmct+se/bKKX2U0dkCjma/zUShohhnp91dmUqNYd2GJaaXL
         mfWnP1yGUh+8Ax9KUB2bPvETW3ErE0JOtJ/m3GuA301XxHobEsn/d2Dwi2tjgMp5JZYD
         wr+yA9gjGi9+rgXeQXD5/om/SaqcwUZlS4jnoZ46U5K9o2eml4m28VMjxSGelQtGGWwe
         IhJNvn0ULTM5q0i7U1WLOIZ6HYHipoZj72v5rasZHTw1cVrfAaluV1T0dtldCS9lWA7j
         WmpuCp1POgxTwEaNuJhNYaXkkRTQWeroSo8d9MNE57pYx2Q36ppBGIu2ytvA1JTc4oxT
         PSGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id k127si17272560pgc.124.2019.02.28.00.28.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Feb 2019 00:28:21 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E57D6E14F;
	Thu, 28 Feb 2019 08:28:20 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3376E14F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 28 Feb 2019 08:28:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2019 00:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,422,1544515200"; d="scan'208";a="303213010"
Received: from weinanli-build.sh.intel.com ([10.239.160.69])
 by orsmga005.jf.intel.com with ESMTP; 28 Feb 2019 00:28:17 -0800
From: Weinan Li <weinan.z.li@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: declare the vgpu active flag as atomic_t
Date: Thu, 28 Feb 2019 16:19:48 +0800
Message-Id: <1551341988-1410-1-git-send-email-weinan.z.li@intel.com>
X-Mailer: git-send-email 1.9.1
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
Cc: Weinan Li <weinan.z.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SXQncyBub3QgbmVjZXNzYXJ5IHRvIHByb3RlY3QgdGhlIHZncHUgYWN0aXZlIGZsYWcgd2l0aCBs
b2NrLCBhdG9taWMKYWNjZXNzIGNvdWxkIG1lZXQgdGhlIHJlcXVpcmVtZW50LgoKU2lnbmVkLW9m
Zi1ieTogV2VpbmFuIExpIDx3ZWluYW4uei5saUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2RlYnVnZnMuYyAgIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2RtYWJ1Zi5jICAgIHwgIDMgKystCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0Lmgg
ICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMgfCAg
MiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYyAgICAgIHwgMTAgKysrKy0tLS0t
LQogNSBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGVidWdmcy5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2RlYnVnZnMuYwppbmRleCAyZWM4OWJjLi41YzhjZWM3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGVidWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9kZWJ1Z2ZzLmMKQEAgLTIwMyw4ICsyMDMsOCBAQCBpbnQgaW50ZWxfZ3Z0
X2RlYnVnZnNfYWRkX3ZncHUoc3RydWN0IGludGVsX3ZncHUgKnZncHUpCiAJaWYgKCF2Z3B1LT5k
ZWJ1Z2ZzKQogCQlyZXR1cm4gLUVOT01FTTsKIAotCWVudCA9IGRlYnVnZnNfY3JlYXRlX2Jvb2wo
ImFjdGl2ZSIsIDA0NDQsIHZncHUtPmRlYnVnZnMsCi0JCQkJICAmdmdwdS0+YWN0aXZlKTsKKwll
bnQgPSBkZWJ1Z2ZzX2NyZWF0ZV9hdG9taWNfdCgiYWN0aXZlIiwgMDQ0NCwgdmdwdS0+ZGVidWdm
cywKKwkJCQkgICAgICAmdmdwdS0+YWN0aXZlKTsKIAlpZiAoIWVudCkKIAkJcmV0dXJuIC1FTk9N
RU07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYwppbmRleCAzZTdlMmI4Li5jMzkxNmNiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCkBAIC04OSw3ICs4OSw4IEBAIHN0YXRpYyB2b2lk
IGRtYWJ1Zl9nZW1fb2JqZWN0X2ZyZWUoc3RydWN0IGtyZWYgKmtyZWYpCiAJc3RydWN0IGxpc3Rf
aGVhZCAqcG9zOwogCXN0cnVjdCBpbnRlbF92Z3B1X2RtYWJ1Zl9vYmogKmRtYWJ1Zl9vYmo7CiAK
LQlpZiAodmdwdSAmJiB2Z3B1LT5hY3RpdmUgJiYgIWxpc3RfZW1wdHkoJnZncHUtPmRtYWJ1Zl9v
YmpfbGlzdF9oZWFkKSkgeworCWlmICh2Z3B1ICYmIGF0b21pY19yZWFkKCZ2Z3B1LT5hY3RpdmUp
ICYmCisJICAgICFsaXN0X2VtcHR5KCZ2Z3B1LT5kbWFidWZfb2JqX2xpc3RfaGVhZCkpIHsKIAkJ
bGlzdF9mb3JfZWFjaChwb3MsICZ2Z3B1LT5kbWFidWZfb2JqX2xpc3RfaGVhZCkgewogCQkJZG1h
YnVmX29iaiA9IGNvbnRhaW5lcl9vZihwb3MsCiAJCQkJCXN0cnVjdCBpbnRlbF92Z3B1X2RtYWJ1
Zl9vYmosIGxpc3QpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5o
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oCmluZGV4IGVmNzEwZTIuLjhkODhhNzcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmgKQEAgLTE3MSw3ICsxNzEsNyBAQCBzdHJ1Y3QgaW50ZWxf
dmdwdSB7CiAJc3RydWN0IG11dGV4IHZncHVfbG9jazsKIAlpbnQgaWQ7CiAJdW5zaWduZWQgbG9u
ZyBoYW5kbGU7IC8qIHZHUFUgaGFuZGxlIHVzZWQgYnkgaHlwZXJ2aXNvciBNUFQgbW9kdWxlcyAq
LwotCWJvb2wgYWN0aXZlOworCWF0b21pY190IGFjdGl2ZTsKIAlib29sIHB2X25vdGlmaWVkOwog
CWJvb2wgZmFpbHNhZmU7CiAJdW5zaWduZWQgaW50IHJlc2V0dGluZ19lbmc7CkBAIC00NTQsNyAr
NDU0LDcgQEAgdm9pZCBpbnRlbF92Z3B1X3dyaXRlX2ZlbmNlKHN0cnVjdCBpbnRlbF92Z3B1ICp2
Z3B1LAogCiAjZGVmaW5lIGZvcl9lYWNoX2FjdGl2ZV92Z3B1KGd2dCwgdmdwdSwgaWQpIFwKIAlp
ZHJfZm9yX2VhY2hfZW50cnkoKCYoZ3Z0KS0+dmdwdV9pZHIpLCAodmdwdSksIChpZCkpIFwKLQkJ
Zm9yX2VhY2hfaWYodmdwdS0+YWN0aXZlKQorCQlmb3JfZWFjaF9pZihhdG9taWNfcmVhZCgmdmdw
dS0+YWN0aXZlKSkKIAogc3RhdGljIGlubGluZSB2b2lkIGludGVsX3ZncHVfd3JpdGVfcGNpX2Jh
cihzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwKIAkJCQkJICAgIHUzMiBvZmZzZXQsIHUzMiB2YWws
IGJvb2wgbG93KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3NjaGVkdWxlci5jCmluZGV4IDJiY2I3MDEu
LjYxN2NjNDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9zY2hlZHVsZXIu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvc2NoZWR1bGVyLmMKQEAgLTczOSw3ICs3
MzksNyBAQCBzdGF0aWMgc3RydWN0IGludGVsX3ZncHVfd29ya2xvYWQgKnBpY2tfbmV4dF93b3Jr
bG9hZCgKIAkJZ290byBvdXQ7CiAJfQogCi0JaWYgKCFzY2hlZHVsZXItPmN1cnJlbnRfdmdwdS0+
YWN0aXZlIHx8CisJaWYgKCFhdG9taWNfcmVhZCgmc2NoZWR1bGVyLT5jdXJyZW50X3ZncHUtPmFj
dGl2ZSkgfHwKIAkgICAgbGlzdF9lbXB0eSh3b3JrbG9hZF9xX2hlYWQoc2NoZWR1bGVyLT5jdXJy
ZW50X3ZncHUsIHJpbmdfaWQpKSkKIAkJZ290byBvdXQ7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvdmdwdS5j
CmluZGV4IDcyMGUyYjEuLmQ1NWE3MTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC92Z3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYwpAQCAtMjEy
LDkgKzIxMiw3IEBAIHN0YXRpYyB2b2lkIGludGVsX2d2dF91cGRhdGVfdmdwdV90eXBlcyhzdHJ1
Y3QgaW50ZWxfZ3Z0ICpndnQpCiAgKi8KIHZvaWQgaW50ZWxfZ3Z0X2FjdGl2YXRlX3ZncHUoc3Ry
dWN0IGludGVsX3ZncHUgKnZncHUpCiB7Ci0JbXV0ZXhfbG9jaygmdmdwdS0+Z3Z0LT5sb2NrKTsK
LQl2Z3B1LT5hY3RpdmUgPSB0cnVlOwotCW11dGV4X3VubG9jaygmdmdwdS0+Z3Z0LT5sb2NrKTsK
KwlhdG9taWNfc2V0KCZ2Z3B1LT5hY3RpdmUsIHRydWUpOwogfQogCiAvKioKQEAgLTIyOSw3ICsy
MjcsNyBAQCB2b2lkIGludGVsX2d2dF9kZWFjdGl2YXRlX3ZncHUoc3RydWN0IGludGVsX3ZncHUg
KnZncHUpCiB7CiAJbXV0ZXhfbG9jaygmdmdwdS0+dmdwdV9sb2NrKTsKIAotCXZncHUtPmFjdGl2
ZSA9IGZhbHNlOworCWF0b21pY19zZXQoJnZncHUtPmFjdGl2ZSwgZmFsc2UpOwogCiAJaWYgKGF0
b21pY19yZWFkKCZ2Z3B1LT5zdWJtaXNzaW9uLnJ1bm5pbmdfd29ya2xvYWRfbnVtKSkgewogCQlt
dXRleF91bmxvY2soJnZncHUtPnZncHVfbG9jayk7CkBAIC0yNzQsNyArMjcyLDcgQEAgdm9pZCBp
bnRlbF9ndnRfZGVzdHJveV92Z3B1KHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1KQogCiAJbXV0ZXhf
bG9jaygmdmdwdS0+dmdwdV9sb2NrKTsKIAotCVdBUk4odmdwdS0+YWN0aXZlLCAidkdQVSBpcyBz
dGlsbCBhY3RpdmUhXG4iKTsKKwlXQVJOKGF0b21pY19yZWFkKCZ2Z3B1LT5hY3RpdmUpLCAidkdQ
VSBpcyBzdGlsbCBhY3RpdmUhXG4iKTsKIAogCWludGVsX2d2dF9kZWJ1Z2ZzX3JlbW92ZV92Z3B1
KHZncHUpOwogCWludGVsX3ZncHVfY2xlYW5fc2NoZWRfcG9saWN5KHZncHUpOwpAQCAtMzMxLDcg
KzMyOSw3IEBAIHN0cnVjdCBpbnRlbF92Z3B1ICppbnRlbF9ndnRfY3JlYXRlX2lkbGVfdmdwdShz
dHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpCiAJaWYgKHJldCkKIAkJZ290byBvdXRfZnJlZV92Z3B1Owog
Ci0JdmdwdS0+YWN0aXZlID0gZmFsc2U7CisJYXRvbWljX3NldCgmdmdwdS0+YWN0aXZlLCBmYWxz
ZSk7CiAKIAlyZXR1cm4gdmdwdTsKIAotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVs
LWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
