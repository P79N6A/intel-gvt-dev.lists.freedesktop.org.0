Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp1662117ywd;
        Thu, 10 Jan 2019 03:12:11 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7/ytxDVCLoY1g/c94EKKVCv0MmJR8s2ppp1esuf2PnVH+AynFUcAEeskhDoG/wr5oXhamG
X-Received: by 2002:a63:b30f:: with SMTP id i15mr9033100pgf.240.1547118731288;
        Thu, 10 Jan 2019 03:12:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547118731; cv=none;
        d=google.com; s=arc-20160816;
        b=PWxKMaNAkkxMltuJf3XjTJLbxdYQDFJEC5rE3y7La1QV6wZBCg+zLtqNuChLWmu34o
         NQnepU3koWR0qQ9IY/mtrr0SXurDWSwZ1mnYWbBgMEgXzwI83koxTMQaiSOS7InLLdUz
         mt6G6twSa18F9cbHA7zsDmsZTKdTY8Q5T/tv3bg+zRfwbLgxBHlePnVqyOhnFAyMzH4P
         9rDOf/EkKIgOszF5XdZze39s5OPGVFm+c3WhzpZKIq3Xe3varkVh7356rwAcibDJcfC7
         MhS6uG8z9jWu7zwDX+xwsgBW26XQMmus6df18fR4kL0/4GP/i/fgV/1mG3nZ3qmrhSVD
         AO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=T/Kf3iIiOgq+Q8aRM7FXg6TELkJSpM+OG5RCutmagcE=;
        b=yPQ13vcjnnlwIxERp7KM3wbR/hqL5JHI6k3gYQljGh8pJjCeOYsNyxBrBiMq98f987
         /yWqL9ma+AyIlYoRPYLpwpzC0vmPF+Ua8BzoO7LjCVompHQUYYBqmurXtONSmEAoV7aD
         o/5EDepMSyn/+JS6odcGUezK+JjVvikNOjTo25WHaBLJHumJbda18pfF/OqHy6M6qlap
         +8zScnm8Me8mLx0RD4/un92q8tg+6dRf1Gt6KeouAnCljnTjl5yMPJWyp8+aiTFf1ZQN
         sU+jEz8m9sI8GlVStdrcZHtcefbk963idKNMb3sM45X5slYa3XK/R764IEUMYZg40ti2
         tZsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id j11si4356440plb.253.2019.01.10.03.12.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jan 2019 03:12:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F336F2AB;
	Thu, 10 Jan 2019 11:12:10 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72966F2A9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 10 Jan 2019 11:12:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2019 03:12:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,461,1539673200"; d="scan'208";a="290468356"
Received: from henry-optiplex-7050.bj.intel.com ([10.238.157.81])
 by orsmga005.jf.intel.com with ESMTP; 10 Jan 2019 03:12:08 -0800
From: hang.yuan@linux.intel.com
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v1 3/4] drm/i915/gvt: add hotplug emulation
Date: Thu, 10 Jan 2019 19:04:47 +0800
Message-Id: <1547118288-1001-4-git-send-email-hang.yuan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
References: <1547118288-1001-1-git-send-email-hang.yuan@linux.intel.com>
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
L2d2dC5oCmluZGV4IDhhNGNmOTkuLjBiYTRiNDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
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
