Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp5411485ywd;
        Wed, 30 Jan 2019 02:33:38 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5mpvdX8io4DNI1oYvBGgzxv1Pfjh8A9IpDINbGPOAI0tCxuUrSSJrNH+AImZbNTjgID8pw
X-Received: by 2002:a17:902:bf44:: with SMTP id u4mr30149412pls.5.1548844418499;
        Wed, 30 Jan 2019 02:33:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548844418; cv=none;
        d=google.com; s=arc-20160816;
        b=yKPAdqF/OiJJI/SeW0oWjuhevoE0fJXodwetlj+WQPchgqEZFVmUP7TMlfGrkpGKKX
         /8qoPmilvNoS/uzI4QfijjrxD/f2oAwC1Gf9oOemve3fpDovbXWLBLTlAUGsp9MuVjiu
         IyuA/yQB58TnYB+fwJjVrykI+q7C4bZa925ootCjJ7+/TQ2s/SDQGw1KWF2OTAI0YRDr
         ztcftPsMGCZFEl5pOQd39J9ojszatwV8hGTNuvBQSkicB+GtbRu6rfhr0Duh9E1qHKDx
         W9cZ2ADJTB12wKVxTbxmYRhXcIaDuCGAh6NtkTxdfcptnJ9WiAkaM4Z0FwpqY6SjMpr9
         XTvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=jv+SEUhzXQPwfvwHLLhmXB1j8cfiFmH56jk3io/02x8=;
        b=Uya2zI03+nUTUPlTWF2Rk2bBD6JSgv5WuUddwzxMA0ajVYkkIrliXkmLzk0jrlMzi3
         rMHitTXPLLBsWaDapgJTl3QHvGB7xGNUlsTUpjxKb6IGgRsWxAMpO9yZEp59pKBlPKk7
         gwBeb6QzAP+Bq3Of+jPTUHmmkrZo8IhKMy7T6LMDjgx0tGKanOVe9sYiiWfxLXqsWGzE
         dBIt4mSHcQkfFdeQISZI+4/qdI+nugg7gH3cozLwt7aVDUykqdh8/AevLHS0Ad5NkAjJ
         ZoJh0X/ye/tyVzS6Vsd/e7Vd2EMzqwuB3GugAz/QEWW8yF+cXV0yHQJMxnXxu5W9xrRi
         5H8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id d12si1259988pln.340.2019.01.30.02.33.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jan 2019 02:33:38 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF276EB08;
	Wed, 30 Jan 2019 10:33:38 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1F06EB08
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 30 Jan 2019 10:33:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2019 02:33:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,540,1539673200"; d="scan'208";a="110993041"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.81])
 by orsmga007.jf.intel.com with ESMTP; 30 Jan 2019 02:33:35 -0800
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/i915/gvt: add hotplug emulation
Date: Wed, 30 Jan 2019 18:25:53 +0800
Message-Id: <1548843954-4622-3-git-send-email-hang.yuan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548843954-4622-1-git-send-email-hang.yuan@linux.intel.com>
References: <1548843954-4622-1-git-send-email-hang.yuan@linux.intel.com>
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
Cc: Hang Yuan <hang.yuan@linux.intel.com>, kraxel@redhat.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogSGFuZyBZdWFuIDxoYW5nLnl1YW5AbGludXguaW50ZWwuY29tPgoKQWRkIGZ1bmN0aW9u
IHRvIGVtdWxhdGUgaG90cGx1ZyBpbnRlcnJ1cHQgZm9yIFNLTC9LQkwgcGxhdGZvcm1zCgpTaWdu
ZWQtb2ZmLWJ5OiBIYW5nIFl1YW4gPGhhbmcueXVhbkBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuYyB8IDMwICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5jICAgICB8ICAxICsKIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCAgICAgfCAgMyArKysKIDMgZmlsZXMgY2hhbmdl
ZCwgMzQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGlzcGxheS5jCmluZGV4IDZh
ODZmYWMuLjAzNTQ3OWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kaXNw
bGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2Rpc3BsYXkuYwpAQCAtNDQ2LDYg
KzQ0NiwzNiBAQCB2b2lkIGludGVsX2d2dF9lbXVsYXRlX3ZibGFuayhzdHJ1Y3QgaW50ZWxfZ3Z0
ICpndnQpCiB9CiAKIC8qKgorICogaW50ZWxfdmdwdV9lbXVsYXRlX2hvdHBsdWcgLSB0cmlnZ2Vy
IGhvdHBsdWcgZXZlbnQgZm9yIHZHUFUKKyAqIEB2Z3B1OiBhIHZHUFUKKyAqIEBjb25uY3RlZDog
bGluayBzdGF0ZQorICoKKyAqIFRoaXMgZnVuY3Rpb24gaXMgdXNlZCB0byB0cmlnZ2VyIGhvdHBs
dWcgaW50ZXJydXB0IGZvciB2R1BVCisgKgorICovCit2b2lkIGludGVsX3ZncHVfZW11bGF0ZV9o
b3RwbHVnKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LCBib29sIGNvbm5lY3RlZCkKK3sKKwlzdHJ1
Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB2Z3B1LT5ndnQtPmRldl9wcml2OworCisJ
LyogVE9ETzogYWRkIG1vcmUgcGxhdGZvcm1zIHN1cHBvcnQgKi8KKwlpZiAoSVNfU0tZTEFLRShk
ZXZfcHJpdikgfHwgSVNfS0FCWUxBS0UoZGV2X3ByaXYpKSB7CisJCWlmIChjb25uZWN0ZWQpIHsK
KwkJCXZncHVfdnJlZ190KHZncHUsIFNGVVNFX1NUUkFQKSB8PQorCQkJCVNGVVNFX1NUUkFQX0RE
SURfREVURUNURUQ7CisJCQl2Z3B1X3ZyZWdfdCh2Z3B1LCBTREVJU1IpIHw9IFNERV9QT1JURF9I
T1RQTFVHX0NQVDsKKwkJfSBlbHNlIHsKKwkJCXZncHVfdnJlZ190KHZncHUsIFNGVVNFX1NUUkFQ
KSAmPQorCQkJCX5TRlVTRV9TVFJBUF9ERElEX0RFVEVDVEVEOworCQkJdmdwdV92cmVnX3Qodmdw
dSwgU0RFSVNSKSAmPSB+U0RFX1BPUlREX0hPVFBMVUdfQ1BUOworCQl9CisJCXZncHVfdnJlZ190
KHZncHUsIFNERUlJUikgfD0gU0RFX1BPUlREX0hPVFBMVUdfQ1BUOworCQl2Z3B1X3ZyZWdfdCh2
Z3B1LCBQQ0hfUE9SVF9IT1RQTFVHKSB8PQorCQkJCVBPUlREX0hPVFBMVUdfU1RBVFVTX01BU0s7
CisJCWludGVsX3ZncHVfdHJpZ2dlcl92aXJ0dWFsX2V2ZW50KHZncHUsIERQX0RfSE9UUExVRyk7
CisJfQorfQorCisvKioKICAqIGludGVsX3ZncHVfY2xlYW5fZGlzcGxheSAtIGNsZWFuIHZHUFUg
dmlydHVhbCBkaXNwbGF5IGVtdWxhdGlvbgogICogQHZncHU6IGEgdkdQVQogICoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9ndnQuYwppbmRleCA0ZTg5NDdmLi40M2Y0MjQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndnQvZ3Z0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5j
CkBAIC0xODUsNiArMTg1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbnRlbF9ndnRfb3BzIGlu
dGVsX2d2dF9vcHMgPSB7CiAJLnZncHVfcXVlcnlfcGxhbmUgPSBpbnRlbF92Z3B1X3F1ZXJ5X3Bs
YW5lLAogCS52Z3B1X2dldF9kbWFidWYgPSBpbnRlbF92Z3B1X2dldF9kbWFidWYsCiAJLndyaXRl
X3Byb3RlY3RfaGFuZGxlciA9IGludGVsX3ZncHVfcGFnZV90cmFja19oYW5kbGVyLAorCS5lbXVs
YXRlX2hvdHBsdWcgPSBpbnRlbF92Z3B1X2VtdWxhdGVfaG90cGx1ZywKIH07CiAKIHN0YXRpYyB2
b2lkIGluaXRfZGV2aWNlX2luZm8oc3RydWN0IGludGVsX2d2dCAqZ3Z0KQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L2d2dC5oCmluZGV4IGZiOWNjOTguLjhiY2UwOWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9ndnQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmgKQEAg
LTUzNiw2ICs1MzYsOCBAQCBpbnQgaW50ZWxfdmdwdV9lbXVsYXRlX2NmZ19yZWFkKHN0cnVjdCBp
bnRlbF92Z3B1ICp2Z3B1LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogaW50IGludGVsX3ZncHVfZW11
bGF0ZV9jZmdfd3JpdGUoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCBvZmZz
ZXQsCiAJCXZvaWQgKnBfZGF0YSwgdW5zaWduZWQgaW50IGJ5dGVzKTsKIAordm9pZCBpbnRlbF92
Z3B1X2VtdWxhdGVfaG90cGx1ZyhzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgYm9vbCBjb25uZWN0
ZWQpOworCiBzdGF0aWMgaW5saW5lIHU2NCBpbnRlbF92Z3B1X2dldF9iYXJfZ3BhKHN0cnVjdCBp
bnRlbF92Z3B1ICp2Z3B1LCBpbnQgYmFyKQogewogCS8qIFdlIGFyZSA2NGJpdCBiYXIuICovCkBA
IC01NzcsNiArNTc5LDcgQEAgc3RydWN0IGludGVsX2d2dF9vcHMgewogCWludCAoKnZncHVfZ2V0
X2RtYWJ1Zikoc3RydWN0IGludGVsX3ZncHUgKnZncHUsIHVuc2lnbmVkIGludCk7CiAJaW50ICgq
d3JpdGVfcHJvdGVjdF9oYW5kbGVyKShzdHJ1Y3QgaW50ZWxfdmdwdSAqLCB1NjQsIHZvaWQgKiwK
IAkJCQkgICAgIHVuc2lnbmVkIGludCk7CisJdm9pZCAoKmVtdWxhdGVfaG90cGx1Zykoc3RydWN0
IGludGVsX3ZncHUgKnZncHUsIGJvb2wgY29ubmVjdGVkKTsKIH07CiAKIAotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1k
ZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldgo=
