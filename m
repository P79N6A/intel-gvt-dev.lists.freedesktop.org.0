Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3027746ywo;
        Sun, 7 Apr 2019 22:57:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2Co0U7fvbOUnxDbAwevyqJunOXGOK5zNUWTG5XM4kkawVTkvKjro3T4ZQCDEkdyOQsJ8f
X-Received: by 2002:a17:902:b706:: with SMTP id d6mr28243697pls.250.1554703074472;
        Sun, 07 Apr 2019 22:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554703074; cv=none;
        d=google.com; s=arc-20160816;
        b=hjZfbY9OFL60gGwYbgTbz/II2Ed2QnbvP6LXXUY2tr5JYqybkDnSuLrJV+tTfLUote
         x9OoBa+z0EfYm73FDFQpVGwEkOKOo8YGiO7c7F6z93VKjzO1jQMxtuMkkfoOPumMjHVw
         yl53h7doe2K0oFqTrOh1TCinJjmI7ILsYlWrrxWII6YVxFFQYgINx+kbWeffUbXHst1J
         0un4ox4h+QqAORtjW+Jl9cLHsNL2t2i8+nfRVoeuiJySYSg7fXAB7mWPntPq5hPkHWBv
         jEID9qdCyZRvV9EHznExAOYSvgsi339wRVt0ZCk+z4C/KigkZG3NI5uQyvRNDN424qfW
         aeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=nqIUMl9dYHB1HijGfMi/c+92a+8zR1N4z8Fv3j3LcQ4=;
        b=pB9a+og0LY60Re8lM518p6EPSQVIJ/mMwJveDiif8ZR9ArQUaRxwCU23rnUJoSH/QL
         40fR3qAvZQHCNSJ2gu3KD2LO7afVhoItxtGTCbonH4A9CAUYy99DLO6fS1untbugud3M
         DrOfNeBxEJ0TMHsx4ukZOa54ZmkLEqCigghGRDfJthAm/+dxmEs5C/6OnfBrJuaLH74H
         0P/CbYOR+UrxCPnqMBz76e1R2ke6E7D4tCyIVJAskvSDPH27glp2R7E2COjGbDRW83Ew
         ee9kwjGNn+CGFGGoxLi1RDX+xSYQEJmbc6dDAGb4ZzcVNmXBOP8XAOWjPsPWxM45T/IS
         q9ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id k6si26084727pla.409.2019.04.07.22.57.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2019 22:57:54 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE718926D;
	Mon,  8 Apr 2019 05:57:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEED38926D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2019 05:57:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Apr 2019 22:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,324,1549958400"; d="scan'208";a="148923480"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by orsmga002.jf.intel.com with ESMTP; 07 Apr 2019 22:57:49 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915/gvt: Remove typedef intel_gvt_gtt_type_t
Date: Mon,  8 Apr 2019 08:54:58 +0300
Message-Id: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIGtsb2N3b3JrIHN0YXRpYyBjb2RlIGFuYWx5emVyIHRha2VzIHRoZSBlbnVtZXJhdGlvbiBh
cyB0aGUgZnVsbCByYW5nZQpvZiBpbnRlbF9ndnRfZ3R0X3R5cGVfdC4gQnV0IHRoZSBmdWxsIHJh
bmdlIG9mIGludGVsX2d2dF9ndHRfdHlwZV90IHdpbGwKbmV2ZXIgYmUgdXNlZCBpbiBmdWxsIHJh
bmdlLiBGb3IgZXhhbXBsZSwgdGhlIEdUVF9UWVBFX0lOVkFMSUQgd2lsbCBuZXZlcgpiZSB1c2Vk
IGFzIGFuIGluZGV4IG9mIGFuIGFycmF5LiBTbyB3ZSB3aWxsIG5vdCB1c2UgaXQgYXMgYSB0eXBl
IGJ1dCBvbmx5CnRoZSBlbnVtZXJhdGlvbi4KClRoaXMgcGF0Y2ggZml4ZWQgdGhlIGNyaXRpYWwg
aXNzdWVzICM0ODMsICM1NTEsICM2NjUgcmVwb3J0ZWQgYnkKa2xvY2t3b3JrLgoKU2lnbmVkLW9m
Zi1ieTogQWxla3NlaSBHaW1iaXRza2lpIDxhbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwuY29tPgpD
YzogWmhlbnl1IFdhbmcgPHpoZW55dXdAbGludXguaW50ZWwuY29tPgpDYzogWmhpIFdhbmcgPHpo
aS5hLndhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyB8
IDEyICsrKysrKy0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5oIHwgMTQgKysr
KysrKy0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCmluZGV4IDg4ZWQyZTlkZjI1My4uOGRjYjYyMjNi
OTg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCkBAIC04MDUsNyArODA1LDcgQEAgc3RhdGljIGlu
dCByZWNsYWltX29uZV9wcGd0dF9tbShzdHJ1Y3QgaW50ZWxfZ3Z0ICpndnQpOwogCiAvKiBBbGxv
Y2F0ZSBzaGFkb3cgcGFnZSB0YWJsZSB3aXRob3V0IGd1ZXN0IHBhZ2UuICovCiBzdGF0aWMgc3Ry
dWN0IGludGVsX3ZncHVfcHBndHRfc3B0ICpwcGd0dF9hbGxvY19zcHQoCi0JCXN0cnVjdCBpbnRl
bF92Z3B1ICp2Z3B1LCBpbnRlbF9ndnRfZ3R0X3R5cGVfdCB0eXBlKQorCQlzdHJ1Y3QgaW50ZWxf
dmdwdSAqdmdwdSwgaW50IHR5cGUpCiB7CiAJc3RydWN0IGRldmljZSAqa2RldiA9ICZ2Z3B1LT5n
dnQtPmRldl9wcml2LT5kcm0ucGRldi0+ZGV2OwogCXN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3Nw
dCAqc3B0ID0gTlVMTDsKQEAgLTg1NSw3ICs4NTUsNyBAQCBzdGF0aWMgc3RydWN0IGludGVsX3Zn
cHVfcHBndHRfc3B0ICpwcGd0dF9hbGxvY19zcHQoCiAKIC8qIEFsbG9jYXRlIHNoYWRvdyBwYWdl
IHRhYmxlIGFzc29jaWF0ZWQgd2l0aCBzcGVjaWZpYyBnZm4uICovCiBzdGF0aWMgc3RydWN0IGlu
dGVsX3ZncHVfcHBndHRfc3B0ICpwcGd0dF9hbGxvY19zcHRfZ2ZuKAotCQlzdHJ1Y3QgaW50ZWxf
dmdwdSAqdmdwdSwgaW50ZWxfZ3Z0X2d0dF90eXBlX3QgdHlwZSwKKwkJc3RydWN0IGludGVsX3Zn
cHUgKnZncHUsIGludCB0eXBlLAogCQl1bnNpZ25lZCBsb25nIGdmbiwgYm9vbCBndWVzdF9wZGVf
aXBzKQogewogCXN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCAqc3B0OwpAQCAtOTMwLDcgKzkz
MCw3IEBAIHN0YXRpYyBpbnQgcHBndHRfaW52YWxpZGF0ZV9zcHRfYnlfc2hhZG93X2VudHJ5KHN0
cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAogewogCXN0cnVjdCBpbnRlbF9ndnRfZ3R0X3B0ZV9vcHMg
Km9wcyA9IHZncHUtPmd2dC0+Z3R0LnB0ZV9vcHM7CiAJc3RydWN0IGludGVsX3ZncHVfcHBndHRf
c3B0ICpzOwotCWludGVsX2d2dF9ndHRfdHlwZV90IGN1cl9wdF90eXBlOworCWludCBjdXJfcHRf
dHlwZTsKIAogCUdFTV9CVUdfT04oIWd0dF90eXBlX2lzX3B0KGdldF9uZXh0X3B0X3R5cGUoZS0+
dHlwZSkpKTsKIApAQCAtMTg0OSw3ICsxODQ5LDcgQEAgc3RhdGljIHZvaWQgdmdwdV9mcmVlX21t
KHN0cnVjdCBpbnRlbF92Z3B1X21tICptbSkKICAqIFplcm8gb24gc3VjY2VzcywgbmVnYXRpdmUg
ZXJyb3IgY29kZSBpbiBwb2ludGVyIGlmIGZhaWxlZC4KICAqLwogc3RydWN0IGludGVsX3ZncHVf
bW0gKmludGVsX3ZncHVfY3JlYXRlX3BwZ3R0X21tKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAot
CQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10pCisJCWlu
dCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10pCiB7CiAJc3RydWN0IGludGVsX2d2dCAqZ3Z0
ID0gdmdwdS0+Z3Z0OwogCXN0cnVjdCBpbnRlbF92Z3B1X21tICptbTsKQEAgLTIzMDMsNyArMjMw
Myw3IEBAIGludCBpbnRlbF92Z3B1X2VtdWxhdGVfZ2d0dF9tbWlvX3dyaXRlKHN0cnVjdCBpbnRl
bF92Z3B1ICp2Z3B1LAogfQogCiBzdGF0aWMgaW50IGFsbG9jX3NjcmF0Y2hfcGFnZXMoc3RydWN0
IGludGVsX3ZncHUgKnZncHUsCi0JCWludGVsX2d2dF9ndHRfdHlwZV90IHR5cGUpCisJCWludCB0
eXBlKQogewogCXN0cnVjdCBpbnRlbF92Z3B1X2d0dCAqZ3R0ID0gJnZncHUtPmd0dDsKIAlzdHJ1
Y3QgaW50ZWxfZ3Z0X2d0dF9wdGVfb3BzICpvcHMgPSB2Z3B1LT5ndnQtPmd0dC5wdGVfb3BzOwpA
QCAtMjU4OCw3ICsyNTg4LDcgQEAgc3RydWN0IGludGVsX3ZncHVfbW0gKmludGVsX3ZncHVfZmlu
ZF9wcGd0dF9tbShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwKICAqIFplcm8gb24gc3VjY2Vzcywg
bmVnYXRpdmUgZXJyb3IgY29kZSBpZiBmYWlsZWQuCiAgKi8KIHN0cnVjdCBpbnRlbF92Z3B1X21t
ICppbnRlbF92Z3B1X2dldF9wcGd0dF9tbShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwKLQkJaW50
ZWxfZ3Z0X2d0dF90eXBlX3Qgcm9vdF9lbnRyeV90eXBlLCB1NjQgcGRwc1tdKQorCQlpbnQgcm9v
dF9lbnRyeV90eXBlLCB1NjQgcGRwc1tdKQogewogCXN0cnVjdCBpbnRlbF92Z3B1X21tICptbTsK
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5oIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d0dC5oCmluZGV4IDMyYzU3M2FlYTQ5NC4uNjQ1ZGRjMWJkMjIzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d0dC5oCkBAIC05NSw3ICs5NSw3IEBAIHN0cnVjdCBpbnRlbF9ndnRf
Z3R0IHsKIAl1bnNpZ25lZCBsb25nIHNjcmF0Y2hfbWZuOwogfTsKIAotdHlwZWRlZiBlbnVtIHsK
K2VudW0gewogCUdUVF9UWVBFX0lOVkFMSUQgPSAtMSwKIAogCUdUVF9UWVBFX0dHVFRfUFRFLApA
QCAtMTI0LDcgKzEyNCw3IEBAIHR5cGVkZWYgZW51bSB7CiAJR1RUX1RZUEVfUFBHVFRfUE1MNF9Q
VCwKIAogCUdUVF9UWVBFX01BWCwKLX0gaW50ZWxfZ3Z0X2d0dF90eXBlX3Q7Cit9OwogCiBlbnVt
IGludGVsX2d2dF9tbV90eXBlIHsKIAlJTlRFTF9HVlRfTU1fR0dUVCwKQEAgLTE0OCw3ICsxNDgs
NyBAQCBzdHJ1Y3QgaW50ZWxfdmdwdV9tbSB7CiAKIAl1bmlvbiB7CiAJCXN0cnVjdCB7Ci0JCQlp
bnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGU7CisJCQlpbnQgcm9vdF9lbnRyeV90
eXBlOwogCQkJLyoKIAkJCSAqIFRoZSA0IFBEUHMgaW4gcmluZyBjb250ZXh0LiBGb3IgNDhiaXQg
YWRkcmVzc2luZywKIAkJCSAqIG9ubHkgUERQMCBpcyB2YWxpZCBhbmQgcG9pbnQgdG8gUE1MNC4g
Rm9yIDMyaXQKQEAgLTE2OSw3ICsxNjksNyBAQCBzdHJ1Y3QgaW50ZWxfdmdwdV9tbSB7CiB9Owog
CiBzdHJ1Y3QgaW50ZWxfdmdwdV9tbSAqaW50ZWxfdmdwdV9jcmVhdGVfcHBndHRfbW0oc3RydWN0
IGludGVsX3ZncHUgKnZncHUsCi0JCWludGVsX2d2dF9ndHRfdHlwZV90IHJvb3RfZW50cnlfdHlw
ZSwgdTY0IHBkcHNbXSk7CisJCWludCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10pOwogCiBz
dGF0aWMgaW5saW5lIHZvaWQgaW50ZWxfdmdwdV9tbV9nZXQoc3RydWN0IGludGVsX3ZncHVfbW0g
Km1tKQogewpAQCAtMjMzLDcgKzIzMyw3IEBAIHN0cnVjdCBpbnRlbF92Z3B1X3BwZ3R0X3NwdCB7
CiAJc3RydWN0IGludGVsX3ZncHUgKnZncHU7CiAKIAlzdHJ1Y3QgewotCQlpbnRlbF9ndnRfZ3R0
X3R5cGVfdCB0eXBlOworCQlpbnQgdHlwZTsKIAkJYm9vbCBwZGVfaXBzOyAvKiBmb3IgNjRLQiBQ
VEVzICovCiAJCXZvaWQgKnZhZGRyOwogCQlzdHJ1Y3QgcGFnZSAqcGFnZTsKQEAgLTI0MSw3ICsy
NDEsNyBAQCBzdHJ1Y3QgaW50ZWxfdmdwdV9wcGd0dF9zcHQgewogCX0gc2hhZG93X3BhZ2U7CiAK
IAlzdHJ1Y3QgewotCQlpbnRlbF9ndnRfZ3R0X3R5cGVfdCB0eXBlOworCQlpbnQgdHlwZTsKIAkJ
Ym9vbCBwZGVfaXBzOyAvKiBmb3IgNjRLQiBQVEVzICovCiAJCXVuc2lnbmVkIGxvbmcgZ2ZuOwog
CQl1bnNpZ25lZCBsb25nIHdyaXRlX2NudDsKQEAgLTI2Nyw3ICsyNjcsNyBAQCBzdHJ1Y3QgaW50
ZWxfdmdwdV9tbSAqaW50ZWxfdmdwdV9maW5kX3BwZ3R0X21tKHN0cnVjdCBpbnRlbF92Z3B1ICp2
Z3B1LAogCQl1NjQgcGRwc1tdKTsKIAogc3RydWN0IGludGVsX3ZncHVfbW0gKmludGVsX3ZncHVf
Z2V0X3BwZ3R0X21tKHN0cnVjdCBpbnRlbF92Z3B1ICp2Z3B1LAotCQlpbnRlbF9ndnRfZ3R0X3R5
cGVfdCByb290X2VudHJ5X3R5cGUsIHU2NCBwZHBzW10pOworCQlpbnQgcm9vdF9lbnRyeV90eXBl
LCB1NjQgcGRwc1tdKTsKIAogaW50IGludGVsX3ZncHVfcHV0X3BwZ3R0X21tKHN0cnVjdCBpbnRl
bF92Z3B1ICp2Z3B1LCB1NjQgcGRwc1tdKTsKIAotLSAKMi4xNy4xCgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50
ZWwgRmlubGFuZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVsc2lua2kg
CkJ1c2luZXNzIElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4gSGVsc2lu
a2kgCgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVu
dGlhbCBtYXRlcmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQo
cykuIEFueSByZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9o
aWJpdGVkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2UgY29u
dGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0
CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
