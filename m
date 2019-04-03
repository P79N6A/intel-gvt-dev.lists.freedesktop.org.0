Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2330186ywo;
        Tue, 2 Apr 2019 21:57:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwcy1FxhG5Uy3hwNtyNDB9uAeBaWlncb7j4M1tooNj2BF8t+zXl76Y9KF6IcdIjReLl3Ig0
X-Received: by 2002:a63:d304:: with SMTP id b4mr57509623pgg.300.1554267437188;
        Tue, 02 Apr 2019 21:57:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554267437; cv=none;
        d=google.com; s=arc-20160816;
        b=HvIdhU0CXn4Uoh2pAApQVq1VNfef7kOHaNARJpjYBScnwi326Mcthzv2IyhkAUemtG
         XKeX45OKtngai5WOzxtej+69VaP0NVXQaHIvj26Qsz3Qx66rYpNec6+6w0Fcq7Ak5cSb
         y16NPYAp6P2pYldiM/i8MbSsIZt7sD3ORlpdqH8G01Mcv5xUcUz2y2+Dnl4vucxzi4pf
         OheokTpOwvFREh04sHRtBO5Gjf55UIEQx5K52iGcAiYwbOWuiTTq5HzM/QL8oCr2U4pb
         VmwCVL2a4A+I8WGiQDYW1tfGQQDs3soU//O3BM7vdymgknAcrs6KyycTwAwDH4J6faTt
         kQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=nRgzEMQ06YVzjRzSPf5UGc7CcTKXNtW3uYHN/QQdPwg=;
        b=FwcYvLLCmDWnsz/oqlvXEm1d6Fg8TwtnTBz02S7ZbDwPQ3lIX9mhYbzwoTq+vDkWrt
         dqClPapAM2o72/4ViIfnryKJO7/+r0eCIdSuduFX7tClH5bottPUVRIwfk6ypCFXpkal
         YlkToZUVits2Y+g4q9OdJOTmNgD4u7NDN5ETdiDbZHwbtjWjTWE5jq/Pob7i2R0N1Rye
         tznHOqVkFomg4urfIg5hGSXubH7YBBMTRGDrAy27AifMmQAlC+ctoGY29WU4tMMMd+LR
         F61mU0luDpctGSYSsWQVGZAf7NALQaA8op46PpGMZQJmft0X97CTDo7qbMqVMF5G8mZr
         yz0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id i3si13041242pgh.458.2019.04.02.21.57.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2019 21:57:17 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321E76E811;
	Wed,  3 Apr 2019 04:57:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC5B6E811
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 04:57:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Apr 2019 21:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,303,1549958400"; d="scan'208";a="139538556"
Received: from unknown (HELO xzhan34-rh.bj.intel.com) ([10.238.154.52])
 by orsmga003.jf.intel.com with ESMTP; 02 Apr 2019 21:57:13 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH V2] drm/i915/gvt: addressed guest GPU hang with HWS index mode
Date: Wed,  3 Apr 2019 13:00:46 +0800
Message-Id: <20190403050046.16601-1-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 2.15.1
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

d2l0aCB0aGUgaW50cm9kdWNlIG9mICJzd2l0Y2ggdG8gdXNlIEhXUyBpbmRpY2VzIHJhdGhlciB0
aGFuIGFkZHJlc3MiLApndWVzdCBHUFUgaGFuZyBvYnNlcnZlZCB3aGVuIHJ1bm5pbmcgd29ya2xv
YWRzIHdoaWNoIHdpbGwgdXBkYXRlIHRoZQpzZXFubyB0byB0aGUgcmVhbCBIVyBIV1NQLCBub3Qg
dml0dXJhbCBHUFUgSFdTUCBhbmQgdGhlbiBjYXVzZSBHUFUgaGFuZy4KCnRoaXMgcGF0Y2ggaXMg
dG8gcmV2b2tlIGluZGV4IG1vZGUgaW4gUElQRV9DVFJMIGFuZCBNSV9GTFVTSF9EVyBhbmQKcGF0
Y2ggZ3Vlc3QgR1BVIEhXU1AgYWRkcmVzcyB2YWx1ZSB0byB0aGVzZSBjb21tYW5kcy4KCkZpeGVz
OiA1NDkzOWVhMGIoImRybS9pOTE1OiBTd2l0Y2ggdG8gdXNlIEhXUyBpbmRpY2VzIHJhdGhlciB0
aGFuCmFkZHJlc3NlcyIpCgp2MjogUElQRV9DVFJMIGFuZCBNSV9GTFVTSF9EVyBoYXMgZGlmZmVy
ZW50IGFkZHJlc3Mgb2Zmc2V0LCBvZmZzZXQgaXMKYWxzbyBwYXNzZWQgZm9yIGdtYSBhZGRyZXNz
IHVwZGF0ZS4gPHpoZW55dT4KClNpZ25lZC1vZmYtYnk6IFhpYW9saW4gWmhhbmcgPHhpYW9saW4u
emhhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9jbWRfcGFyc2Vy
LmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvY21kX3BhcnNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJz
ZXIuYwppbmRleCBiNDIwOTE5Mjc5YzcuLjI3MTZmZDM0OWVjYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvY21kX3BhcnNlci5jCkBAIC0xMDcwLDYgKzEwNzAsMTggQEAgc3RhdGljIHN0cnVjdCBj
bWRfaW50ZXJydXB0X2V2ZW50IGNtZF9pbnRlcnJ1cHRfZXZlbnRzW10gPSB7CiAJfSwKIH07CiAK
K3N0YXRpYyBpbnQgaW5kZXhfbW9kZV90b19nbWEoc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpz
LCB1MzIgb2Zmc2V0LCB1MzIgaW5kZXgpCit7CisJdTMyIGdtYTsKKwl1MzIgdmFsOworCisJZ21h
ID0gcy0+dmdwdS0+aHdzX3BnYVtzLT5yaW5nX2lkXSArIGluZGV4OworCXBhdGNoX3ZhbHVlKHMs
IGNtZF9wdHIocywgb2Zmc2V0KSwgZ21hKTsKKwl2YWwgPSBjbWRfdmFsKHMsIG9mZnNldCAtIDEp
ICYgKH5QSVBFX0NPTlRST0xfU1RPUkVfREFUQV9JTkRFWCk7CisJcGF0Y2hfdmFsdWUocywgY21k
X3B0cihzLCBvZmZzZXQgLSAxKSwgdmFsKTsKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGludCBj
bWRfaGFuZGxlcl9waXBlX2NvbnRyb2woc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzKQogewog
CWludCBnbWFkcl9ieXRlcyA9IHMtPnZncHUtPmd2dC0+ZGV2aWNlX2luZm8uZ21hZHJfYnl0ZXNf
aW5fY21kOwpAQCAtMTA5OCw4ICsxMTEwLDExIEBAIHN0YXRpYyBpbnQgY21kX2hhbmRsZXJfcGlw
ZV9jb250cm9sKHN0cnVjdCBwYXJzZXJfZXhlY19zdGF0ZSAqcykKIAkJCQkvKiBTdG9yZSBEYXRh
IEluZGV4ICovCiAJCQkJaWYgKGNtZF92YWwocywgMSkgJiAoMSA8PCAyMSkpCiAJCQkJCWluZGV4
X21vZGUgPSB0cnVlOwotCQkJCXJldCB8PSBjbWRfYWRkcmVzc19hdWRpdChzLCBnbWEsIHNpemVv
Zih1NjQpLAotCQkJCQkJaW5kZXhfbW9kZSk7CisJCQkJaWYgKGluZGV4X21vZGUpCisJCQkJCXJl
dCA9IGluZGV4X21vZGVfdG9fZ21hKHMsIDIsIGdtYSk7CisJCQkJZWxzZQorCQkJCQlyZXQgfD0g
Y21kX2FkZHJlc3NfYXVkaXQocywgZ21hLAorCQkJCQkJc2l6ZW9mKHU2NCksIGluZGV4X21vZGUp
OwogCQkJfQogCQl9CiAJfQpAQCAtMTYwNyw3ICsxNjIyLDExIEBAIHN0YXRpYyBpbnQgY21kX2hh
bmRsZXJfbWlfZmx1c2hfZHcoc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzKQogCQkvKiBTdG9y
ZSBEYXRhIEluZGV4ICovCiAJCWlmIChjbWRfdmFsKHMsIDApICYgKDEgPDwgMjEpKQogCQkJaW5k
ZXhfbW9kZSA9IHRydWU7Ci0JCXJldCA9IGNtZF9hZGRyZXNzX2F1ZGl0KHMsIGdtYSwgc2l6ZW9m
KHU2NCksIGluZGV4X21vZGUpOworCQlpZiAoaW5kZXhfbW9kZSkKKwkJCXJldCA9IGluZGV4X21v
ZGVfdG9fZ21hKHMsIDEsIGdtYSk7CisJCWVsc2UKKwkJCXJldCA9IGNtZF9hZGRyZXNzX2F1ZGl0
KHMsIGdtYSwKKwkJCQkJc2l6ZW9mKHU2NCksIGluZGV4X21vZGUpOwogCX0KIAkvKiBDaGVjayBu
b3RpZnkgYml0ICovCiAJaWYgKChjbWRfdmFsKHMsIDApICYgKDEgPDwgOCkpKQotLSAKMi4xNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1n
dnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1k
ZXY=
